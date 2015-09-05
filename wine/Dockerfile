# https://github.com/monokrome/docker-wine

FROM ubuntu
MAINTAINER <sthysel@gmail.com>

RUN dpkg --add-architecture i386

RUN apt-get update -y
RUN apt-get install -y software-properties-common && add-apt-repository -y ppa:ubuntu-wine/ppa
RUN apt-get update -y

RUN apt-get install -y wine1.7 winetricks xvfb

RUN apt-get purge -y software-properties-common
RUN apt-get autoclean -y
