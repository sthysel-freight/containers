#!/bin/bash

xhost +
docker build -t sthysel/glxtoys .
docker run --rm --privileged -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --device /dev/dri/card0 sthysel/glxtoys
