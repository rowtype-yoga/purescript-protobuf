# Protocol Buffer Conformance Testing

## Running the conformance test

From the top directory of this repo,

```console
nix run .#conformance
```
or
```console
cd conformance
spago build
```
```console
conformance_test_runner --enforce_recommended bin/conformance-purescript
```

## About the conformance test runner

[Conformance README](https://github.com/protocolbuffers/protobuf/tree/master/conformance)

The derivations in `nix/protobuf.nix` will build `protoc` and the
`conformance-test-runner`.

## Dev

To generate the conformance `.purs` in the dev environment:

```console
protoc --purescript_out=./conformance/src/generated --proto_path=$(nix path-info .#protobuf)/conformance $(nix path-info .#protobuf)/conformance/conformance.proto
```
```console
protoc --purescript_out=./conformance/src/generated --proto_path=$(nix path-info .#protobuf)/src $(nix path-info .#protobuf)/src/google/protobuf/test_messages_proto3.proto
```