# sthysel/python
FROM debian:wheezy
ENV REFRESHED_AT 2016-01-06

MAINTAINER https://github.com/sthysel/containers/tree/master/common/python


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
