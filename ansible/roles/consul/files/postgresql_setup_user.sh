#!/bin/bash

# Edit the following to change the name of the database user that will be created:
APP_DB_USER=$1
APP_DB_PASS=$2

# Edit the following to change the name of the database that is created (defaults to the user name)
APP_DB_NAME=$3

# Edit the following to change the version of PostgreSQL that is installed
PG_VERSION=9.4

PG_CONF="/etc/postgresql/$PG_VERSION/main/postgresql.conf"
PG_HBA="/etc/postgresql/$PG_VERSION/main/pg_hba.conf"
PG_DIR="/var/lib/postgresql/$PG_VERSION/main"

cat << EOF | su - postgres -c psql

CREATE USER $APP_DB_USER WITH PASSWORD '$APP_DB_PASS';
CREATE DATABASE $APP_DB_NAME OWNER $APP_DB_USER  LC_COLLATE='en_US.utf8' ENCODING='UTF8' TEMPLATE=template0;
alter role $APP_DB_USER login ; 
alter role $APP_DB_USER createdb ;

\c $APP_DB_NAME;
CREATE EXTENSION IF NOT EXISTS hstore;
CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE EXTENSION IF NOT EXISTS unaccent;
EOF
