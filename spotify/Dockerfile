# Run spotify in a container
# Stolen from https://github.com/jfrazelle/dockerfiles/tree/master/spotify
#
# docker run -d \
#   -v /etc/localtime:/etc/localtime:ro \
#   -v /tmp/.X11-unix:/tmp/.X11-unix \
#   -e DISPLAY=unix$DISPLAY \
#   --device /dev/snd:/dev/snd \
#   -v $HOME/.spotify/config:/root/.config/spotify \
#   -v $HOME/.spotify/cache:/root/.cache/spotify \
#   --name spotify \
#   sthysel/spotify
#
FROM ubuntu:14.04
MAINTAINER sthysel <sthysel@gmail.com>

ENV REFRESHED_AT 2015-07-14

RUN apt-get update && apt-get install -y \
    libpangoxft-1.0-0 \
    alsa-utils \
    software-properties-common \
    --no-install-recommends && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886 && \
    echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list && \
    apt-get update && \
    apt-get install -y \
    spotify-client

ENTRYPOINT  [ "/usr/bin/spotify" ]
