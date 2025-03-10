-- | Generated by __protobuf__ from file `msg3.proto`
module Pack3.Msg3
( Msg3(..), Msg3Row, Msg3R, parseMsg3, putMsg3, defaultMsg3, mkMsg3, mergeMsg3
, Msg3_Msg4(..), Msg3_Msg4Row, Msg3_Msg4R, parseMsg3_Msg4, putMsg3_Msg4, defaultMsg3_Msg4, mkMsg3_Msg4, mergeMsg3_Msg4
)
where
import Protobuf.Internal.Prelude
import Protobuf.Internal.Prelude as Prelude

import Pack.Msg1 as Pack
import Pack.Msg2 as Pack



-- | Message generated by __protobuf__ from `pack3.msg3`
newtype Msg3 = Msg3 Msg3R
type Msg3Row =
  ( f1 :: Array Pack.Msg1
  , f2 :: Array Pack.Msg2
  , f4 :: Array Msg3_Msg4
  , __unknown_fields :: Array Prelude.UnknownField
  )
type Msg3R = Record Msg3Row
derive instance genericMsg3 :: Prelude.Generic Msg3 _
derive instance newtypeMsg3 :: Prelude.Newtype Msg3 _
derive instance eqMsg3 :: Prelude.Eq Msg3
instance showMsg3 :: Prelude.Show Msg3 where show x = Prelude.genericShow x

putMsg3 :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Msg3 -> Prelude.PutM m Prelude.Unit
putMsg3 (Msg3 r) = do
  Prelude.putRepeated 1 r.f1 $ Prelude.putLenDel Pack.putMsg1
  Prelude.putRepeated 2 r.f2 $ Prelude.putLenDel Pack.putMsg2
  Prelude.putRepeated 4 r.f4 $ Prelude.putLenDel putMsg3_Msg4
  Prelude.foldRecM (\_ x -> Prelude.putFieldUnknown x) unit r.__unknown_fields

parseMsg3 :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Prelude.ByteLength -> Prelude.ParserT Prelude.DataView m Msg3
parseMsg3 length = Prelude.label "msg3 / " $
  Prelude.parseMessage Msg3 defaultMsg3 parseField length
 where
  parseField
    :: Prelude.FieldNumberInt
    -> Prelude.WireType
    -> Prelude.ParserT Prelude.DataView m (Prelude.Builder Msg3R Msg3R)
  parseField 1 Prelude.LenDel = Prelude.label "f1 / " $ do
    x <- Prelude.parseLenDel Pack.parseMsg1
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "f1") $ Prelude.flip Prelude.snoc x
  parseField 2 Prelude.LenDel = Prelude.label "f2 / " $ do
    x <- Prelude.parseLenDel Pack.parseMsg2
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "f2") $ Prelude.flip Prelude.snoc x
  parseField 4 Prelude.LenDel = Prelude.label "f4 / " $ do
    x <- Prelude.parseLenDel parseMsg3_Msg4
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "f4") $ Prelude.flip Prelude.snoc x
  parseField fieldNumber wireType = Prelude.parseFieldUnknown fieldNumber wireType

defaultMsg3 :: Msg3R
defaultMsg3 =
  { f1: []
  , f2: []
  , f4: []
  , __unknown_fields: []
  }

mkMsg3 :: forall r1 r3. Prelude.Union r1 Msg3Row r3 => Prelude.Nub r3 Msg3Row => Record r1 -> Msg3
mkMsg3 r = Msg3 $ Prelude.merge r defaultMsg3

mergeMsg3 :: Msg3 -> Msg3 -> Msg3
mergeMsg3 (Msg3 l) (Msg3 r) = Msg3
  { f1: r.f1 <> l.f1
  , f2: r.f2 <> l.f2
  , f4: r.f4 <> l.f4
  , __unknown_fields: r.__unknown_fields <> l.__unknown_fields
  }


-- | Message generated by __protobuf__ from `pack3.msg3.msg4`
newtype Msg3_Msg4 = Msg3_Msg4 Msg3_Msg4R
type Msg3_Msg4Row =
  ( f1 :: Prelude.Maybe Int
  , __unknown_fields :: Array Prelude.UnknownField
  )
type Msg3_Msg4R = Record Msg3_Msg4Row
derive instance genericMsg3_Msg4 :: Prelude.Generic Msg3_Msg4 _
derive instance newtypeMsg3_Msg4 :: Prelude.Newtype Msg3_Msg4 _
derive instance eqMsg3_Msg4 :: Prelude.Eq Msg3_Msg4
instance showMsg3_Msg4 :: Prelude.Show Msg3_Msg4 where show x = Prelude.genericShow x

putMsg3_Msg4 :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Msg3_Msg4 -> Prelude.PutM m Prelude.Unit
putMsg3_Msg4 (Msg3_Msg4 r) = do
  Prelude.putOptional 1 r.f1 Prelude.isDefault Prelude.encodeInt32Field
  Prelude.foldRecM (\_ x -> Prelude.putFieldUnknown x) unit r.__unknown_fields

parseMsg3_Msg4 :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Prelude.ByteLength -> Prelude.ParserT Prelude.DataView m Msg3_Msg4
parseMsg3_Msg4 length = Prelude.label "msg4 / " $
  Prelude.parseMessage Msg3_Msg4 defaultMsg3_Msg4 parseField length
 where
  parseField
    :: Prelude.FieldNumberInt
    -> Prelude.WireType
    -> Prelude.ParserT Prelude.DataView m (Prelude.Builder Msg3_Msg4R Msg3_Msg4R)
  parseField 1 Prelude.VarInt = Prelude.label "f1 / " $ do
    x <- Prelude.decodeInt32
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "f1") $ \_ -> Prelude.Just x
  parseField fieldNumber wireType = Prelude.parseFieldUnknown fieldNumber wireType

defaultMsg3_Msg4 :: Msg3_Msg4R
defaultMsg3_Msg4 =
  { f1: Prelude.Nothing
  , __unknown_fields: []
  }

mkMsg3_Msg4 :: forall r1 r3. Prelude.Union r1 Msg3_Msg4Row r3 => Prelude.Nub r3 Msg3_Msg4Row => Record r1 -> Msg3_Msg4
mkMsg3_Msg4 r = Msg3_Msg4 $ Prelude.merge r defaultMsg3_Msg4

mergeMsg3_Msg4 :: Msg3_Msg4 -> Msg3_Msg4 -> Msg3_Msg4
mergeMsg3_Msg4 (Msg3_Msg4 l) (Msg3_Msg4 r) = Msg3_Msg4
  { f1: Prelude.alt l.f1 r.f1
  , __unknown_fields: r.__unknown_fields <> l.__unknown_fields
  }


