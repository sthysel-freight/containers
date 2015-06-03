#  docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --device /dev/dri sthysel/glxtoys
FROM debian:jessie
MAINTAINER sthysel <sthysel@gmail.com> 

# Install all the things
RUN apt-get update && apt-get install -y \
    mesa-utils \
    --no-install-recommends

ENV LIBGL_DEBUG verbose

ENTRYPOINT [ "glxgears" ]
