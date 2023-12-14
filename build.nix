# build.nix
{ nodejs, runCommand }:
runCommand "node-output" { buildInputs = [ nodejs ]; } ''
  node -v > $out
''