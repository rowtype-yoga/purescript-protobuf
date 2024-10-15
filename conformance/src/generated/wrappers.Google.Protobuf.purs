-- | Generated by __protobuf__ from file `google/protobuf/wrappers.proto`
module Google.Protobuf.Wrappers
( DoubleValue(..), DoubleValueRow, DoubleValueR, parseDoubleValue, putDoubleValue, defaultDoubleValue, mkDoubleValue, mergeDoubleValue
, FloatValue(..), FloatValueRow, FloatValueR, parseFloatValue, putFloatValue, defaultFloatValue, mkFloatValue, mergeFloatValue
, Int64Value(..), Int64ValueRow, Int64ValueR, parseInt64Value, putInt64Value, defaultInt64Value, mkInt64Value, mergeInt64Value
, UInt64Value(..), UInt64ValueRow, UInt64ValueR, parseUInt64Value, putUInt64Value, defaultUInt64Value, mkUInt64Value, mergeUInt64Value
, Int32Value(..), Int32ValueRow, Int32ValueR, parseInt32Value, putInt32Value, defaultInt32Value, mkInt32Value, mergeInt32Value
, UInt32Value(..), UInt32ValueRow, UInt32ValueR, parseUInt32Value, putUInt32Value, defaultUInt32Value, mkUInt32Value, mergeUInt32Value
, BoolValue(..), BoolValueRow, BoolValueR, parseBoolValue, putBoolValue, defaultBoolValue, mkBoolValue, mergeBoolValue
, StringValue(..), StringValueRow, StringValueR, parseStringValue, putStringValue, defaultStringValue, mkStringValue, mergeStringValue
, BytesValue(..), BytesValueRow, BytesValueR, parseBytesValue, putBytesValue, defaultBytesValue, mkBytesValue, mergeBytesValue
)
where
import Protobuf.Internal.Prelude
import Protobuf.Internal.Prelude as Prelude




-- | Message generated by __protobuf__ from `google.protobuf.DoubleValue`
-- | 
-- | Wrapper message for `double`.
-- | 
-- | The JSON representation for `DoubleValue` is JSON number.
newtype DoubleValue = DoubleValue DoubleValueR
type DoubleValueRow =
  ( value :: Prelude.Maybe Number
  , __unknown_fields :: Array Prelude.UnknownField
  )
type DoubleValueR = Record DoubleValueRow
derive instance genericDoubleValue :: Prelude.Generic DoubleValue _
derive instance newtypeDoubleValue :: Prelude.Newtype DoubleValue _
derive instance eqDoubleValue :: Prelude.Eq DoubleValue
instance showDoubleValue :: Prelude.Show DoubleValue where show x = Prelude.genericShow x

putDoubleValue :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => DoubleValue -> Prelude.PutM m Prelude.Unit
putDoubleValue (DoubleValue r) = do
  Prelude.putOptional 1 r.value Prelude.isDefault Prelude.encodeDoubleField
  Prelude.foldRecM (\_ x -> Prelude.putFieldUnknown x) unit r.__unknown_fields

parseDoubleValue :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Prelude.ByteLength -> Prelude.ParserT Prelude.DataView m DoubleValue
parseDoubleValue length = Prelude.label "DoubleValue / " $
  Prelude.parseMessage DoubleValue defaultDoubleValue parseField length
 where
  parseField
    :: Prelude.FieldNumberInt
    -> Prelude.WireType
    -> Prelude.ParserT Prelude.DataView m (Prelude.Builder DoubleValueR DoubleValueR)
  parseField 1 Prelude.Bits64 = Prelude.label "value / " $ do
    x <- Prelude.decodeDouble
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "value") $ \_ -> Prelude.Just x
  parseField fieldNumber wireType = Prelude.parseFieldUnknown fieldNumber wireType

defaultDoubleValue :: DoubleValueR
defaultDoubleValue =
  { value: Prelude.Nothing
  , __unknown_fields: []
  }

mkDoubleValue :: forall r1 r3. Prelude.Union r1 DoubleValueRow r3 => Prelude.Nub r3 DoubleValueRow => Record r1 -> DoubleValue
mkDoubleValue r = DoubleValue $ Prelude.merge r defaultDoubleValue

