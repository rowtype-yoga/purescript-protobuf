-- | Generated by __protobuf__ from file `msg4.proto`
module Pack4.Msg4
( Msg2(..), Msg2Row, Msg2R, parseMsg2, putMsg2, defaultMsg2, mkMsg2, mergeMsg2
, Msg1(..), Msg1Row, Msg1R, parseMsg1, putMsg1, defaultMsg1, mkMsg1, mergeMsg1
, Msg1_Msg2(..), Msg1_Msg2Row, Msg1_Msg2R, parseMsg1_Msg2, putMsg1_Msg2, defaultMsg1_Msg2, mkMsg1_Msg2, mergeMsg1_Msg2
, Msg1_MappyEntry(..), Msg1_MappyEntryRow, Msg1_MappyEntryR, parseMsg1_MappyEntry, putMsg1_MappyEntry, defaultMsg1_MappyEntry, mkMsg1_MappyEntry, mergeMsg1_MappyEntry
)
where
import Protobuf.Internal.Prelude
import Protobuf.Internal.Prelude as Prelude




-- | Message generated by __protobuf__ from `pack4.msg2`
newtype Msg2 = Msg2 Msg2R
type Msg2Row =
  ( f1 :: Prelude.Maybe Msg1_Msg2
  , __unknown_fields :: Array Prelude.UnknownField
  )
type Msg2R = Record Msg2Row
derive instance genericMsg2 :: Prelude.Generic Msg2 _
derive instance newtypeMsg2 :: Prelude.Newtype Msg2 _
derive instance eqMsg2 :: Prelude.Eq Msg2
instance showMsg2 :: Prelude.Show Msg2 where show x = Prelude.genericShow x

putMsg2 :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Msg2 -> Prelude.PutM m Prelude.Unit
putMsg2 (Msg2 r) = do
  Prelude.putOptional 1 r.f1 (\_ -> false) $ Prelude.putLenDel putMsg1_Msg2
  Prelude.foldRecM (\_ x -> Prelude.putFieldUnknown x) unit r.__unknown_fields

parseMsg2 :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Prelude.ByteLength -> Prelude.ParserT Prelude.DataView m Msg2
parseMsg2 length = Prelude.label "msg2 / " $
  Prelude.parseMessage Msg2 defaultMsg2 parseField length
 where
  parseField
    :: Prelude.FieldNumberInt
    -> Prelude.WireType
    -> Prelude.ParserT Prelude.DataView m (Prelude.Builder Msg2R Msg2R)
  parseField 1 Prelude.LenDel = Prelude.label "F1 / " $ do
    x <- Prelude.parseLenDel parseMsg1_Msg2
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "f1") $ Prelude.Just Prelude.<<< Prelude.maybe x (mergeMsg1_Msg2 x)
  parseField fieldNumber wireType = Prelude.parseFieldUnknown fieldNumber wireType

defaultMsg2 :: Msg2R
defaultMsg2 =
  { f1: Prelude.Nothing
  , __unknown_fields: []
  }

mkMsg2 :: forall r1 r3. Prelude.Union r1 Msg2Row r3 => Prelude.Nub r3 Msg2Row => Record r1 -> Msg2
mkMsg2 r = Msg2 $ Prelude.merge r defaultMsg2

mergeMsg2 :: Msg2 -> Msg2 -> Msg2
mergeMsg2 (Msg2 l) (Msg2 r) = Msg2
  { f1: Prelude.mergeWith mergeMsg1_Msg2 l.f1 r.f1
  , __unknown_fields: r.__unknown_fields <> l.__unknown_fields
  }


-- | Message generated by __protobuf__ from `pack4.msg1`
newtype Msg1 = Msg1 Msg1R
type Msg1Row =
  ( nested :: Prelude.Maybe String
  , mappy :: Array Msg1_MappyEntry
  , __unknown_fields :: Array Prelude.UnknownField
  )
type Msg1R = Record Msg1Row
derive instance genericMsg1 :: Prelude.Generic Msg1 _
derive instance newtypeMsg1 :: Prelude.Newtype Msg1 _
derive instance eqMsg1 :: Prelude.Eq Msg1
instance showMsg1 :: Prelude.Show Msg1 where show x = Prelude.genericShow x

