#!/bin/bash

COMMAND=$1

# test
if [ "${COMMAND}" = 'test' ]
then
  echo "SDR Test"
  /usr/local/bin/rtl_test -t
fi

# ADS
if [ "${COMMAND}" = "ads" ]
then
  echo "DUMP 1090 ADS"
  cd /build/dump1090/
  ./dump1090 --net --aggressive
fi

echo "[RUN]: Builtin command not provided [test|ads]"
echo "[RUN]: $@"

exec "$@"

