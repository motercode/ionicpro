FROM beevelop/android

ENV NODEJS_VERSION=10.x \
PATH=$PATH:/opt/node/bin

WORKDIR "/opt/node"

RUN apt-get update && apt-get install -y curl git ca-certificates --no-install-recommends && \
curl -sL https://deb.nodesource.com/setup_${NODEJS_VERSION} | bash   && \
apt-get install -y nodejs && \
apt-get clean && \
cd /tmp && \
npm i -g --unsafe-perm cordova@latest && \
apt-get update && apt-get install -y git bzip2 openssh-client && \
npm i -g --unsafe-perm ionic@latest && \
ionic --no-interactive config set -g daemon.updates false && \
rm -rf /var/lib/apt/lists/* && apt-get clean
