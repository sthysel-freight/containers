FROM ubuntu:latest
MAINTAINER sthysel <sthysel@gmail.com>
ENV REFRESHED_AT 2015-02-09

ENV HOME /root
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

ENV DEBIAN_FRONTEND noninteractive

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list

RUN apt-get update && apt-get install -y --no-install-recommends language-pack-en 
RUN locale-gen en_US 
RUN apt-get update && apt-get install -y --no-install-recommends \
  apt-transport-https \
  build-essential \
  ca-certificates 
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN addgroup --gid 1000 radioman 
RUN adduser --disabled-password --home /data --no-create-home --system -q --uid 1000 --ingroup radioman radioman
RUN mkdir /data 
RUN chown radioman:radioman /data

