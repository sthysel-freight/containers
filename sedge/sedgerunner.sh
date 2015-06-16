#!/bin/bash

set -e
set -u

COMMAND=$1

helps="-h help "
if [[ $helps =~ ${COMMAND} ]]
then
    echo ${HELPSTR}
    exit 0
fi

if [[ ${COMMAND} = "" ]]
then
    echo ${HELPSTR}
    exit 0
fi

echo "[RUN]: $@"
exec "$@"
