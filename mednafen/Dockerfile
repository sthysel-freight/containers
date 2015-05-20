FROM ubuntu:latest
MAINTAINER sthysel <sthysel@gmail.com>
ENV REFRESHED_AT 2015-03-07

RUN apt-get update && apt-get install -y --no-install-recommends \
   mednafen

ENV DISPLAY :0

CMD ["/usr/games/mednafen"]