mergeDoubleValue :: DoubleValue -> DoubleValue -> DoubleValue
mergeDoubleValue (DoubleValue l) (DoubleValue r) = DoubleValue
  { value: Prelude.alt l.value r.value
  , __unknown_fields: r.__unknown_fields <> l.__unknown_fields
  }


-- | Message generated by __protobuf__ from `google.protobuf.FloatValue`
-- | 
-- | Wrapper message for `float`.
-- | 
-- | The JSON representation for `FloatValue` is JSON number.
newtype FloatValue = FloatValue FloatValueR
type FloatValueRow =
  ( value :: Prelude.Maybe Prelude.Float32
  , __unknown_fields :: Array Prelude.UnknownField
  )
type FloatValueR = Record FloatValueRow
derive instance genericFloatValue :: Prelude.Generic FloatValue _
derive instance newtypeFloatValue :: Prelude.Newtype FloatValue _
derive instance eqFloatValue :: Prelude.Eq FloatValue
instance showFloatValue :: Prelude.Show FloatValue where show x = Prelude.genericShow x

putFloatValue :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => FloatValue -> Prelude.PutM m Prelude.Unit
putFloatValue (FloatValue r) = do
  Prelude.putOptional 1 r.value Prelude.isDefault Prelude.encodeFloatField
  Prelude.foldRecM (\_ x -> Prelude.putFieldUnknown x) unit r.__unknown_fields

parseFloatValue :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Prelude.ByteLength -> Prelude.ParserT Prelude.DataView m FloatValue
parseFloatValue length = Prelude.label "FloatValue / " $
  Prelude.parseMessage FloatValue defaultFloatValue parseField length
 where
  parseField
    :: Prelude.FieldNumberInt
    -> Prelude.WireType
    -> Prelude.ParserT Prelude.DataView m (Prelude.Builder FloatValueR FloatValueR)
  parseField 1 Prelude.Bits32 = Prelude.label "value / " $ do
    x <- Prelude.decodeFloat
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "value") $ \_ -> Prelude.Just x
  parseField fieldNumber wireType = Prelude.parseFieldUnknown fieldNumber wireType

defaultFloatValue :: FloatValueR
defaultFloatValue =
  { value: Prelude.Nothing
  , __unknown_fields: []
  }

mkFloatValue :: forall r1 r3. Prelude.Union r1 FloatValueRow r3 => Prelude.Nub r3 FloatValueRow => Record r1 -> FloatValue
mkFloatValue r = FloatValue $ Prelude.merge r defaultFloatValue

mergeFloatValue :: FloatValue -> FloatValue -> FloatValue
mergeFloatValue (FloatValue l) (FloatValue r) = FloatValue
  { value: Prelude.alt l.value r.value
  , __unknown_fields: r.__unknown_fields <> l.__unknown_fields
  }


-- | Message generated by __protobuf__ from `google.protobuf.Int64Value`
-- | 
-- | Wrapper message for `int64`.
-- | 
-- | The JSON representation for `Int64Value` is JSON string.
newtype Int64Value = Int64Value Int64ValueR
type Int64ValueRow =
  ( value :: Prelude.Maybe Prelude.Int64
  , __unknown_fields :: Array Prelude.UnknownField
  )
type Int64ValueR = Record Int64ValueRow
derive instance genericInt64Value :: Prelude.Generic Int64Value _
derive instance newtypeInt64Value :: Prelude.Newtype Int64Value _
derive instance eqInt64Value :: Prelude.Eq Int64Value
instance showInt64Value :: Prelude.Show Int64Value where show x = Prelude.genericShow x

putInt64Value :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Int64Value -> Prelude.PutM m Prelude.Unit
putInt64Value (Int64Value r) = do
  Prelude.putOptional 1 r.value Prelude.isDefault Prelude.encodeInt64Field
  Prelude.foldRecM (\_ x -> Prelude.putFieldUnknown x) unit r.__unknown_fields