putMsg1 :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Msg1 -> Prelude.PutM m Prelude.Unit
putMsg1 (Msg1 r) = do
  Prelude.putOptional 1 r.nested Prelude.isDefault Prelude.encodeStringField
  Prelude.putRepeated 2 r.mappy $ Prelude.putLenDel putMsg1_MappyEntry
  Prelude.foldRecM (\_ x -> Prelude.putFieldUnknown x) unit r.__unknown_fields

parseMsg1 :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Prelude.ByteLength -> Prelude.ParserT Prelude.DataView m Msg1
parseMsg1 length = Prelude.label "msg1 / " $
  Prelude.parseMessage Msg1 defaultMsg1 parseField length
 where
  parseField
    :: Prelude.FieldNumberInt
    -> Prelude.WireType
    -> Prelude.ParserT Prelude.DataView m (Prelude.Builder Msg1R Msg1R)
  parseField 1 Prelude.LenDel = Prelude.label "Nested / " $ do
    x <- Prelude.decodeString
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "nested") $ \_ -> Prelude.Just x
  parseField 2 Prelude.LenDel = Prelude.label "mappy / " $ do
    x <- Prelude.parseLenDel parseMsg1_MappyEntry
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "mappy") $ Prelude.flip Prelude.snoc x
  parseField fieldNumber wireType = Prelude.parseFieldUnknown fieldNumber wireType

defaultMsg1 :: Msg1R
defaultMsg1 =
  { nested: Prelude.Nothing
  , mappy: []
  , __unknown_fields: []
  }

mkMsg1 :: forall r1 r3. Prelude.Union r1 Msg1Row r3 => Prelude.Nub r3 Msg1Row => Record r1 -> Msg1
mkMsg1 r = Msg1 $ Prelude.merge r defaultMsg1

mergeMsg1 :: Msg1 -> Msg1 -> Msg1
mergeMsg1 (Msg1 l) (Msg1 r) = Msg1
  { nested: Prelude.alt l.nested r.nested
  , mappy: r.mappy <> l.mappy
  , __unknown_fields: r.__unknown_fields <> l.__unknown_fields
  }


-- | Message generated by __protobuf__ from `pack4.msg1.msg2`
newtype Msg1_Msg2 = Msg1_Msg2 Msg1_Msg2R
type Msg1_Msg2Row =
  ( nested :: Prelude.Maybe String
  , __unknown_fields :: Array Prelude.UnknownField
  )
type Msg1_Msg2R = Record Msg1_Msg2Row
derive instance genericMsg1_Msg2 :: Prelude.Generic Msg1_Msg2 _
derive instance newtypeMsg1_Msg2 :: Prelude.Newtype Msg1_Msg2 _
derive instance eqMsg1_Msg2 :: Prelude.Eq Msg1_Msg2
instance showMsg1_Msg2 :: Prelude.Show Msg1_Msg2 where show x = Prelude.genericShow x

putMsg1_Msg2 :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Msg1_Msg2 -> Prelude.PutM m Prelude.Unit
putMsg1_Msg2 (Msg1_Msg2 r) = do
  Prelude.putOptional 1 r.nested Prelude.isDefault Prelude.encodeStringField
  Prelude.foldRecM (\_ x -> Prelude.putFieldUnknown x) unit r.__unknown_fields

parseMsg1_Msg2 :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Prelude.ByteLength -> Prelude.ParserT Prelude.DataView m Msg1_Msg2
parseMsg1_Msg2 length = Prelude.label "msg2 / " $
  Prelude.parseMessage Msg1_Msg2 defaultMsg1_Msg2 parseField length
 where
  parseField
    :: Prelude.FieldNumberInt
    -> Prelude.WireType
    -> Prelude.ParserT Prelude.DataView m (Prelude.Builder Msg1_Msg2R Msg1_Msg2R)
  parseField 1 Prelude.LenDel = Prelude.label "Nested / " $ do
    x <- Prelude.decodeString
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "nested") $ \_ -> Prelude.Just x
  parseField fieldNumber wireType = Prelude.parseFieldUnknown fieldNumber wireType

