# Unit Tests

`unittest_proto3_optional.proto` is copied from
`$(dirname $(which protoc))/../src/google/protobuf/unittest_proto3_optional.proto`

To test purescript-protobuf, run `nix develop` from the top level directory
of the repo, then:

```console
protoc --purescript_out=./plugin/test/Test/generated ./plugin/test/*.proto
```
or, for the plugin from src tree, not the Nix store,
``console
protoc --plugin=bin/protoc-gen-purescript --purescript_out=./plugin/test/Test/generated ./plugin/test/*.proto
```
then
```console
cd plugin
```
```console
spago build
```
```console
spago test
```

# Benchmarks

To run the benchmarks, run `nix develop` from the top level directory, then:

```console
cd plugin
```
```console
spago test --main Test.Bench
```