parseInt64Value :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Prelude.ByteLength -> Prelude.ParserT Prelude.DataView m Int64Value
parseInt64Value length = Prelude.label "Int64Value / " $
  Prelude.parseMessage Int64Value defaultInt64Value parseField length
 where
  parseField
    :: Prelude.FieldNumberInt
    -> Prelude.WireType
    -> Prelude.ParserT Prelude.DataView m (Prelude.Builder Int64ValueR Int64ValueR)
  parseField 1 Prelude.VarInt = Prelude.label "value / " $ do
    x <- Prelude.decodeInt64
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "value") $ \_ -> Prelude.Just x
  parseField fieldNumber wireType = Prelude.parseFieldUnknown fieldNumber wireType

defaultInt64Value :: Int64ValueR
defaultInt64Value =
  { value: Prelude.Nothing
  , __unknown_fields: []
  }

mkInt64Value :: forall r1 r3. Prelude.Union r1 Int64ValueRow r3 => Prelude.Nub r3 Int64ValueRow => Record r1 -> Int64Value
mkInt64Value r = Int64Value $ Prelude.merge r defaultInt64Value

mergeInt64Value :: Int64Value -> Int64Value -> Int64Value
mergeInt64Value (Int64Value l) (Int64Value r) = Int64Value
  { value: Prelude.alt l.value r.value
  , __unknown_fields: r.__unknown_fields <> l.__unknown_fields
  }


-- | Message generated by __protobuf__ from `google.protobuf.UInt64Value`
-- | 
-- | Wrapper message for `uint64`.
-- | 
-- | The JSON representation for `UInt64Value` is JSON string.
newtype UInt64Value = UInt64Value UInt64ValueR
type UInt64ValueRow =
  ( value :: Prelude.Maybe Prelude.UInt64
  , __unknown_fields :: Array Prelude.UnknownField
  )
type UInt64ValueR = Record UInt64ValueRow
derive instance genericUInt64Value :: Prelude.Generic UInt64Value _
derive instance newtypeUInt64Value :: Prelude.Newtype UInt64Value _
derive instance eqUInt64Value :: Prelude.Eq UInt64Value
instance showUInt64Value :: Prelude.Show UInt64Value where show x = Prelude.genericShow x

putUInt64Value :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => UInt64Value -> Prelude.PutM m Prelude.Unit
putUInt64Value (UInt64Value r) = do
  Prelude.putOptional 1 r.value Prelude.isDefault Prelude.encodeUint64Field
  Prelude.foldRecM (\_ x -> Prelude.putFieldUnknown x) unit r.__unknown_fields

parseUInt64Value :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Prelude.ByteLength -> Prelude.ParserT Prelude.DataView m UInt64Value
parseUInt64Value length = Prelude.label "UInt64Value / " $
  Prelude.parseMessage UInt64Value defaultUInt64Value parseField length
 where
  parseField
    :: Prelude.FieldNumberInt
    -> Prelude.WireType
    -> Prelude.ParserT Prelude.DataView m (Prelude.Builder UInt64ValueR UInt64ValueR)
  parseField 1 Prelude.VarInt = Prelude.label "value / " $ do
    x <- Prelude.decodeUint64
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "value") $ \_ -> Prelude.Just x
  parseField fieldNumber wireType = Prelude.parseFieldUnknown fieldNumber wireType

defaultUInt64Value :: UInt64ValueR
defaultUInt64Value =
  { value: Prelude.Nothing
  , __unknown_fields: []
  }

mkUInt64Value :: forall r1 r3. Prelude.Union r1 UInt64ValueRow r3 => Prelude.Nub r3 UInt64ValueRow => Record r1 -> UInt64Value
mkUInt64Value r = UInt64Value $ Prelude.merge r defaultUInt64Value

mergeUInt64Value :: UInt64Value -> UInt64Value -> UInt64Value
mergeUInt64Value (UInt64Value l) (UInt64Value r) = UInt64Value
  { value: Prelude.alt l.value r.value
  , __unknown_fields: r.__unknown_fields <> l.__unknown_fields
  }


