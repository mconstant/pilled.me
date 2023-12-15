{
  system ? builtins.currentSystem,
  sources ? import ./nix/sources.nix,
}:
let
  pkgs = import sources.nixpkgs {
    config = { };
    overlays = [ ];
    inherit system;
  };
  build = pkgs.callPackage ./build.nix {};
in
{
  inherit build;
  shell = pkgs.mkShell {
    buildInputs = [ 
      pkgs.direnv
      pkgs.git
      pkgs.less
      pkgs.openssh 
    ];
    inputsFrom = [ build ];

    shellHook = ''
      git config --local include.path "$PWD/.gitconfig"
      cd cosmos.pilled.me && nix-build
    '';
  };
}