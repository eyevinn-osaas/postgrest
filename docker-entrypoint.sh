#!/bin/bash

cd $HOME
LISTEN_PORT=${PORT:-8080}
postgrest -e > ./postgrest.conf
sed -i "s/server-port = 3000/server-port = ${LISTEN_PORT}/" ./postgrest.conf

if [[ ! -z "$@" ]]; then
  exec "$@"
else
  exec postgrest ./postgrest.conf
fi