-- | Message generated by __protobuf__ from `google.protobuf.Int32Value`
-- | 
-- | Wrapper message for `int32`.
-- | 
-- | The JSON representation for `Int32Value` is JSON number.
newtype Int32Value = Int32Value Int32ValueR
type Int32ValueRow =
  ( value :: Prelude.Maybe Int
  , __unknown_fields :: Array Prelude.UnknownField
  )
type Int32ValueR = Record Int32ValueRow
derive instance genericInt32Value :: Prelude.Generic Int32Value _
derive instance newtypeInt32Value :: Prelude.Newtype Int32Value _
derive instance eqInt32Value :: Prelude.Eq Int32Value
instance showInt32Value :: Prelude.Show Int32Value where show x = Prelude.genericShow x

putInt32Value :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Int32Value -> Prelude.PutM m Prelude.Unit
putInt32Value (Int32Value r) = do
  Prelude.putOptional 1 r.value Prelude.isDefault Prelude.encodeInt32Field
  Prelude.foldRecM (\_ x -> Prelude.putFieldUnknown x) unit r.__unknown_fields

parseInt32Value :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Prelude.ByteLength -> Prelude.ParserT Prelude.DataView m Int32Value
parseInt32Value length = Prelude.label "Int32Value / " $
  Prelude.parseMessage Int32Value defaultInt32Value parseField length
 where
  parseField
    :: Prelude.FieldNumberInt
    -> Prelude.WireType
    -> Prelude.ParserT Prelude.DataView m (Prelude.Builder Int32ValueR Int32ValueR)
  parseField 1 Prelude.VarInt = Prelude.label "value / " $ do
    x <- Prelude.decodeInt32
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "value") $ \_ -> Prelude.Just x
  parseField fieldNumber wireType = Prelude.parseFieldUnknown fieldNumber wireType

defaultInt32Value :: Int32ValueR
defaultInt32Value =
  { value: Prelude.Nothing
  , __unknown_fields: []
  }

mkInt32Value :: forall r1 r3. Prelude.Union r1 Int32ValueRow r3 => Prelude.Nub r3 Int32ValueRow => Record r1 -> Int32Value
mkInt32Value r = Int32Value $ Prelude.merge r defaultInt32Value

mergeInt32Value :: Int32Value -> Int32Value -> Int32Value
mergeInt32Value (Int32Value l) (Int32Value r) = Int32Value
  { value: Prelude.alt l.value r.value
  , __unknown_fields: r.__unknown_fields <> l.__unknown_fields
  }


-- | Message generated by __protobuf__ from `google.protobuf.UInt32Value`
-- | 
-- | Wrapper message for `uint32`.
-- | 
-- | The JSON representation for `UInt32Value` is JSON number.
newtype UInt32Value = UInt32Value UInt32ValueR
type UInt32ValueRow =
  ( value :: Prelude.Maybe Prelude.UInt
  , __unknown_fields :: Array Prelude.UnknownField
  )
type UInt32ValueR = Record UInt32ValueRow
derive instance genericUInt32Value :: Prelude.Generic UInt32Value _
derive instance newtypeUInt32Value :: Prelude.Newtype UInt32Value _
derive instance eqUInt32Value :: Prelude.Eq UInt32Value
instance showUInt32Value :: Prelude.Show UInt32Value where show x = Prelude.genericShow x

putUInt32Value :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => UInt32Value -> Prelude.PutM m Prelude.Unit
putUInt32Value (UInt32Value r) = do
  Prelude.putOptional 1 r.value Prelude.isDefault Prelude.encodeUint32Field
  Prelude.foldRecM (\_ x -> Prelude.putFieldUnknown x) unit r.__unknown_fields

parseUInt32Value :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Prelude.ByteLength -> Prelude.ParserT Prelude.DataView m UInt32Value
parseUInt32Value length = Prelude.label "UInt32Value / " $
  Prelude.parseMessage UInt32Value defaultUInt32Value parseField length
 where
  parseField
    :: Prelude.FieldNumberInt
    -> Prelude.WireType
    -> Prelude.ParserT Prelude.DataView m (Prelude.Builder UInt32ValueR UInt32ValueR)
  parseField 1 Prelude.VarInt = Prelude.label "value / " $ do
    x <- Prelude.decodeUint32
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "value") $ \_ -> Prelude.Just x
  parseField fieldNumber wireType = Prelude.parseFieldUnknown fieldNumber wireType

