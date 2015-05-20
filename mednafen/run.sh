#!/bin/bash

WORKING_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
XSOCK=/tmp/.X11-unix/X0
docker run -v ${XSOCK}:${XSOCK} -v ${WORKING_DIR}/dotmednafen:/root/.mednafen/ sthysel/mednafen
