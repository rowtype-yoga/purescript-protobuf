-- | Generated by __protobuf__ from file `conformance.proto`
module Conformance.Conformance
( FailureSet(..), FailureSetRow, FailureSetR, parseFailureSet, putFailureSet, defaultFailureSet, mkFailureSet, mergeFailureSet
, ConformanceRequest(..), ConformanceRequestRow, ConformanceRequestR, parseConformanceRequest, putConformanceRequest, defaultConformanceRequest, mkConformanceRequest, mergeConformanceRequest, ConformanceRequest_Payload(..)
, ConformanceResponse(..), ConformanceResponseRow, ConformanceResponseR, parseConformanceResponse, putConformanceResponse, defaultConformanceResponse, mkConformanceResponse, mergeConformanceResponse, ConformanceResponse_Result(..)
, JspbEncodingConfig(..), JspbEncodingConfigRow, JspbEncodingConfigR, parseJspbEncodingConfig, putJspbEncodingConfig, defaultJspbEncodingConfig, mkJspbEncodingConfig, mergeJspbEncodingConfig
, WireFormat(..)
, TestCategory(..)
)
where
import Protobuf.Internal.Prelude
import Protobuf.Internal.Prelude as Prelude




-- | Message generated by __protobuf__ from `conformance.FailureSet`
-- | 
-- | The conformance runner will request a list of failures as the first request.
-- | This will be known by message_type == "conformance.FailureSet", a conformance
-- | test should return a serialized FailureSet in protobuf_payload.
newtype FailureSet = FailureSet FailureSetR
type FailureSetRow =
  ( failure :: Array String
  , __unknown_fields :: Array Prelude.UnknownField
  )
type FailureSetR = Record FailureSetRow
derive instance genericFailureSet :: Prelude.Generic FailureSet _
derive instance newtypeFailureSet :: Prelude.Newtype FailureSet _
derive instance eqFailureSet :: Prelude.Eq FailureSet
instance showFailureSet :: Prelude.Show FailureSet where show x = Prelude.genericShow x

putFailureSet :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => FailureSet -> Prelude.PutM m Prelude.Unit
putFailureSet (FailureSet r) = do
  Prelude.putRepeated 1 r.failure Prelude.encodeStringField
  Prelude.foldRecM (\_ x -> Prelude.putFieldUnknown x) unit r.__unknown_fields

parseFailureSet :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Prelude.ByteLength -> Prelude.ParserT Prelude.DataView m FailureSet
parseFailureSet length = Prelude.label "FailureSet / " $
  Prelude.parseMessage FailureSet defaultFailureSet parseField length
 where
  parseField
    :: Prelude.FieldNumberInt
    -> Prelude.WireType
    -> Prelude.ParserT Prelude.DataView m (Prelude.Builder FailureSetR FailureSetR)
  parseField 1 Prelude.LenDel = Prelude.label "failure / " $ do
    x <- Prelude.decodeString
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "failure") $ Prelude.flip Prelude.snoc x
  parseField fieldNumber wireType = Prelude.parseFieldUnknown fieldNumber wireType

defaultFailureSet :: FailureSetR
defaultFailureSet =
  { failure: []
  , __unknown_fields: []
  }

mkFailureSet :: forall r1 r3. Prelude.Union r1 FailureSetRow r3 => Prelude.Nub r3 FailureSetRow => Record r1 -> FailureSet
mkFailureSet r = FailureSet $ Prelude.merge r defaultFailureSet

mergeFailureSet :: FailureSet -> FailureSet -> FailureSet
mergeFailureSet (FailureSet l) (FailureSet r) = FailureSet
  { failure: r.failure <> l.failure
  , __unknown_fields: r.__unknown_fields <> l.__unknown_fields
  }


-- | Message generated by __protobuf__ from `conformance.ConformanceRequest`
-- | 
-- | Represents a single test case's input.  The testee should:
-- | 
-- |   1. parse this proto (which should always succeed)
-- |   2. parse the protobuf or JSON payload in "payload" (which may fail)
-- |   3. if the parse succeeded, serialize the message in the requested format.
newtype ConformanceRequest = ConformanceRequest ConformanceRequestR
type ConformanceRequestRow =
  ( requested_output_format :: Prelude.Maybe WireFormat
  , message_type :: Prelude.Maybe String
  , test_category :: Prelude.Maybe TestCategory
  , jspb_encoding_options :: Prelude.Maybe JspbEncodingConfig
  , print_unknown_fields :: Prelude.Maybe Boolean
  , payload :: Prelude.Maybe ConformanceRequest_Payload
  , __unknown_fields :: Array Prelude.UnknownField
  )
