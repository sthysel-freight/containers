FROM ubuntu:latest
MAINTAINER sthysel <sthysel@gmail.com>
ENV REFRESHED_AT 2015-03-22

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
  apt-transport-https \
  build-essential \
  cmake \
  git \
  tree \
  vim \
  wireshark
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# home env
ENV HOME /home/dev
RUN useradd dev
RUN mkdir ${HOME} && chown -R dev: ${HOME} 
RUN mkdir -p ${HOME} ${HOME}/bin ${HOME}/include

WORKDIR /home/dev
USER dev