defaultUInt32Value :: UInt32ValueR
defaultUInt32Value =
  { value: Prelude.Nothing
  , __unknown_fields: []
  }

mkUInt32Value :: forall r1 r3. Prelude.Union r1 UInt32ValueRow r3 => Prelude.Nub r3 UInt32ValueRow => Record r1 -> UInt32Value
mkUInt32Value r = UInt32Value $ Prelude.merge r defaultUInt32Value

mergeUInt32Value :: UInt32Value -> UInt32Value -> UInt32Value
mergeUInt32Value (UInt32Value l) (UInt32Value r) = UInt32Value
  { value: Prelude.alt l.value r.value
  , __unknown_fields: r.__unknown_fields <> l.__unknown_fields
  }


-- | Message generated by __protobuf__ from `google.protobuf.BoolValue`
-- | 
-- | Wrapper message for `bool`.
-- | 
-- | The JSON representation for `BoolValue` is JSON `true` and `false`.
newtype BoolValue = BoolValue BoolValueR
type BoolValueRow =
  ( value :: Prelude.Maybe Boolean
  , __unknown_fields :: Array Prelude.UnknownField
  )
type BoolValueR = Record BoolValueRow
derive instance genericBoolValue :: Prelude.Generic BoolValue _
derive instance newtypeBoolValue :: Prelude.Newtype BoolValue _
derive instance eqBoolValue :: Prelude.Eq BoolValue
instance showBoolValue :: Prelude.Show BoolValue where show x = Prelude.genericShow x

putBoolValue :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => BoolValue -> Prelude.PutM m Prelude.Unit
putBoolValue (BoolValue r) = do
  Prelude.putOptional 1 r.value Prelude.isDefault Prelude.encodeBoolField
  Prelude.foldRecM (\_ x -> Prelude.putFieldUnknown x) unit r.__unknown_fields

parseBoolValue :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Prelude.ByteLength -> Prelude.ParserT Prelude.DataView m BoolValue
parseBoolValue length = Prelude.label "BoolValue / " $
  Prelude.parseMessage BoolValue defaultBoolValue parseField length
 where
  parseField
    :: Prelude.FieldNumberInt
    -> Prelude.WireType
    -> Prelude.ParserT Prelude.DataView m (Prelude.Builder BoolValueR BoolValueR)
  parseField 1 Prelude.VarInt = Prelude.label "value / " $ do
    x <- Prelude.decodeBool
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "value") $ \_ -> Prelude.Just x
  parseField fieldNumber wireType = Prelude.parseFieldUnknown fieldNumber wireType

defaultBoolValue :: BoolValueR
defaultBoolValue =
  { value: Prelude.Nothing
  , __unknown_fields: []
  }

mkBoolValue :: forall r1 r3. Prelude.Union r1 BoolValueRow r3 => Prelude.Nub r3 BoolValueRow => Record r1 -> BoolValue
mkBoolValue r = BoolValue $ Prelude.merge r defaultBoolValue

mergeBoolValue :: BoolValue -> BoolValue -> BoolValue
mergeBoolValue (BoolValue l) (BoolValue r) = BoolValue
  { value: Prelude.alt l.value r.value
  , __unknown_fields: r.__unknown_fields <> l.__unknown_fields
  }


-- | Message generated by __protobuf__ from `google.protobuf.StringValue`
-- | 
-- | Wrapper message for `string`.
-- | 
-- | The JSON representation for `StringValue` is JSON string.
newtype StringValue = StringValue StringValueR
type StringValueRow =
  ( value :: Prelude.Maybe String
  , __unknown_fields :: Array Prelude.UnknownField
  )
type StringValueR = Record StringValueRow
derive instance genericStringValue :: Prelude.Generic StringValue _
derive instance newtypeStringValue :: Prelude.Newtype StringValue _
derive instance eqStringValue :: Prelude.Eq StringValue
instance showStringValue :: Prelude.Show StringValue where show x = Prelude.genericShow x