type ConformanceRequestR = Record ConformanceRequestRow
derive instance genericConformanceRequest :: Prelude.Generic ConformanceRequest _
derive instance newtypeConformanceRequest :: Prelude.Newtype ConformanceRequest _
derive instance eqConformanceRequest :: Prelude.Eq ConformanceRequest
instance showConformanceRequest :: Prelude.Show ConformanceRequest where show x = Prelude.genericShow x

putConformanceRequest :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => ConformanceRequest -> Prelude.PutM m Prelude.Unit
putConformanceRequest (ConformanceRequest r) = do
  Prelude.putOptional 3 r.requested_output_format Prelude.isDefault Prelude.putEnumField
  Prelude.putOptional 4 r.message_type Prelude.isDefault Prelude.encodeStringField
  Prelude.putOptional 5 r.test_category Prelude.isDefault Prelude.putEnumField
  Prelude.putOptional 6 r.jspb_encoding_options (\_ -> false) $ Prelude.putLenDel putJspbEncodingConfig
  Prelude.putOptional 9 r.print_unknown_fields Prelude.isDefault Prelude.encodeBoolField
  case r.payload of
    Prelude.Nothing -> pure Prelude.unit
    Prelude.Just (ConformanceRequest_Payload_Protobuf_payload x) -> Prelude.putOptional 1 (Prelude.Just x) (\_ -> false) Prelude.encodeBytesField
    Prelude.Just (ConformanceRequest_Payload_Json_payload x) -> Prelude.putOptional 2 (Prelude.Just x) (\_ -> false) Prelude.encodeStringField
    Prelude.Just (ConformanceRequest_Payload_Jspb_payload x) -> Prelude.putOptional 7 (Prelude.Just x) (\_ -> false) Prelude.encodeStringField
    Prelude.Just (ConformanceRequest_Payload_Text_payload x) -> Prelude.putOptional 8 (Prelude.Just x) (\_ -> false) Prelude.encodeStringField
  Prelude.foldRecM (\_ x -> Prelude.putFieldUnknown x) unit r.__unknown_fields

parseConformanceRequest :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Prelude.ByteLength -> Prelude.ParserT Prelude.DataView m ConformanceRequest
parseConformanceRequest length = Prelude.label "ConformanceRequest / " $
  Prelude.parseMessage ConformanceRequest defaultConformanceRequest parseField length
 where
  parseField
    :: Prelude.FieldNumberInt
    -> Prelude.WireType
    -> Prelude.ParserT Prelude.DataView m (Prelude.Builder ConformanceRequestR ConformanceRequestR)
  parseField 1 Prelude.LenDel = Prelude.label "protobuf_payload / " $ do
    x <- Prelude.decodeBytes
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "payload") $ \_ -> Prelude.Just (ConformanceRequest_Payload_Protobuf_payload x)
  parseField 2 Prelude.LenDel = Prelude.label "json_payload / " $ do
    x <- Prelude.decodeString
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "payload") $ \_ -> Prelude.Just (ConformanceRequest_Payload_Json_payload x)
  parseField 7 Prelude.LenDel = Prelude.label "jspb_payload / " $ do
    x <- Prelude.decodeString
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "payload") $ \_ -> Prelude.Just (ConformanceRequest_Payload_Jspb_payload x)
  parseField 8 Prelude.LenDel = Prelude.label "text_payload / " $ do
    x <- Prelude.decodeString
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "payload") $ \_ -> Prelude.Just (ConformanceRequest_Payload_Text_payload x)
  parseField 3 Prelude.VarInt = Prelude.label "requested_output_format / " $ do
    x <- Prelude.parseEnum
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "requested_output_format") $ \_ -> Prelude.Just x
  parseField 4 Prelude.LenDel = Prelude.label "message_type / " $ do
    x <- Prelude.decodeString
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "message_type") $ \_ -> Prelude.Just x
  parseField 5 Prelude.VarInt = Prelude.label "test_category / " $ do
    x <- Prelude.parseEnum
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "test_category") $ \_ -> Prelude.Just x
  parseField 6 Prelude.LenDel = Prelude.label "jspb_encoding_options / " $ do
    x <- Prelude.parseLenDel parseJspbEncodingConfig
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "jspb_encoding_options") $ Prelude.Just Prelude.<<< Prelude.maybe x (mergeJspbEncodingConfig x)
  parseField 9 Prelude.VarInt = Prelude.label "print_unknown_fields / " $ do
    x <- Prelude.decodeBool
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "print_unknown_fields") $ \_ -> Prelude.Just x
  parseField fieldNumber wireType = Prelude.parseFieldUnknown fieldNumber wireType

