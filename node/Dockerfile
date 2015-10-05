# Doker container for node
FROM debian:jessie
MAINTAINER sthysel <sthysel@gmail.com>
ENV REFRESHED_AT 2015-10-5

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
      ca-certificates \
      apt-transport-https \
      git \
      wget 

ENV NVM_DIR /nvm/
RUN mkdir -p ${NVM_DIR}

RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.28.0/install.sh | bash

RUN /bin/bash -c "source /nvm/nvm.sh; nvm install stable; nvm install unstable"
