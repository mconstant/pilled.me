{
  description = "Example of a project that integrates nix flake with yarn.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        node-modules = pkgs.mkYarnPackage {
          name = "node-modules";
          src = ./.;
        };
        frontend = pkgs.stdenv.mkDerivation {
          name = "frontend";
          src = ./.;
          buildInputs = [pkgs.yarn node-modules];
          buildPhase = ''
            ln -s ${node-modules}/libexec/cosmos.pilled.me/node_modules node_modules
            ${pkgs.yarn}/bin/yarn --offline --frozen-lockfile build
          '';
          installPhase =  ''
          mkdir $out
          mv build $out/lib
          '';

        };
      in 
        {
          packages = {
            node-modules = node-modules;
            default = frontend;
          };
        }
    );
}