defaultConformanceRequest :: ConformanceRequestR
defaultConformanceRequest =
  { requested_output_format: Prelude.Nothing
  , message_type: Prelude.Nothing
  , test_category: Prelude.Nothing
  , jspb_encoding_options: Prelude.Nothing
  , print_unknown_fields: Prelude.Nothing
  , payload: Prelude.Nothing
  , __unknown_fields: []
  }

mkConformanceRequest :: forall r1 r3. Prelude.Union r1 ConformanceRequestRow r3 => Prelude.Nub r3 ConformanceRequestRow => Record r1 -> ConformanceRequest
mkConformanceRequest r = ConformanceRequest $ Prelude.merge r defaultConformanceRequest
data ConformanceRequest_Payload
  = ConformanceRequest_Payload_Protobuf_payload Prelude.Bytes
  | ConformanceRequest_Payload_Json_payload String
  | ConformanceRequest_Payload_Jspb_payload String
  | ConformanceRequest_Payload_Text_payload String

derive instance genericConformanceRequest_Payload :: Prelude.Generic ConformanceRequest_Payload _
derive instance eqConformanceRequest_Payload :: Prelude.Eq ConformanceRequest_Payload
instance showConformanceRequest_Payload :: Prelude.Show ConformanceRequest_Payload where show = Prelude.genericShow

mergeConformanceRequest_Payload :: Prelude.Maybe ConformanceRequest_Payload -> Prelude.Maybe ConformanceRequest_Payload -> Prelude.Maybe ConformanceRequest_Payload
mergeConformanceRequest_Payload l r = case Prelude.Tuple l r of
  _ -> Prelude.alt l r

mergeConformanceRequest :: ConformanceRequest -> ConformanceRequest -> ConformanceRequest
mergeConformanceRequest (ConformanceRequest l) (ConformanceRequest r) = ConformanceRequest
  { requested_output_format: Prelude.alt l.requested_output_format r.requested_output_format
  , message_type: Prelude.alt l.message_type r.message_type
  , test_category: Prelude.alt l.test_category r.test_category
  , jspb_encoding_options: Prelude.mergeWith mergeJspbEncodingConfig l.jspb_encoding_options r.jspb_encoding_options
  , print_unknown_fields: Prelude.alt l.print_unknown_fields r.print_unknown_fields
  , payload: mergeConformanceRequest_Payload l.payload r.payload
  , __unknown_fields: r.__unknown_fields <> l.__unknown_fields
  }


-- | Message generated by __protobuf__ from `conformance.ConformanceResponse`
-- | 
-- | Represents a single test case's output.
newtype ConformanceResponse = ConformanceResponse ConformanceResponseR
type ConformanceResponseRow =
  ( result :: Prelude.Maybe ConformanceResponse_Result
  , __unknown_fields :: Array Prelude.UnknownField
  )
type ConformanceResponseR = Record ConformanceResponseRow
derive instance genericConformanceResponse :: Prelude.Generic ConformanceResponse _
derive instance newtypeConformanceResponse :: Prelude.Newtype ConformanceResponse _
derive instance eqConformanceResponse :: Prelude.Eq ConformanceResponse
instance showConformanceResponse :: Prelude.Show ConformanceResponse where show x = Prelude.genericShow x

