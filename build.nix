# build.nix
{ nodejs, jq, curl, go, runCommand }:
runCommand "node-output" { buildInputs = [ nodejs jq curl go ]; } ''
  go get -d github.com/akash-network/provider
  cd $GOPATH/src/github.com/akash-network/provider
  AKASH_NET="https://raw.githubusercontent.com/akash-network/net/main/mainnet"
  AKASH_VERSION="$(curl -s https://api.github.com/repos/akash-network/provider/releases/latest | jq -r '.tag_name')"
  git checkout "v$AKASH_VERSION"
  make deps-install
  make install
''