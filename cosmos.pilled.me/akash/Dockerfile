FROM ghcr.io/akash-network/node:latest

ENV AKASH_NET="https://raw.githubusercontent.com/akash-network/net/main/mainnet"
ENV AKASH_VERSION="v0.4.8"

ENV AKASH_KEY_NAME=pilledme
ENV AKASH_KEYRING_BACKEND=os

COPY ./entrypoint.sh .

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]