-- | Generated by __protobuf__ from file `google/protobuf/any.proto`
module Google.Protobuf.Any
( Any(..), AnyRow, AnyR, parseAny, putAny, defaultAny, mkAny, mergeAny
)
where
import Protobuf.Internal.Prelude
import Protobuf.Internal.Prelude as Prelude




-- | Message generated by __protobuf__ from `google.protobuf.Any`
-- | 
-- | `Any` contains an arbitrary serialized protocol buffer message along with a
-- | URL that describes the type of the serialized message.
-- | 
-- | Protobuf library provides support to pack/unpack Any values in the form
-- | of utility functions or additional generated methods of the Any type.
-- | 
-- | Example 1: Pack and unpack a message in C++.
-- | 
-- |     Foo foo = ...;
-- |     Any any;
-- |     any.PackFrom(foo);
-- |     ...
-- |     if (any.UnpackTo(&foo)) {
-- |       ...
-- |     }
-- | 
-- | Example 2: Pack and unpack a message in Java.
-- | 
-- |     Foo foo = ...;
-- |     Any any = Any.pack(foo);
-- |     ...
-- |     if (any.is(Foo.class)) {
-- |       foo = any.unpack(Foo.class);
-- |     }
-- |     // or ...
-- |     if (any.isSameTypeAs(Foo.getDefaultInstance())) {
-- |       foo = any.unpack(Foo.getDefaultInstance());
-- |     }
-- | 
-- |  Example 3: Pack and unpack a message in Python.
-- | 
-- |     foo = Foo(...)
-- |     any = Any()
-- |     any.Pack(foo)
-- |     ...
-- |     if any.Is(Foo.DESCRIPTOR):
-- |       any.Unpack(foo)
-- |       ...
-- | 
-- |  Example 4: Pack and unpack a message in Go
-- | 
-- |      foo := &pb.Foo{...}
-- |      any, err := anypb.New(foo)
-- |      if err != nil {
-- |        ...
-- |      }
-- |      ...
-- |      foo := &pb.Foo{}
-- |      if err := any.UnmarshalTo(foo); err != nil {
-- |        ...
-- |      }
-- | 
-- | The pack methods provided by protobuf library will by default use
-- | 'type.googleapis.com/full.type.name' as the type URL and the unpack
-- | methods only use the fully qualified type name after the last '/'
-- | in the type URL, for example "foo.bar.com/x/y.z" will yield type
-- | name "y.z".
-- | 
-- | JSON
-- | ====
-- | The JSON representation of an `Any` value uses the regular
-- | representation of the deserialized, embedded message, with an
-- | additional field `@type` which contains the type URL. Example:
-- | 
-- |     package google.profile;
-- |     message Person {
-- |       string first_name = 1;
-- |       string last_name = 2;
-- |     }
-- | 
-- |     {
-- |       "@type": "type.googleapis.com/google.profile.Person",
-- |       "firstName": <string>,
-- |       "lastName": <string>
-- |     }
-- | 
-- | If the embedded message type is well-known and has a custom JSON
-- | representation, that representation will be embedded adding a field
-- | `value` which holds the custom JSON in addition to the `@type`
-- | field. Example (for message [google.protobuf.Duration][]):
-- | 
-- |     {
-- |       "@type": "type.googleapis.com/google.protobuf.Duration",
-- |       "value": "1.212s"
-- |     }
-- | 
newtype Any = Any AnyR
type AnyRow =
  ( type_url :: Prelude.Maybe String
  , value :: Prelude.Maybe Prelude.Bytes
  , __unknown_fields :: Array Prelude.UnknownField
  )
type AnyR = Record AnyRow
derive instance genericAny :: Prelude.Generic Any _
derive instance newtypeAny :: Prelude.Newtype Any _
derive instance eqAny :: Prelude.Eq Any
instance showAny :: Prelude.Show Any where show x = Prelude.genericShow x

putAny :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Any -> Prelude.PutM m Prelude.Unit
putAny (Any r) = do
  Prelude.putOptional 1 r.type_url Prelude.isDefault Prelude.encodeStringField
  Prelude.putOptional 2 r.value Prelude.isDefault Prelude.encodeBytesField
  Prelude.foldRecM (\_ x -> Prelude.putFieldUnknown x) unit r.__unknown_fields

parseAny :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Prelude.ByteLength -> Prelude.ParserT Prelude.DataView m Any
parseAny length = Prelude.label "Any / " $
  Prelude.parseMessage Any defaultAny parseField length
 where
  parseField
    :: Prelude.FieldNumberInt
    -> Prelude.WireType
    -> Prelude.ParserT Prelude.DataView m (Prelude.Builder AnyR AnyR)
  parseField 1 Prelude.LenDel = Prelude.label "type_url / " $ do
    x <- Prelude.decodeString
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "type_url") $ \_ -> Prelude.Just x
  parseField 2 Prelude.LenDel = Prelude.label "value / " $ do
    x <- Prelude.decodeBytes
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "value") $ \_ -> Prelude.Just x
  parseField fieldNumber wireType = Prelude.parseFieldUnknown fieldNumber wireType

defaultAny :: AnyR
defaultAny =
  { type_url: Prelude.Nothing
  , value: Prelude.Nothing
  , __unknown_fields: []
  }

mkAny :: forall r1 r3. Prelude.Union r1 AnyRow r3 => Prelude.Nub r3 AnyRow => Record r1 -> Any
mkAny r = Any $ Prelude.merge r defaultAny

mergeAny :: Any -> Any -> Any
mergeAny (Any l) (Any r) = Any
  { type_url: Prelude.alt l.type_url r.type_url
  , value: Prelude.alt l.value r.value
  , __unknown_fields: r.__unknown_fields <> l.__unknown_fields
  }

