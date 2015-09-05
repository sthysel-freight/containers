FROM debian:jessie
MAINTAINER sthysel <sthysel@gmail.com>
ENV REFRESHED_AT 2015-08-17.2

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
  apt-transport-https \
  build-essential \
  ca-certificates \
  ctags \
  flex \
  lemon \
  git \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN env --unset=DEBIAN_FRONTEND

RUN mkdir /src/
WORKDIR /src/
RUN git clone https://github.com/johnkerl/miller.git
# RUN cd ./miller/ && make c
