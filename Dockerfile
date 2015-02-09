FROM ubuntu:14.04
MAINTAINER sthysel@gmail.com

ENV REFRESHED_AT 2015-02-09

RUN apt-get update && apt-get install -y \
    ncurses-dev \
    libopencv-dev \
    libpulse-dev \
    git
 
ENV SRC /src/
RUN mkdir -p ${SRC}/
WORKDIR ${SRC}
RUN git clone https://github.com/mofarrell/p2pvc.git 
RUN cd p2pvc; make

CMD["/src/p2pvc/p2pvc", "127.0.0.1", "-v"]
