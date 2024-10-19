# Nix function which takes a spago.lock file and returns a nix derivation
# with an environment variable SPAGOLOCK2NIX_GLOB which
# can be passed to purs compile to include all of the spago.lock dependencies.
#
# Usage:
#
# let
#   spagolock2nix = callPackage (import ./spagolock2nix.nix);
# in
#   mkShell {
#     name = "purescript-dev";
#     buildInputs = [
#       (spagolock2nix (builtins.readFile ./spago.lock))
#     ];
#

{ stdenv, ...}: spagolockfile:
  let
    spagolockyaml = builtins.fromJSON spagolockfile;
    dependencies = builtins.attrNames spagolockyaml.packages;
    outfile = builtins.toFile "dependencies" (builtins.toString dependencies);
  in
  stdenv.mkDerivation {
    # https://github.com/purifix/purifix/blob/master/nix/build-support/purifix/from-yaml.nix
    name = "spagolock2nix";
    # src = ;
    # buildInputs = [ ];
    phases = ["installPhase"];
    installPhase = ''
      mkdir -p $out
      cp ${outfile} $out/dependencies
    '';
      # echo "export SPAGOLOCK2NIX_GLOB=$(jq -r '.dependencies | keys | map("*" + . + "*") | join(" ")' $src)" > $out/spagolock2nix-env
    SPAGOLOCK2NIX_GLOB = "globs for purs";
  }