FROM ghcr.io/akash-network/node:latest

ENV AKASH_NET="https://raw.githubusercontent.com/akash-network/net/main/mainnet"
ENV AKASH_VERSION="v0.4.8"

ENV AKASH_KEY_NAME=pilledme
ENV AKASH_KEYRING_BACKEND=os

RUN apt-get update
RUN apt-get install curl jq bc python3-pip git sudo -y
RUN pip3 install yq

RUN useradd -m -s /bin/zsh linuxbrew && \
    usermod -aG sudo linuxbrew &&  \
    mkdir -p /home/linuxbrew/.linuxbrew && \
    chown -R linuxbrew: /home/linuxbrew/.linuxbrew
USER linuxbrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
USER root
RUN chown -R $CONTAINER_USER: /home/linuxbrew/.linuxbrew
ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"
RUN git config --global --add safe.directory /home/linuxbrew/.linuxbrew/Homebrew
USER linuxbrew
RUN brew update
RUN brew doctor

RUN brew tap akash-network/tap
RUN brew install akash-provider-services

User root

COPY ./entrypoint.sh .
COPY ./deploy.yml .

RUN chmod +x entrypoint.sh

CMD ["tail","-f","/dev/null"]
ENTRYPOINT ["./entrypoint.sh"]