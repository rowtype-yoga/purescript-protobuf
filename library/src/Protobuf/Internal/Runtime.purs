-- | This module is for import by the generated .purs message modules.
module Protobuf.Internal.Runtime
  ( parseMessage
  , UnknownField(..)
  , parseFieldUnknown
  , putFieldUnknown
  , parseLenDel
  , FieldNumberInt
  , manyLength
  , putLenDel
  , putOptional
  , putRepeated
  , putPacked
  , putEnumField
  , putEnum
  , parseEnum
  , mergeWith
  ) where

import Prelude

import Control.Monad.Rec.Class (class MonadRec, tailRecM, Step(..))
import Control.Monad.Trans.Class (lift)
import Data.Array (snoc, foldRecM)
import Data.Array as Array
import Data.ArrayBuffer.Builder (DataBuff(..), PutM, subBuilder)
import Data.ArrayBuffer.DataView (byteLength)
import Data.ArrayBuffer.Types (DataView, ByteLength)
import Data.Enum (class BoundedEnum, fromEnum, toEnum)
import Data.Foldable (foldl)
import Data.Generic.Rep (class Generic)
import Data.Int64 as Int64
import Data.List (List, (:))
import Data.List as List
import Data.Maybe (Maybe(..))
import Data.Show.Generic (genericShow)
import Data.Tuple (Tuple(..))
import Data.UInt as UInt
import Data.UInt64 (UInt64)
import Data.UInt64 as UInt64
import Effect.Class (class MonadEffect)
import Parsing (ParserT, Position(..), fail, position)
import Parsing.Combinators (lookAhead)
import Parsing.DataView (takeN, takeRest)
import Protobuf.Internal.Common (Bytes(..), FieldNumber, WireType(..), label)
import Protobuf.Internal.Decode as Decode
import Protobuf.Internal.Encode as Encode
import Record.Builder (build, modify)
import Record.Builder as RecordB
import Type.Proxy (Proxy(..))

-- | The parseField argument is a parser which returns a Record builder which,
-- | when applied to a Record, will modify the Record to add the parsed field.
parseMessage ::
  forall m a r.
  MonadEffect m =>
  MonadRec m =>
  (Record r -> a) ->
  (Record r) ->
  (FieldNumberInt -> WireType -> ParserT DataView m (RecordB.Builder (Record r) (Record r))) ->
  ByteLength ->
  ParserT DataView m a
parseMessage construct default parseField length = do
  builders <- manyLength applyParser length
  pure $ construct $ build (foldl (>>>) identity builders) default
  where
  applyParser = do
    Tuple fieldNumber wireType <- Decode.decodeTag32
    if fieldNumber == UInt.fromInt 0 then
      fail "Field number 0 not allowed." -- Conformance tests require this
    else
      parseField (UInt.toInt fieldNumber) wireType

-- | We want an Int FieldNumber to pass to parseField so that we can pattern
-- | match on Int literals. UInt doesn't export any constructors, so we can’t
-- | pattern match on it.
type FieldNumberInt
  = Int

-- | Call a parser repeatedly until exactly *N* bytes have been consumed.
-- | Will fail if not enough bytes remain in the DataView.
-- | Will fail if too many bytes are consumed.
manyLength ::
  forall m a.
  MonadEffect m =>
  MonadRec m =>
  ParserT DataView m a ->
  ByteLength ->
  ParserT DataView m (Array a)
manyLength p len = do
  remaining_bytes :: Int <- byteLength <$> lookAhead takeRest
  if remaining_bytes < len
    then do
      fail $ "manyLength " <> show len <> " not enough bytes of input " <> show remaining_bytes <> " remaining"
    else do
      Position { index: posBegin } <- position
      let
        go :: List a -> ParserT DataView m (Step (List a) (List a))
        go accum = do
          Position { index: pos } <- position
          case compare (pos - posBegin) len of
            GT -> fail $ "manyLength " <> show len <> " consumed too many bytes " <> (show $ pos - posBegin)
            EQ -> lift $ pure (Done accum)
            LT -> do
              x <- p
              pure (Loop (x : accum))
      -- https://github.com/purescript-contrib/purescript-parsing/pull/199#issuecomment-1145956271
      Array.reverse <$> Array.fromFoldable <$> tailRecM go List.Nil