putConformanceResponse :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => ConformanceResponse -> Prelude.PutM m Prelude.Unit
putConformanceResponse (ConformanceResponse r) = do
  case r.result of
    Prelude.Nothing -> pure Prelude.unit
    Prelude.Just (ConformanceResponse_Result_Parse_error x) -> Prelude.putOptional 1 (Prelude.Just x) (\_ -> false) Prelude.encodeStringField
    Prelude.Just (ConformanceResponse_Result_Serialize_error x) -> Prelude.putOptional 6 (Prelude.Just x) (\_ -> false) Prelude.encodeStringField
    Prelude.Just (ConformanceResponse_Result_Timeout_error x) -> Prelude.putOptional 9 (Prelude.Just x) (\_ -> false) Prelude.encodeStringField
    Prelude.Just (ConformanceResponse_Result_Runtime_error x) -> Prelude.putOptional 2 (Prelude.Just x) (\_ -> false) Prelude.encodeStringField
    Prelude.Just (ConformanceResponse_Result_Protobuf_payload x) -> Prelude.putOptional 3 (Prelude.Just x) (\_ -> false) Prelude.encodeBytesField
    Prelude.Just (ConformanceResponse_Result_Json_payload x) -> Prelude.putOptional 4 (Prelude.Just x) (\_ -> false) Prelude.encodeStringField
    Prelude.Just (ConformanceResponse_Result_Skipped x) -> Prelude.putOptional 5 (Prelude.Just x) (\_ -> false) Prelude.encodeStringField
    Prelude.Just (ConformanceResponse_Result_Jspb_payload x) -> Prelude.putOptional 7 (Prelude.Just x) (\_ -> false) Prelude.encodeStringField
    Prelude.Just (ConformanceResponse_Result_Text_payload x) -> Prelude.putOptional 8 (Prelude.Just x) (\_ -> false) Prelude.encodeStringField
  Prelude.foldRecM (\_ x -> Prelude.putFieldUnknown x) unit r.__unknown_fields

parseConformanceResponse :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Prelude.ByteLength -> Prelude.ParserT Prelude.DataView m ConformanceResponse
parseConformanceResponse length = Prelude.label "ConformanceResponse / " $
  Prelude.parseMessage ConformanceResponse defaultConformanceResponse parseField length
 where
  parseField
    :: Prelude.FieldNumberInt
    -> Prelude.WireType
    -> Prelude.ParserT Prelude.DataView m (Prelude.Builder ConformanceResponseR ConformanceResponseR)
  parseField 1 Prelude.LenDel = Prelude.label "parse_error / " $ do
    x <- Prelude.decodeString
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "result") $ \_ -> Prelude.Just (ConformanceResponse_Result_Parse_error x)
  parseField 6 Prelude.LenDel = Prelude.label "serialize_error / " $ do
    x <- Prelude.decodeString
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "result") $ \_ -> Prelude.Just (ConformanceResponse_Result_Serialize_error x)
  parseField 9 Prelude.LenDel = Prelude.label "timeout_error / " $ do
    x <- Prelude.decodeString
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "result") $ \_ -> Prelude.Just (ConformanceResponse_Result_Timeout_error x)
  parseField 2 Prelude.LenDel = Prelude.label "runtime_error / " $ do
    x <- Prelude.decodeString
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "result") $ \_ -> Prelude.Just (ConformanceResponse_Result_Runtime_error x)
  parseField 3 Prelude.LenDel = Prelude.label "protobuf_payload / " $ do
    x <- Prelude.decodeBytes
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "result") $ \_ -> Prelude.Just (ConformanceResponse_Result_Protobuf_payload x)
  parseField 4 Prelude.LenDel = Prelude.label "json_payload / " $ do
    x <- Prelude.decodeString
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "result") $ \_ -> Prelude.Just (ConformanceResponse_Result_Json_payload x)
  parseField 5 Prelude.LenDel = Prelude.label "skipped / " $ do
    x <- Prelude.decodeString
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "result") $ \_ -> Prelude.Just (ConformanceResponse_Result_Skipped x)
  parseField 7 Prelude.LenDel = Prelude.label "jspb_payload / " $ do
    x <- Prelude.decodeString
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "result") $ \_ -> Prelude.Just (ConformanceResponse_Result_Jspb_payload x)
  parseField 8 Prelude.LenDel = Prelude.label "text_payload / " $ do
    x <- Prelude.decodeString
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "result") $ \_ -> Prelude.Just (ConformanceResponse_Result_Text_payload x)
  parseField fieldNumber wireType = Prelude.parseFieldUnknown fieldNumber wireType

defaultConformanceResponse :: ConformanceResponseR
defaultConformanceResponse =
  { result: Prelude.Nothing
  , __unknown_fields: []
  }

mkConformanceResponse :: forall r1 r3. Prelude.Union r1 ConformanceResponseRow r3 => Prelude.Nub r3 ConformanceResponseRow => Record r1 -> ConformanceResponse
mkConformanceResponse r = ConformanceResponse $ Prelude.merge r defaultConformanceResponse
data ConformanceResponse_Result
  = ConformanceResponse_Result_Parse_error String
  | ConformanceResponse_Result_Serialize_error String
  | ConformanceResponse_Result_Timeout_error String
  | ConformanceResponse_Result_Runtime_error String
  | ConformanceResponse_Result_Protobuf_payload Prelude.Bytes
  | ConformanceResponse_Result_Json_payload String
  | ConformanceResponse_Result_Skipped String
  | ConformanceResponse_Result_Jspb_payload String
  | ConformanceResponse_Result_Text_payload String

