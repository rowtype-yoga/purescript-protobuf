# Protocol Buffer Conformance Testing

## Running the conformance test

### Running with Nix

From the top directory of this repo,

```shell
nix run .#conformance
```

### Running from output/

```shell
cd conformance
```
```shell
spago build
```
```shell
conformance_test_runner --enforce_recommended bin/conformance-purescript
```

### Running from bundled executable

```shell
cd conformance
```
```shell
spago bundle --platform=node --minify --bundle-type app --outfile conformance.mjs
```
```shell
conformance_test_runner --enforce_recommended ./conformance.mjs
```

## About the conformance test runner

[Conformance README](https://github.com/protocolbuffers/protobuf/tree/master/conformance)

The derivations in `nix/protobuf.nix` will build `protoc` and the
`conformance-test-runner`.

## Dev

To generate the conformance `.purs` in the dev environment:

```shell
protoc --purescript_out=./conformance/src/generated --proto_path=$(nix path-info .#protobuf)/conformance $(nix path-info .#protobuf)/conformance/conformance.proto
```
```shell
protoc --purescript_out=./conformance/src/generated --proto_path=$(nix path-info .#protobuf)/src $(nix path-info .#protobuf)/src/google/protobuf/test_messages_proto3.proto
```