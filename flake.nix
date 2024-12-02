{
  description = "PureScript Protobuf";

  # for mkSpagoDerivation
  nixConfig.sandbox = "relaxed";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-24.05;
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    purescript-overlay = {
      url = "github:thomashoneyman/purescript-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mkSpagoDerivation = {
      url = "github:jeslie0/mkSpagoDerivation";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      supportedSystems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];

      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      library-src = ./library/src;

      nixpkgsFor = forAllSystems (system: import nixpkgs {
        inherit system;
        config = { };
        overlays = builtins.attrValues self.overlays ++ [
          inputs.purescript-overlay.overlays.default
          inputs.mkSpagoDerivation.overlays.default
          (prev: final: import ./nix/protobuf.nix final)
          (prev: final: {
            purescript-protobuf-library = prev.mkSpagoDerivation {
              name = "purescript-protobuf-library";
              src = ./library;
              nativeBuildInputs = with prev; [ purs spago-unstable ];
              buildPhase = "spago build";
              installPhase = "mkdir $out; cp -r output/* $out/";
            };
          })
          (prev: final: {
            purescript-protobuf-plugin = prev.mkSpagoDerivation {
              name = "purescript-protobuf-plugin";
              src = ./plugin;
              nativeBuildInputs = with prev; [ purs spago-unstable purs-backend-es esbuild];
              buildPhase = ''
                spago build --purs-args '${prev.purescript-protobuf-library.src}/src/**/*.purs'
                '';
                # The bundled minified output is CommonJS, so we need to change the run script to run node with CommonJS?
                # spago build --purs-args '${prev.purescript-protobuf-library.src}/**/*.purs'
                # purs-backend-es bundle-app --no-build --platform node --minify --output-dir output --main ProtocPlugin.Main
                # spago bundle --offline --pure --platform node --bundle-type app --minify --module ProtocPlugin.Main --purs-args '${prev.purescript-protobuf-library.src}/**/*.purs'
              installPhase = "mkdir $out; cp -r output/* $out/";
            };
          })
          (prev: final: {
            purescript-protobuf-conformance = prev.mkSpagoDerivation {
              name = "purescript-protobuf-conformance";
              src = ./conformance;
              nativeBuildInputs = with prev; [ purs spago-unstable purs-backend-es esbuild];
              buildPhase = ''
                spago build --purs-args '${prev.purescript-protobuf-library.src}/src/**/*.purs'
                '';
              installPhase = "mkdir $out; cp -r output/* $out/";
            };
          })
          (prev: final: {
              protoc-gen-purescript = prev.writeScriptBin "protoc-gen-purescript" ''
                ${prev.nodejs}/bin/node --input-type=module -e "import {main} from '${final.purescript-protobuf-plugin}/ProtocPlugin.Main/index.js'; main();"
                '';
              conformance-purescript = prev.writeScriptBin "conformance-purescript" ''
                #!/usr/bin/env bash
                ${prev.nodejs}/bin/node --abort-on-uncaught-exception --trace-sigint --trace-uncaught --input-type=module -e "import {main} from '${final.purescript-protobuf-conformance}/Main/index.js'; main();"
                '';
            }
          )
        ];
      });

    in {
      overlays = {
      };

      packages = forAllSystems (system:
        let pkgs = nixpkgsFor.${system}; in {
          protoc-gen-purescript = pkgs.protoc-gen-purescript;
          conformance-purescript = pkgs.conformance-purescript;
          protobuf_v28_2 = pkgs.protobuf_v28_2;
          protobuf = pkgs.protobuf_v28_2;
        });

      devShells = forAllSystems (system:
        let pkgs = nixpkgsFor.${system}; in {
          default = pkgs.mkShell {
            name = "purescript-protobuf-devshell";
            inputsFrom = builtins.attrValues self.packages.${system};
            buildInputs = with pkgs; [
              purs
              spago-unstable
              purs-tidy-bin.purs-tidy-0_10_0
              purs-backend-es
              purescript-language-server
              nodejs
              protobuf
              esbuild
              protoc-gen-purescript
            ];

            # spago sources not working, TODO
            shellHook = ''
              source <(spago --bash-completion-script `which spago`)
              source <(node --completion-bash)
              export PURS_IDE_SOURCES=$(spago sources --package protobuf)
              echo "PureScript Protobuf development environment"
              protoc --version
              echo -n "node "
              node --version
              echo -n "purs "
              purs --version
              echo -n "spago "
              spago --version
              echo ""
              echo "To build the protoc compiler plugin, run:"
              echo ""
              echo "    cd plugin; spago build"
              echo ""
              echo "To compile PureScript .purs files from .proto files, run for example:"
              echo ""
              echo "    protoc --purescript_out=. google/protobuf/timestamp.proto"
              echo ""'';
          };
        });


      apps = forAllSystems (system:
        let pkgs = nixpkgsFor.${system}; in {
          protoc = {
            type = "app";
            program = "${pkgs.protobuf}/bin/protoc";
          };
          protoc-gen-purescript = {
            type = "app";
            program = "${pkgs.protoc-gen-purescript}/bin/protoc-gen-purescript";
          };
          conformance_test_runner = {
            type = "app";
            program = "${pkgs.protobuf}/bin/conformance_test_runner";
          };
          conformance-purescript = {
            type = "app";
            program = "${pkgs.conformance-purescript}/bin/conformance-purescript";
          };
          conformance =
            let
              conformance-run = pkgs.writeScriptBin "conformance" ''
                set -e
                set -x
                ${pkgs.protobuf}/bin/conformance_test_runner --enforce_recommended ${pkgs.conformance-purescript}/bin/conformance-purescript
                '';
            in
            {
              type = "app";
              program = "${conformance-run}/bin/conformance";
            };
        }
      );
    };
}
