#!/bin/bash

cd $HOME
LISTEN_PORT=${PORT:-8080}
postgrest -e > ./postgrest.conf
sed -i "s/server-port = 3000/server-port = ${LISTEN_PORT}/" ./postgrest.conf
if [[ ! -z "$DB_ANON_ROLE" ]]; then 
  sed -i "s/# db-anon-role = \"anon\"/db-anon-role = \"${DB_ANON_ROLE}\"/" ./postgrest.conf
fi
if [[ ! -z "$DB_SCHEMAS" ]]; then 
  sed -i "s/db-schemas = \"public\"/db-schemas = \"${DB_SCHEMAS}\"/" ./postgrest.conf
fi

if [[ ! -z "$@" ]]; then
  exec "$@"
else
  exec postgrest ./postgrest.conf
fi
