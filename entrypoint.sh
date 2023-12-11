#!/bin/sh


# echo "Waiting for PostgreSQL to start..."
# while ! nc -z db 5432; do
#   sleep 0.1
# done
# echo "PostgreSQL started"

# flask db upgrade

# flask seed all

# exec gunicorn app:app --bind 0.0.0.0:8000
# exec gunicorn app:app


# Above works locally.  Below is for testing deploying render blueprint
# Extract host and port from DATABASE_URL
# db_host=$(echo $DATABASE_URL | cut -d '@' -f 2 | cut -d ':' -f 1)
# db_port=$(echo $DATABASE_URL | cut -d '@' -f 2 | cut -d ':' -f 2 | cut -d '/' -f 1)

# echo "Waiting for PostgreSQL to start at $db_host:$db_port..."
# while ! nc -z $db_host $db_port; do
#   sleep 0.1
# done
echo "PostgreSQL started"

flask db upgrade
flask seed all
exec gunicorn app:app --bind 0.0.0.0:8000
