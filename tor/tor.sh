#!/bin/bash

xhost +

docker run -it --rm \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=unix$DISPLAY \
  -v /dev/snd:/dev/snd \
  --privileged \
  --name torb \
  sthysel/tor
