-- | Generated by __protobuf__ from file `google/protobuf/duration.proto`
module Google.Protobuf.Duration
( Duration(..), DurationRow, DurationR, parseDuration, putDuration, defaultDuration, mkDuration, mergeDuration
)
where
import Protobuf.Internal.Prelude
import Protobuf.Internal.Prelude as Prelude




-- | Message generated by __protobuf__ from `google.protobuf.Duration`
-- | 
-- | A Duration represents a signed, fixed-length span of time represented
-- | as a count of seconds and fractions of seconds at nanosecond
-- | resolution. It is independent of any calendar and concepts like "day"
-- | or "month". It is related to Timestamp in that the difference between
-- | two Timestamp values is a Duration and it can be added or subtracted
-- | from a Timestamp. Range is approximately +-10,000 years.
-- | 
-- | # Examples
-- | 
-- | Example 1: Compute Duration from two Timestamps in pseudo code.
-- | 
-- |     Timestamp start = ...;
-- |     Timestamp end = ...;
-- |     Duration duration = ...;
-- | 
-- |     duration.seconds = end.seconds - start.seconds;
-- |     duration.nanos = end.nanos - start.nanos;
-- | 
-- |     if (duration.seconds < 0 && duration.nanos > 0) {
-- |       duration.seconds += 1;
-- |       duration.nanos -= 1000000000;
-- |     } else if (duration.seconds > 0 && duration.nanos < 0) {
-- |       duration.seconds -= 1;
-- |       duration.nanos += 1000000000;
-- |     }
-- | 
-- | Example 2: Compute Timestamp from Timestamp + Duration in pseudo code.
-- | 
-- |     Timestamp start = ...;
-- |     Duration duration = ...;
-- |     Timestamp end = ...;
-- | 
-- |     end.seconds = start.seconds + duration.seconds;
-- |     end.nanos = start.nanos + duration.nanos;
-- | 
-- |     if (end.nanos < 0) {
-- |       end.seconds -= 1;
-- |       end.nanos += 1000000000;
-- |     } else if (end.nanos >= 1000000000) {
-- |       end.seconds += 1;
-- |       end.nanos -= 1000000000;
-- |     }
-- | 
-- | Example 3: Compute Duration from datetime.timedelta in Python.
-- | 
-- |     td = datetime.timedelta(days=3, minutes=10)
-- |     duration = Duration()
-- |     duration.FromTimedelta(td)
-- | 
-- | # JSON Mapping
-- | 
-- | In JSON format, the Duration type is encoded as a string rather than an
-- | object, where the string ends in the suffix "s" (indicating seconds) and
-- | is preceded by the number of seconds, with nanoseconds expressed as
-- | fractional seconds. For example, 3 seconds with 0 nanoseconds should be
-- | encoded in JSON format as "3s", while 3 seconds and 1 nanosecond should
-- | be expressed in JSON format as "3.000000001s", and 3 seconds and 1
-- | microsecond should be expressed in JSON format as "3.000001s".
-- | 
newtype Duration = Duration DurationR
type DurationRow =
  ( seconds :: Prelude.Maybe Prelude.Int64
  , nanos :: Prelude.Maybe Int
  , __unknown_fields :: Array Prelude.UnknownField
  )
type DurationR = Record DurationRow
derive instance genericDuration :: Prelude.Generic Duration _
derive instance newtypeDuration :: Prelude.Newtype Duration _
derive instance eqDuration :: Prelude.Eq Duration
instance showDuration :: Prelude.Show Duration where show x = Prelude.genericShow x

putDuration :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Duration -> Prelude.PutM m Prelude.Unit
putDuration (Duration r) = do
  Prelude.putOptional 1 r.seconds Prelude.isDefault Prelude.encodeInt64Field
  Prelude.putOptional 2 r.nanos Prelude.isDefault Prelude.encodeInt32Field
  Prelude.foldRecM (\_ x -> Prelude.putFieldUnknown x) unit r.__unknown_fields

parseDuration :: forall m. Prelude.MonadEffect m => Prelude.MonadRec m => Prelude.ByteLength -> Prelude.ParserT Prelude.DataView m Duration
parseDuration length = Prelude.label "Duration / " $
  Prelude.parseMessage Duration defaultDuration parseField length
 where
  parseField
    :: Prelude.FieldNumberInt
    -> Prelude.WireType
    -> Prelude.ParserT Prelude.DataView m (Prelude.Builder DurationR DurationR)
  parseField 1 Prelude.VarInt = Prelude.label "seconds / " $ do
    x <- Prelude.decodeInt64
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "seconds") $ \_ -> Prelude.Just x
  parseField 2 Prelude.VarInt = Prelude.label "nanos / " $ do
    x <- Prelude.decodeInt32
    pure $ Prelude.modify (Prelude.Proxy :: Prelude.Proxy "nanos") $ \_ -> Prelude.Just x
  parseField fieldNumber wireType = Prelude.parseFieldUnknown fieldNumber wireType

defaultDuration :: DurationR
defaultDuration =
  { seconds: Prelude.Nothing
  , nanos: Prelude.Nothing
  , __unknown_fields: []
  }

mkDuration :: forall r1 r3. Prelude.Union r1 DurationRow r3 => Prelude.Nub r3 DurationRow => Record r1 -> Duration
mkDuration r = Duration $ Prelude.merge r defaultDuration

mergeDuration :: Duration -> Duration -> Duration
mergeDuration (Duration l) (Duration r) = Duration
  { seconds: Prelude.alt l.seconds r.seconds
  , nanos: Prelude.alt l.nanos r.nanos
  , __unknown_fields: r.__unknown_fields <> l.__unknown_fields
  }

