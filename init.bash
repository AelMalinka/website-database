#!/bin/bash
# Copyright 2017 (c) Michael Thomas (malinka) <malinka@entropy-development.com>
# Distributed under the terms of the GNU Affero General Public License v3

pg_ctl initdb
pg_ctl start

user="${PGUSER}"
db="${PGDATABASE}"
pass="${PGPASSWORD}"

unset PGUSER
unset PGDATABASE
unset PGPASSWORD

echo "Creating user"
echo | createuser -DRSP ${user} << EOF 
${pass}
${pass}
EOF

echo "Creating database"
createdb -O ${user} ${db}

echo "enabling connections"
echo "host	all	all	0.0.0.0/0	md5" >> "${PGDATA}/pg_hba.conf"

pg_ctl stop