defaultMsg1_Msg2 :: Msg1_Msg2R
defaultMsg1_Msg2 =
  { nested: Prelude.Nothing
  , __unknown_fields: []
  }

mkMsg1_Msg2 :: forall r1 r3. Prelude.Union r1 Msg1_Msg2Row r3 => Prelude.Nub r3 Msg1_Msg2Row => Record r1 -> Msg1_Msg2
mkMsg1_Msg2 r = Msg1_Msg2 $ Prelude.merge r defaultMsg1_Msg2

mergeMsg1_Msg2 :: Msg1_Msg2 -> Msg1_Msg2 -> Msg1_Msg2
mergeMsg1_Msg2 (Msg1_Msg2 l) (Msg1_Msg2 r) = Msg1_Msg2
  { nested: Prelude.alt l.nested r.nested
  , __unknown_fields: r.__unknown_fields <> l.__unknown_fields
  }


-- | Message generated by __protobuf__ from `pack4.msg1.MappyEntry`
newtype Msg1_MappyEntry = Msg1_MappyEntry Msg1_MappyEntryR
type Msg1_MappyEntryRow =
  ( key :: Prelude.Maybe String
  , value :: Prelude.Maybe String
  , __unknown_fields :: Array Prelude.UnknownField
  )
type Msg1_MappyEntryR = Record Msg1_MappyEntryRow
derive instance genericMsg1_MappyEntry :: Prelude.Generic Msg1_MappyEntry _
derive instance newtypeMsg1_MappyEntry :: Prelude.Newtype Msg1_MappyEntry _
derive instance eqMsg1_MappyEntry :: Prelude.Eq Msg1_MappyEntry
instance showMsg1_MappyEntry :: Prelude.Show Msg1_MappyEntry where show x = Prelude.genericShow x

putMsg1_MappyEntry :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Msg1_MappyEntry -> Prelude.PutM m Prelude.Unit
putMsg1_MappyEntry (Msg1_MappyEntry r) = do
  Prelude.putOptional 1 r.key Prelude.isDefault Prelude.encodeStringField
  Prelude.putOptional 2 r.value Prelude.isDefault Prelude.encodeStringField
  Prelude.foldRecM (\_ x -> Prelude.putFieldUnknown x) unit r.__unknown_fields

parseMsg1_MappyEntry :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Prelude.ByteLength -> Prelude.ParserT Prelude.DataView m Msg1_MappyEntry
parseMsg1_MappyEntry length = Prelude.label "MappyEntry / " $
  Prelude.parseMessage Msg1_MappyEntry defaultMsg1_MappyEntry parseField length
 where
  parseField
    :: Prelude.FieldNumberInt
    -> Prelude.WireType
    -> Prelude.ParserT Prelude.DataView m (Prelude.Builder Msg1_MappyEntryR Msg1_MappyEntryR)
  parseField 1 Prelude.LenDel = Prelude.label "key / " $ do
    x <- Prelude.decodeString
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "key") $ \_ -> Prelude.Just x
  parseField 2 Prelude.LenDel = Prelude.label "value / " $ do
    x <- Prelude.decodeString
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "value") $ \_ -> Prelude.Just x
  parseField fieldNumber wireType = Prelude.parseFieldUnknown fieldNumber wireType

defaultMsg1_MappyEntry :: Msg1_MappyEntryR
defaultMsg1_MappyEntry =
  { key: Prelude.Nothing
  , value: Prelude.Nothing
  , __unknown_fields: []
  }

mkMsg1_MappyEntry :: forall r1 r3. Prelude.Union r1 Msg1_MappyEntryRow r3 => Prelude.Nub r3 Msg1_MappyEntryRow => Record r1 -> Msg1_MappyEntry
mkMsg1_MappyEntry r = Msg1_MappyEntry $ Prelude.merge r defaultMsg1_MappyEntry

mergeMsg1_MappyEntry :: Msg1_MappyEntry -> Msg1_MappyEntry -> Msg1_MappyEntry
mergeMsg1_MappyEntry (Msg1_MappyEntry l) (Msg1_MappyEntry r) = Msg1_MappyEntry
  { key: Prelude.alt l.key r.key
  , value: Prelude.alt l.value r.value
  , __unknown_fields: r.__unknown_fields <> l.__unknown_fields
  }

