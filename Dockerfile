# FROM python:3.9.18-alpine3.18

# RUN apk add build-base

# RUN apk add postgresql-dev gcc python3-dev musl-dev

# ARG FLASK_APP
# ARG FLASK_ENV
# ARG DATABASE_URL
# ARG SCHEMA
# ARG SECRET_KEY

# WORKDIR /var/www

# COPY requirements.txt .

# RUN pip install -r requirements.txt
# RUN pip install psycopg2

# COPY . .

# RUN flask db upgrade
# RUN flask seed all
# CMD gunicorn app:app

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# This Works with Docker Compose and the render.yaml Blueprint deployment


FROM python:3.11-slim

# Install system dependencies
# RUN apk add --no-cache build-base postgresql-dev gcc python3-dev musl-dev netcat-openbsd
# RUN apt-get --no-cache build-base postgresql-dev gcc python3-dev musl-dev netcat-openbsd


RUN apt-get update && apt-get install -y \
    build-essential \
    postgresql-client libpq-dev \
    gcc python3-dev \
    netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*


# ARG PIP_DISABLE_PIP_VERSION_CHECK=1
# ARG PIP_NO_CACHE_DIR=1

# Copy and install Python dependencies

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install psycopg2
RUN pip install --no-cache-dir psycopg2

# Set the working directory
WORKDIR /var/www


# Copy the application files
COPY . .

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]

# Command to start the application
CMD ["gunicorn", "app:app"]