derive instance genericConformanceResponse_Result :: Prelude.Generic ConformanceResponse_Result _
derive instance eqConformanceResponse_Result :: Prelude.Eq ConformanceResponse_Result
instance showConformanceResponse_Result :: Prelude.Show ConformanceResponse_Result where show = Prelude.genericShow

mergeConformanceResponse_Result :: Prelude.Maybe ConformanceResponse_Result -> Prelude.Maybe ConformanceResponse_Result -> Prelude.Maybe ConformanceResponse_Result
mergeConformanceResponse_Result l r = case Prelude.Tuple l r of
  _ -> Prelude.alt l r

mergeConformanceResponse :: ConformanceResponse -> ConformanceResponse -> ConformanceResponse
mergeConformanceResponse (ConformanceResponse l) (ConformanceResponse r) = ConformanceResponse
  { result: mergeConformanceResponse_Result l.result r.result
  , __unknown_fields: r.__unknown_fields <> l.__unknown_fields
  }


-- | Message generated by __protobuf__ from `conformance.JspbEncodingConfig`
-- | 
-- | Encoding options for jspb format.
newtype JspbEncodingConfig = JspbEncodingConfig JspbEncodingConfigR
type JspbEncodingConfigRow =
  ( use_jspb_array_any_format :: Prelude.Maybe Boolean
  , __unknown_fields :: Array Prelude.UnknownField
  )
type JspbEncodingConfigR = Record JspbEncodingConfigRow
derive instance genericJspbEncodingConfig :: Prelude.Generic JspbEncodingConfig _
derive instance newtypeJspbEncodingConfig :: Prelude.Newtype JspbEncodingConfig _
derive instance eqJspbEncodingConfig :: Prelude.Eq JspbEncodingConfig
instance showJspbEncodingConfig :: Prelude.Show JspbEncodingConfig where show x = Prelude.genericShow x

putJspbEncodingConfig :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => JspbEncodingConfig -> Prelude.PutM m Prelude.Unit
putJspbEncodingConfig (JspbEncodingConfig r) = do
  Prelude.putOptional 1 r.use_jspb_array_any_format Prelude.isDefault Prelude.encodeBoolField
  Prelude.foldRecM (\_ x -> Prelude.putFieldUnknown x) unit r.__unknown_fields

parseJspbEncodingConfig :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Prelude.ByteLength -> Prelude.ParserT Prelude.DataView m JspbEncodingConfig
parseJspbEncodingConfig length = Prelude.label "JspbEncodingConfig / " $
  Prelude.parseMessage JspbEncodingConfig defaultJspbEncodingConfig parseField length
 where
  parseField
    :: Prelude.FieldNumberInt
    -> Prelude.WireType
    -> Prelude.ParserT Prelude.DataView m (Prelude.Builder JspbEncodingConfigR JspbEncodingConfigR)
  parseField 1 Prelude.VarInt = Prelude.label "use_jspb_array_any_format / " $ do
    x <- Prelude.decodeBool
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "use_jspb_array_any_format") $ \_ -> Prelude.Just x
  parseField fieldNumber wireType = Prelude.parseFieldUnknown fieldNumber wireType

defaultJspbEncodingConfig :: JspbEncodingConfigR
defaultJspbEncodingConfig =
  { use_jspb_array_any_format: Prelude.Nothing
  , __unknown_fields: []
  }

mkJspbEncodingConfig :: forall r1 r3. Prelude.Union r1 JspbEncodingConfigRow r3 => Prelude.Nub r3 JspbEncodingConfigRow => Record r1 -> JspbEncodingConfig
mkJspbEncodingConfig r = JspbEncodingConfig $ Prelude.merge r defaultJspbEncodingConfig

mergeJspbEncodingConfig :: JspbEncodingConfig -> JspbEncodingConfig -> JspbEncodingConfig
mergeJspbEncodingConfig (JspbEncodingConfig l) (JspbEncodingConfig r) = JspbEncodingConfig
  { use_jspb_array_any_format: Prelude.alt l.use_jspb_array_any_format r.use_jspb_array_any_format
  , __unknown_fields: r.__unknown_fields <> l.__unknown_fields
  }


