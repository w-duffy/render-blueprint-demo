#!/bin/sh

# ~~~~~~~~~~~~~ This Works For Local Testing ~~~~~~~~~~~~~~~~
echo "Waiting for PostgreSQL to start..."
while ! nc -z db 5432; do
  sleep 0.1
done
echo "PostgreSQL started"

flask db upgrade

flask seed all

exec gunicorn app:app --bind 0.0.0.0:8000
# exec gunicorn app:app


# Above works for local production envionment

# ~~~~~~~~~~~~~~~~ this works for PRODUCITON using a blueprint defined in the render.yaml:~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# echo "PostgreSQL started"

# flask db upgrade
# flask seed all
# exec gunicorn app:app
