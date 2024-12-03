-- | Generated by __protobuf__ from file `google/protobuf/empty.proto`
module Google.Protobuf.Empty
( Empty(..), EmptyRow, EmptyR, parseEmpty, putEmpty, defaultEmpty, mkEmpty, mergeEmpty
)
where
import Protobuf.Internal.Prelude
import Protobuf.Internal.Prelude as Prelude




-- | Message generated by __protobuf__ from `google.protobuf.Empty`
-- | 
-- | A generic empty message that you can re-use to avoid defining duplicated
-- | empty messages in your APIs. A typical example is to use it as the request
-- | or the response type of an API method. For instance:
-- | 
-- |     service Foo {
-- |       rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
-- |     }
-- | 
newtype Empty = Empty EmptyR
type EmptyRow =
  ( __unknown_fields :: Array Prelude.UnknownField
  )
type EmptyR = Record EmptyRow
derive instance genericEmpty :: Prelude.Generic Empty _
derive instance newtypeEmpty :: Prelude.Newtype Empty _
derive instance eqEmpty :: Prelude.Eq Empty
instance showEmpty :: Prelude.Show Empty where show x = Prelude.genericShow x

putEmpty :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Empty -> Prelude.PutM m Prelude.Unit
putEmpty (Empty r) = do

  Prelude.foldRecM (\_ x -> Prelude.putFieldUnknown x) unit r.__unknown_fields

parseEmpty :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Prelude.ByteLength -> Prelude.ParserT Prelude.DataView m Empty
parseEmpty length = Prelude.label "Empty / " $
  Prelude.parseMessage Empty defaultEmpty parseField length
 where
  parseField
    :: Prelude.FieldNumberInt
    -> Prelude.WireType
    -> Prelude.ParserT Prelude.DataView m (Prelude.Builder EmptyR EmptyR)

  parseField fieldNumber wireType = Prelude.parseFieldUnknown fieldNumber wireType

defaultEmpty :: EmptyR
defaultEmpty =
  { __unknown_fields: []
  }

mkEmpty :: forall r1 r3. Prelude.Union r1 EmptyRow r3 => Prelude.Nub r3 EmptyRow => Record r1 -> Empty
mkEmpty r = Empty $ Prelude.merge r defaultEmpty

mergeEmpty :: Empty -> Empty -> Empty
mergeEmpty (Empty l) (Empty r) = Empty
  { __unknown_fields: r.__unknown_fields <> l.__unknown_fields
  }

