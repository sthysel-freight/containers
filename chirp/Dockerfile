FROM ubuntu
MAINTAINER sthysel <sthysel@gmail.com>

ENV REFRESHED_AT 2015-06-16
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get dist-upgrade -y

RUN apt-get -y install software-properties-common
RUN apt-add-repository ppa:dansmith/chirp-snapshots
RUN apt-get update && apt-get install -y \
        chirp-daily \
        --no-install-recommends

# do the mkdir, volume tango to avoid permission issues
RUN mkdir /data
VOLUME /data

CMD ["/usr/bin/chirpw"]