putStringValue :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => StringValue -> Prelude.PutM m Prelude.Unit
putStringValue (StringValue r) = do
  Prelude.putOptional 1 r.value Prelude.isDefault Prelude.encodeStringField
  Prelude.foldRecM (\_ x -> Prelude.putFieldUnknown x) unit r.__unknown_fields

parseStringValue :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Prelude.ByteLength -> Prelude.ParserT Prelude.DataView m StringValue
parseStringValue length = Prelude.label "StringValue / " $
  Prelude.parseMessage StringValue defaultStringValue parseField length
 where
  parseField
    :: Prelude.FieldNumberInt
    -> Prelude.WireType
    -> Prelude.ParserT Prelude.DataView m (Prelude.Builder StringValueR StringValueR)
  parseField 1 Prelude.LenDel = Prelude.label "value / " $ do
    x <- Prelude.decodeString
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "value") $ \_ -> Prelude.Just x
  parseField fieldNumber wireType = Prelude.parseFieldUnknown fieldNumber wireType

defaultStringValue :: StringValueR
defaultStringValue =
  { value: Prelude.Nothing
  , __unknown_fields: []
  }

mkStringValue :: forall r1 r3. Prelude.Union r1 StringValueRow r3 => Prelude.Nub r3 StringValueRow => Record r1 -> StringValue
mkStringValue r = StringValue $ Prelude.merge r defaultStringValue

mergeStringValue :: StringValue -> StringValue -> StringValue
mergeStringValue (StringValue l) (StringValue r) = StringValue
  { value: Prelude.alt l.value r.value
  , __unknown_fields: r.__unknown_fields <> l.__unknown_fields
  }


-- | Message generated by __protobuf__ from `google.protobuf.BytesValue`
-- | 
-- | Wrapper message for `bytes`.
-- | 
-- | The JSON representation for `BytesValue` is JSON string.
newtype BytesValue = BytesValue BytesValueR
type BytesValueRow =
  ( value :: Prelude.Maybe Prelude.Bytes
  , __unknown_fields :: Array Prelude.UnknownField
  )
type BytesValueR = Record BytesValueRow
derive instance genericBytesValue :: Prelude.Generic BytesValue _
derive instance newtypeBytesValue :: Prelude.Newtype BytesValue _
derive instance eqBytesValue :: Prelude.Eq BytesValue
instance showBytesValue :: Prelude.Show BytesValue where show x = Prelude.genericShow x

putBytesValue :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => BytesValue -> Prelude.PutM m Prelude.Unit
putBytesValue (BytesValue r) = do
  Prelude.putOptional 1 r.value Prelude.isDefault Prelude.encodeBytesField
  Prelude.foldRecM (\_ x -> Prelude.putFieldUnknown x) unit r.__unknown_fields

parseBytesValue :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Prelude.ByteLength -> Prelude.ParserT Prelude.DataView m BytesValue
parseBytesValue length = Prelude.label "BytesValue / " $
  Prelude.parseMessage BytesValue defaultBytesValue parseField length
 where
  parseField
    :: Prelude.FieldNumberInt
    -> Prelude.WireType
    -> Prelude.ParserT Prelude.DataView m (Prelude.Builder BytesValueR BytesValueR)
  parseField 1 Prelude.LenDel = Prelude.label "value / " $ do
    x <- Prelude.decodeBytes
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "value") $ \_ -> Prelude.Just x
  parseField fieldNumber wireType = Prelude.parseFieldUnknown fieldNumber wireType

defaultBytesValue :: BytesValueR
defaultBytesValue =
  { value: Prelude.Nothing
  , __unknown_fields: []
  }

mkBytesValue :: forall r1 r3. Prelude.Union r1 BytesValueRow r3 => Prelude.Nub r3 BytesValueRow => Record r1 -> BytesValue
mkBytesValue r = BytesValue $ Prelude.merge r defaultBytesValue

mergeBytesValue :: BytesValue -> BytesValue -> BytesValue
mergeBytesValue (BytesValue l) (BytesValue r) = BytesValue
  { value: Prelude.alt l.value r.value
  , __unknown_fields: r.__unknown_fields <> l.__unknown_fields
  }


