
# PureScript plugin for Protoc

## Build

```shell
spago build
```

## Bundle and Run

```shell
spago bundle --platform node --minify --bundle-type app --outfile protoc-gen-purescript.mjs
```

```shell
protoc --plugin=protoc-gen-purescript=./protoc-gen-purescript.mjs --purescript_out=. google/protobuf/timestamp.proto
```

## Unit Tests

To test purescript-protobuf, run `nix develop` from the top level directory
of the repo, then:

```shell
protoc --purescript_out=./plugin/test/Test/generated ./plugin/test/*.proto
```

Or, for the bundled plugin, not the Nix store:

```shell
protoc --plugin=protoc-gen-purescript=./protoc-gen-purescript.mjs --purescript_out=./test/Test/generated --proto_path ./test ./test/*.proto
```

then

```shell
spago test
```

## Benchmarks

To run the benchmarks, run `nix develop` from the top level directory, then:

```console
cd plugin
```
```console
spago test --main Test.Bench
```


## Development

The funny thing about writing a `protoc` compiler plugin codec is that it
bootstraps itself. We just have to write enough of the compiler plugin codec
that it can handle the `plugin.proto` and `descriptor.proto` files, and
then we call the compiler plugin on these `.proto` files and the compiler
plugin codec generates the rest of itself.

Then we can delete the hand-written code and generate code to replace it
with this command.

```shell
protoc --plugin=protoc-gen-purescript=./protoc-gen-purescript.mjs --purescript_out=./src google/protobuf/compiler/plugin.proto
```

See
* https://protobuf.dev/reference/cpp/api-docs/google.protobuf.compiler.plugin.pb/
* https://protobuf.dev/reference/cpp/api-docs/google.protobuf.descriptor.pb