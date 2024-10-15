# Unit Tests

`unittest_proto3_optional.proto` is copied from
`$(dirname $(which protoc))/../src/google/protobuf/unittest_proto3_optional.proto`

To test purescript-protobuf, run `nix develop` from the top level directory
of the repo, then in this directory:

```console
spago build
```
```console
protoc --purescript_out=./plugin/test/Test/generated ./plugin/test/*.proto
```
```console
spago test
```

# Benchmarks

To run the benchmarks, run `nix develop` from the top level directory, then
in this directory:

```console
spago test --main Test.Bench
```

