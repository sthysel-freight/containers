# relatively up to date ubuntu:latest
# sthysel/ubuntubuilder
FROM ubuntu:latest
MAINTAINER sthysel <sthysel@gmail.com>
ENV REFRESHED_AT 2015-07-03

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
  apt-transport-https \
  build-essential \
  git \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN env --unset=DEBIAN_FRONTEND
