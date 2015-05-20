# Doker container for weewx
FROM python:2.7
MAINTAINER sthysel <sthysel@gmail.com>
ENV REFRESHED_AT 2015-03-18
ENV WEEWX_VERSION v3.1.0

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
  apt-transport-https \
  build-essential \
  cmake \
  libusb-1.0-0-dev \
  git \
  pkg-config \
  python-pip

# Python deps
RUN  pip install configobj

ENV BUILD_DIR /src/
VOLUME ${BUILD_DIR} 
WORKDIR ${BUILD_DIR}/weewx/
COPY weewx.conf ${BUILD_DIR}/weewx/weewx.conf