-- | Enum generated by __protobuf__ from `conformance.WireFormat`
data WireFormat
  = WireFormat_UNSPECIFIED
  | WireFormat_PROTOBUF
  | WireFormat_JSON
  | WireFormat_JSPB
  | WireFormat_TEXT_FORMAT
derive instance genericWireFormat :: Prelude.Generic WireFormat _
derive instance eqWireFormat :: Prelude.Eq WireFormat
instance showWireFormat :: Prelude.Show WireFormat where show = Prelude.genericShow
instance ordWireFormat :: Prelude.Ord WireFormat where compare = Prelude.genericCompare
instance boundedWireFormat :: Prelude.Bounded WireFormat
 where
  bottom = Prelude.genericBottom
  top = Prelude.genericTop
instance enumWireFormat :: Prelude.Enum WireFormat
 where
  succ = Prelude.genericSucc
  pred = Prelude.genericPred
instance boundedenumWireFormat :: Prelude.BoundedEnum WireFormat
 where
  cardinality = Prelude.genericCardinality
  toEnum (0) = Prelude.Just WireFormat_UNSPECIFIED
  toEnum (1) = Prelude.Just WireFormat_PROTOBUF
  toEnum (2) = Prelude.Just WireFormat_JSON
  toEnum (3) = Prelude.Just WireFormat_JSPB
  toEnum (4) = Prelude.Just WireFormat_TEXT_FORMAT
  toEnum _ = Prelude.Nothing
  fromEnum WireFormat_UNSPECIFIED = (0)
  fromEnum WireFormat_PROTOBUF = (1)
  fromEnum WireFormat_JSON = (2)
  fromEnum WireFormat_JSPB = (3)
  fromEnum WireFormat_TEXT_FORMAT = (4)
instance defaultWireFormat :: Prelude.Default WireFormat
 where
  default = WireFormat_UNSPECIFIED
  isDefault = eq WireFormat_UNSPECIFIED

-- | Enum generated by __protobuf__ from `conformance.TestCategory`
data TestCategory
  = TestCategory_UNSPECIFIED_TEST
  | TestCategory_BINARY_TEST
  | TestCategory_JSON_TEST
  | TestCategory_JSON_IGNORE_UNKNOWN_PARSING_TEST
  | TestCategory_JSPB_TEST
  | TestCategory_TEXT_FORMAT_TEST
derive instance genericTestCategory :: Prelude.Generic TestCategory _
derive instance eqTestCategory :: Prelude.Eq TestCategory
instance showTestCategory :: Prelude.Show TestCategory where show = Prelude.genericShow
instance ordTestCategory :: Prelude.Ord TestCategory where compare = Prelude.genericCompare
instance boundedTestCategory :: Prelude.Bounded TestCategory
 where
  bottom = Prelude.genericBottom
  top = Prelude.genericTop
instance enumTestCategory :: Prelude.Enum TestCategory
 where
  succ = Prelude.genericSucc
  pred = Prelude.genericPred
instance boundedenumTestCategory :: Prelude.BoundedEnum TestCategory
 where
  cardinality = Prelude.genericCardinality
  toEnum (0) = Prelude.Just TestCategory_UNSPECIFIED_TEST
  toEnum (1) = Prelude.Just TestCategory_BINARY_TEST
  toEnum (2) = Prelude.Just TestCategory_JSON_TEST
  toEnum (3) = Prelude.Just TestCategory_JSON_IGNORE_UNKNOWN_PARSING_TEST
  toEnum (4) = Prelude.Just TestCategory_JSPB_TEST
  toEnum (5) = Prelude.Just TestCategory_TEXT_FORMAT_TEST
  toEnum _ = Prelude.Nothing
  fromEnum TestCategory_UNSPECIFIED_TEST = (0)
  fromEnum TestCategory_BINARY_TEST = (1)
  fromEnum TestCategory_JSON_TEST = (2)
  fromEnum TestCategory_JSON_IGNORE_UNKNOWN_PARSING_TEST = (3)
  fromEnum TestCategory_JSPB_TEST = (4)
  fromEnum TestCategory_TEXT_FORMAT_TEST = (5)
instance defaultTestCategory :: Prelude.Default TestCategory
 where
  default = TestCategory_UNSPECIFIED_TEST
  isDefault = eq TestCategory_UNSPECIFIED_TEST
