
# PureScript plugin for Protoc

Build:

```
spago build
```

The funny thing about writing a `protoc` compiler plugin codec is that it
bootstraps itself. We just have to write enough of the compiler plugin codec
that it can handle the `plugin.proto` and `descriptor.proto` files, and
then we call the compiler plugin on these `.proto` files and the compiler
plugin codec generates the rest of itself.

Then we can delete the hand-written code and generate code to replace it
with this command.

```shell
protoc --purescript_out=./plugin/src/ProtocPlugin google/protobuf/compiler/plugin.proto
```

See
* https://protobuf.dev/reference/cpp/api-docs/google.protobuf.compiler.plugin.pb/
* https://protobuf.dev/reference/cpp/api-docs/google.protobuf.descriptor.pb