-- | A message field value from an unknown `.proto` definition.
-- |
-- | See [Message Structure](https://protobuf.dev/programming-guides/encoding#structure)
-- | for an explanation.
-- |
-- | - __`UnknownVarInt`__ Use `Protobuf.Internal.Decode.decodeZigzag64`
-- |   to interpret this as a signed integer.
-- | - __`UnknownLenDel`__ holds a variable-length `Bytes`.
-- | - __`UnknownBits64`__ must hold `Bytes` of length 8.
-- | - __`UnknownBits32`__ must hold `Bytes` of length 4.
-- |
-- | See the modules __Protobuf.Internal.Encode__
-- | and __Protobuf.Internal.Decode__ for ways to operate on the `Bytes`.
data UnknownField
  = UnknownVarInt FieldNumber UInt64
  | UnknownBits64 FieldNumber Bytes
  | UnknownLenDel FieldNumber Bytes
  | UnknownBits32 FieldNumber Bytes

derive instance eqUnknownField :: Eq UnknownField

derive instance genericUnknownField :: Generic UnknownField _

instance showUnknownField :: Show UnknownField where
  show = genericShow

-- | Parse and preserve an unknown field.
parseFieldUnknown ::
  forall m r.
  MonadEffect m =>
  Int ->
  WireType ->
  ParserT DataView m (RecordB.Builder (Record ( "__unknown_fields" :: Array UnknownField | r )) (Record ( "__unknown_fields" :: Array UnknownField | r )))
parseFieldUnknown fieldNumberInt wireType =
  label ("Unknown " <> show wireType <> " " <> show fieldNumber <> " / ")
    $ case wireType of
        VarInt -> do
          x <- Decode.decodeUint64
          pure $ modify (Proxy :: Proxy "__unknown_fields")
            $ flip snoc
            $ UnknownVarInt fieldNumber x
        Bits64 -> do
          x <- takeN 8
          pure $ modify (Proxy :: Proxy "__unknown_fields")
            $ flip snoc
            $ UnknownBits64 fieldNumber $ Bytes $ View x
        LenDel -> do
          len <- UInt64.toInt <$> Decode.decodeVarint64
          case len of
            Nothing -> fail $ "Length-delimited value of unknown field " <> show fieldNumber <> " was too long."
            Just l -> do
              dv <- takeN l
              pure $ modify (Proxy :: Proxy "__unknown_fields")
                $ flip snoc $ UnknownLenDel fieldNumber $ Bytes $ View dv
        Bits32 -> do
          x <- takeN 4
          pure $ modify (Proxy :: Proxy "__unknown_fields")
            $ flip snoc
            $ UnknownBits32 fieldNumber $ Bytes $ View x
  where
  fieldNumber = UInt.fromInt fieldNumberInt

putFieldUnknown ::
  forall m.
  MonadEffect m =>
  UnknownField ->
  PutM m Unit
putFieldUnknown (UnknownBits64 fieldNumber x) = Encode.encodeBytesField fieldNumber x

putFieldUnknown (UnknownVarInt fieldNumber x) = Encode.encodeUint64Field fieldNumber x

putFieldUnknown (UnknownLenDel fieldNumber x) = Encode.encodeBytesField fieldNumber x

putFieldUnknown (UnknownBits32 fieldNumber x) = Encode.encodeBytesField fieldNumber x

-- | Parse a bytelength, then call a parser which takes one bytelength as its argument.
parseLenDel ::
  forall m a.
  MonadEffect m =>
  (Int -> ParserT DataView m a) ->
  ParserT DataView m a
parseLenDel p = do
  len <- UInt.toInt <$> Decode.decodeVarint32
  remaining_bytes :: Int <- byteLength <$> lookAhead takeRest
  if remaining_bytes < len
    then do
      fail $ "parseLenDel " <> show len <> " not enough bytes of input " <> show remaining_bytes <> " remaining"
    else do
      p len

putLenDel ::
  forall m a.
  MonadEffect m =>
  (a -> PutM m Unit) ->
  FieldNumber -> a -> PutM m Unit
putLenDel p fieldNumber x = do
  b <- subBuilder $ p x
  Encode.encodeBuilder fieldNumber b

putOptional ::
  forall m a.
  MonadEffect m =>
  FieldNumberInt ->
  Maybe a ->
  (a -> Boolean) -> -- isDefault predicate. Put nothing if this is true.
  (FieldNumber -> a -> PutM m Unit) ->
  PutM m Unit
putOptional _ Nothing _ _ = pure unit

putOptional fieldNumber (Just x) isDefault encoder = do
  when (not $ isDefault x) $ encoder (UInt.fromInt fieldNumber) x

putRepeated ::
  forall m a.
  MonadEffect m =>
  MonadRec m =>
  FieldNumberInt ->
  Array a ->
  (FieldNumber -> a -> PutM m Unit) ->
  PutM m Unit
putRepeated fieldNumber xs encoder = foldRecM (\_ x -> encoder fn x) unit xs
  where
    fn = UInt.fromInt fieldNumber

putPacked ::
  forall m a.
  MonadEffect m =>
  MonadRec m =>
  FieldNumberInt ->
  Array a ->
  (a -> PutM m Unit) ->
  PutM m Unit
putPacked _ [] _ = pure unit

putPacked fieldNumber xs encoder = do
  b <- subBuilder $ foldRecM (\_ x -> encoder x) unit xs
  Encode.encodeBuilder (UInt.fromInt fieldNumber) b

putEnumField ::
  forall m a.
  MonadEffect m =>
  BoundedEnum a =>
  FieldNumber -> a -> PutM m Unit
putEnumField fieldNumber x = do
  Encode.encodeTag32 fieldNumber VarInt
  putEnum x

putEnum :: forall m a. MonadEffect m => BoundedEnum a => a -> PutM m Unit
putEnum x = Encode.encodeVarint64 (UInt64.fromLowHighBits x_low x_high :: UInt64)
  where
  x_int = fromEnum x

  x_slong = Int64.fromInt x_int

  x_high = Int64.highBits x_slong

  x_low = Int64.lowBits x_slong

parseEnum :: forall m a. MonadEffect m => BoundedEnum a => ParserT DataView m a
parseEnum = do
  -- “Enumerator constants must be in the range of a 32-bit integer.”
  -- Protobuf Enums can be negative.
  -- https://protobuf.dev/programming-guides/proto3#enum
  x <- Decode.decodeVarint64
  case toEnum (UInt64.lowBits x) of
    Nothing -> fail $ "Enum " <> show x <> " out of bounds."
    Just e -> pure e

-- | Merge the new left with the old right.
mergeWith :: forall a. (a -> a -> a) -> Maybe a -> Maybe a -> Maybe a
mergeWith f (Just l) (Just r) = Just (f l r)

mergeWith _ l Nothing = l

mergeWith _ Nothing r = r
