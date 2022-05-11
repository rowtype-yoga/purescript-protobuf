-- | Entry point for the conformance test runner.
module Conformance.Main (main) where

import Prelude

import Conformance.Conformance (ConformanceRequest(..), ConformanceResponse, ConformanceResponse_Result(..), mkConformanceResponse, parseConformanceRequest, putConformanceResponse)
import Conformance.Conformance as C
import Control.Monad.Writer (tell)
import Data.ArrayBuffer.Builder (DataBuff(..), execPut, putInt32le, subBuilder, toView)
import Data.ArrayBuffer.Builder as Builder
import Data.ArrayBuffer.DataView as DV
import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Node.Buffer (toArrayBuffer, fromArrayBuffer)
import Node.Encoding (Encoding(..))
import Node.Process (stdin, stdout, stderr, exit)
import Node.Stream (onReadable, read, write, writeString)
import Protobuf.Library (Bytes(..))
import ProtobufTestMessages.Proto3.TestMessagesProto3 as T3
import Parsing (runParserT)
import Parsing.DataView (anyInt32le)

bailOutMaybe :: forall a. String -> Effect (Maybe a) -> Effect a
bailOutMaybe err thing =
  thing >>= case _ of
    Nothing -> do
      void $ writeString stderr UTF8 err (\_ -> pure unit)
      exit 1
    Just x -> pure x

bailOutEither :: forall a l. Show l => Effect (Either l a) -> Effect a
bailOutEither thing = thing >>= case _ of
    Left err -> do
      void $ writeString stderr UTF8 (show err) (\_ -> pure unit)
      exit 1
    Right x -> pure x

-- https://github.com/protocolbuffers/protobuf/blob/master/conformance/conformance_test_runner.cc
main :: Effect Unit
main = do
  onReadable stdin $ do

    msglendv <- map DV.whole $ toArrayBuffer =<< (bailOutMaybe "No message length" $ read stdin (Just 4))
    msglen <- bailOutEither $ runParserT msglendv $ anyInt32le
    stdinview <- map DV.whole $ toArrayBuffer =<< (bailOutMaybe "No stdin" $ read stdin (Just msglen))
    request <- bailOutEither $ runParserT stdinview $ parseConformanceRequest $ DV.byteLength stdinview
    response <- reply request

    responseab <- execPut $ do
       responsesub <- subBuilder $ putConformanceResponse response
       putInt32le $ Builder.length responsesub
       tell responsesub

    responsebuffer <- fromArrayBuffer responseab
    void $ write stdout responsebuffer (\_ -> pure unit)

reply :: ConformanceRequest -> Effect ConformanceResponse

reply (ConformanceRequest
  { requested_output_format: _ -- :: Maybe.Maybe WireFormat
  , message_type: Just "protobuf_test_messages.proto2.TestAllTypesProto2"
  , test_category: _ -- :: Maybe.Maybe TestCategory
  , jspb_encoding_options: _ -- :: Maybe.Maybe JspbEncodingConfig
  , print_unknown_fields: _ -- :: Maybe.Maybe Boolean
  , payload: _ -- Just (C.ConformanceRequest_Payload_Protobuf_payload arraybuffer)
  }) = pure $ mkConformanceResponse
  { result: Just $ ConformanceResponse_Result_Skipped "Skipped proto2"
  }

reply (ConformanceRequest
  { requested_output_format: Just C.WireFormat_PROTOBUF
  , message_type: _ -- Just "protobuf_test_messages.proto3.TestAllTypesProto3"
  , test_category: Just C.TestCategory_BINARY_TEST
  , jspb_encoding_options: _ -- :: Maybe.Maybe JspbEncodingConfig
  , print_unknown_fields: _ -- :: Maybe.Maybe Boolean
  , payload: Just (C.ConformanceRequest_Payload_Protobuf_payload (Bytes receipt_payload))
  }) = do
    let dv = toView receipt_payload
    parsed <- runParserT dv $ T3.parseTestAllTypesProto3 $ DV.byteLength dv
    case parsed of
      Left err ->
        pure $ mkConformanceResponse
          { result: Just $ ConformanceResponse_Result_Parse_error $ show err
          }
      Right x -> do
        reply_payload <- execPut $ T3.putTestAllTypesProto3 x
        pure $ mkConformanceResponse
          { result: Just $ ConformanceResponse_Result_Protobuf_payload (Bytes $ Buff reply_payload)
          }

reply _ = pure $ mkConformanceResponse
  { result: Just $ ConformanceResponse_Result_Skipped "Not enough information"
  }

