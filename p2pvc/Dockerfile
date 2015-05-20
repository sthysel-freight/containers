FROM ubuntu:14.04
MAINTAINER sthysel <sthysel@gmail.com>

ENV REFRESHED_AT 2015-02-09

RUN apt-get update && apt-get install -y \
    portaudio19-dev \
    ncurses-dev \
    libopencv-dev \
    libpulse-dev \
    git
 
ENV SRC /src/
RUN mkdir -p ${SRC}/
WORKDIR ${SRC}
RUN git clone https://github.com/mofarrell/p2pvc.git 
RUN cd p2pvc && make


EXPOSE 55555
EXPOSE 55556

COPY ./epoint.sh /epoint.sh

ENTRYPOINT ["/epoint.sh"]
CMD ["test"]
