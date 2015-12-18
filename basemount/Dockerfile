FROM ubuntu:14.04
MAINTAINER sthysel <sthysel@gmail.com>
ENV REFRESHED_AT 2015-12-18

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
  apt-transport-https \
  ca-certificates \
  software-properties-common \
  curl \
  wget \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN env --unset=DEBIAN_FRONTEND

RUN bash -c "$(curl -L https://basemount.basespace.illumina.com/install/)"
VOLUME /data
WORKDIR /data
ENTRYPOINT ["basemount"]
