#!/bin/bash
# Bash 'Strict Mode'
# http://redsymbol.net/articles/unofficial-bash-strict-mode
# https://github.com/xwmx/bash-boilerplate#bash-strict-mode
set -o nounset
set -o errexit
set -o pipefail
IFS=$'\n\t'

export AKASH_VERSION="$(curl -s https://api.github.com/repos/akash-network/provider/releases/latest | jq -r '.tag_name')"
export AKASH_CHAIN_ID="$(curl -s "$AKASH_NET/chain-id.txt")"
export AKASH_NODE="$(curl -s "$AKASH_NET/rpc-nodes.txt" | shuf -n 1)"
export AKASH_GAS=auto
export AKASH_GAS_ADJUSTMENT=1.25
export AKASH_GAS_PRICES=0.025uakt
export AKASH_SIGN_MODE=amino-json

cat <<EOF | akash keys add --recover $AKASH_KEY_NAME
$AKASH_WALLET_SEED
asdfasdf
asdfasdf
EOF

export AKASH_ACCOUNT_ADDRESS="$(echo asdfasdf | akash keys show $AKASH_KEY_NAME -a)"

amt=$(akash query bank balances --node $AKASH_NODE $AKASH_ACCOUNT_ADDRESS | yq .balances[0].amount | tr -d '"')
deployment_balance=$(bc -l <<< "$amt/1000000.0")

echo "Deployment account has a balance of $deployment_balance"

echo "Creating cert"
echo asdfasdf | akash tx cert generate client --from $AKASH_KEY_NAME

echo "Publishing cert"
echo asdfasdf | akash tx cert publish client -y --from $AKASH_KEY_NAME

echo "Deploying"
deploy_return=$(echo asdfasdf | akash tx deployment create -y deploy.yml --from $AKASH_KEY_NAME)
export AKASH_DSEQ=$(echo $deploy_return | jq -r '.logs[0].events[0].attributes[] | select(.key=="dseq")'.value | tail -n 1)
export AKASH_OSEQ=1
export AKASH_GSEQ=1

echo "Deployed DSEQ OSEQ and GSEQ are:"
echo $AKASH_DSEQ $AKASH_OSEQ $AKASH_GSEQ

echo "giving providers 15 seconds to bid"
sleep 15

echo "getting bids"
bids=$(akash query market bid list --owner=$AKASH_ACCOUNT_ADDRESS --node $AKASH_NODE --dseq $AKASH_DSEQ --state=open | yq .)

echo "getting the cheapest provider"
cheapest_provider=$(echo $bids | jq -r '[.bids[].bid] |  sort_by(.price) | .[].bid_id.provider' | head -n 1)

echo "cheapest provider is $cheapest_provider"

export AKASH_PROVIDER=$cheapest_provider

amt=$(akash query bank balances --node $AKASH_NODE $AKASH_ACCOUNT_ADDRESS | yq .balances[0].amount | tr -d '"')
deployment_balance=$(bc -l <<< "$amt/1000000.0")

echo "Deployment account has a balance of $deployment_balance"

echo "creating lease"
status=$(echo asdfasdf | akash tx market lease create -y --dseq $AKASH_DSEQ --provider $AKASH_PROVIDER --from $AKASH_KEY_NAME)

echo "lease status is $status"

echo "Deployed DSEQ OSEQ and GSEQ are:"
echo $AKASH_DSEQ $AKASH_OSEQ $AKASH_GSEQ

echo "sending manifest"
echo asdfasdf | provider-services send-manifest deploy.yml --dseq $AKASH_DSEQ --provider $AKASH_PROVIDER --from $AKASH_KEY_NAME

echo "waiting 10 sec for manifest to apply"
sleep 10

echo "showing uri"
echo asdfasdf | provider-services lease-status --dseq $AKASH_DSEQ --from $AKASH_KEY_NAME --provider $AKASH_PROVIDER | jq -r .services.web.uris[0]

echo "viewing logs"
echo asdfasdf | provider-services provider-services lease-logs \
  --dseq "$AKASH_DSEQ" \
  --provider "$AKASH_PROVIDER" \
  --from "$AKASH_KEY_NAME"