#!/bin/bash

XSOCK=/tmp/.X11-unix/X0
docker run -v ${XSOCK}:${XSOCK} sthysel/mednafen
