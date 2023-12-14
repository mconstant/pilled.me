# default.nix
let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-22.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
  build = pkgs.callPackage ./build.nix {};
in
{
  inherit build;
  shell = pkgs.mkShell {
    buildInputs = [ 
      pkgs.direnv
      pkgs.git
      pkgs.less 
    ];
    inputsFrom = [ build ];

    shellHook = ''
      git config --local include.path "$PWD/.gitconfig"
    '';
  };
}