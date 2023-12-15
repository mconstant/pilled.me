# build.nix
{ nodejs, runCommand }:
runCommand "node-output" { buildInputs = [ nodejs ]; } ''
  cd cosmos.pilled.me && nix-build
''