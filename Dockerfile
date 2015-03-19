FROM python:3.4
MAINTAINER sthysel <sthysel@gmail.com>
ENV REFRESHED_AT 2015-03-18
ENV WEEWX_VERSION 3.1.0

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
  apt-transport-https \
  build-essential \
  cmake \
  libusb-1.0-0-dev \ 
  git \
  pkg-config
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /build

RUN set -x \
  && cd /build/ \
  && wget -c https://github.com/weewx/weewx/releases/download/v${WEEWX_VERSION}/weewx-${WEEWX_VERSION}.tar.gz \
  && tar xzvf weewx-${WEEWX_VERSION}.tar.gz \
  && cd weewx-${WEEWX_VERSION}

WORKDIR /build/weewx-${WEEWX_VERSION}
COPY weewx.conf /build/weewx-${WEEWX_VERSION}/weewx.conf
RUN python ./setup.py


