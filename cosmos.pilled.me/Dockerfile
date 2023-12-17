# Nix builder
FROM nixos/nix:latest AS builder
ARG CORES
ARG JOBS

ENV CORES=$CORES
ENV JOBS=$JOBS

# Copy our source and setup our working dir.
COPY . /tmp/build
WORKDIR /tmp/build

# Build our Nix environment
RUN nix build --extra-experimental-features nix-command --extra-experimental-features flakes --cores $CORES --max-jobs $JOBS

# Copy the Nix store closure into a directory. The Nix store closure is the
# entire set of Nix store values that we need for our build.
RUN mkdir /tmp/nix-store-closure
RUN cp -R $(nix-store -qR result) /tmp/nix-store-closure

# Final image is based on scratch. We copy a bunch of Nix dependencies
# but they're fully self-contained so we don't need Nix anymore.
FROM node:hydrogen-alpine3.19

RUN apk add dumb-init
RUN npm install -g pm2

WORKDIR /app

# expose 8080 on container
EXPOSE 8080

# set app host and port and env as production
ENV HOST=0.0.0.0 PORT=8080 NODE_ENV=production

# Copy /nix/store
COPY --from=builder /tmp/nix-store-closure /nix/store
COPY --from=builder /tmp/build/package.json /app
COPY --from=builder /tmp/build/yarn.lock /app
COPY --from=builder /tmp/build/result/lib /app
CMD ["pm2-runtime","start","index.js"]
