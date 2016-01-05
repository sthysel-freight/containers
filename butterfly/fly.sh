#!/bin/bash 

set -e

readonly PROGNAME=$(basename $0)
readonly PROGDIR=$(readlink -m $(dirname $0))
readonly ARGS="$@"

: ${BUTTERFLY_PORT:="9191"}

exec docker run \
    --env PASSWORD=password \
    --env PORT=${BUTTERFLY_PORT} \
    --hostname="butterfly" \
    --publish=${BUTTERFLY_PORT}:${BUTTERFLY_PORT} \
    sthysel/butterfly

