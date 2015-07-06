# sthysel/python
FROM debian:jessie

MAINTAINER sthysel <sthysel@gmail.com>

ENV REFRESHED_AT 2015-07-06

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    gcc \
    locales \
    libxml2-dev \
    python \
    python-dev \
    python-pip \
    make

RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8
