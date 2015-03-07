#!/bin/bash

COMMAND=$1

if [ "${COMMAND}" = 'test' ]
then
  echo "SDR Test"
  /usr/local/bin/rtl_test -t
fi

echo "[RUN]: Builtin command not provided [test]"
echo "[RUN]: $@"

exec "$@"

