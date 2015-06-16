#!/bin/bash

xhost +
docker run -it --rm --privileged -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/bus/usb:/dev/bus/usb -e DISPLAY=unix$DISPLAY --name=chirp --hostname=chirp sthysel/chirp
