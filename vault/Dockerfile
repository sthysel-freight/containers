FROM golang:1.5
MAINTAINER sthysel <sthysel@gmail.com>
ENV REFRESHED_AT 2015-08-03

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
  apt-transport-https \
  build-essential \
  git \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN env --unset=DEBIAN_FRONTEND

# WORKDIR is set to $GOPATH in master image
WORKDIR ${GOPATH}/src/
RUN git clone https://github.com/hashicorp/vault 
WORKDIR ${GOPATH}/src/vault/
RUN make bootstrap
#RUN make dev
