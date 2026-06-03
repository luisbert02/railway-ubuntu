#!/bin/bash
set -e

USERNAME="${USERNAME:-admin}"
PASSWORD="${PASSWORD:-changeme123}"
PORT="${PORT:-8080}"

echo "PORT: $PORT"

exec /usr/local/bin/ttyd \
    -p ${PORT} \
    -c "${USERNAME}:${PASSWORD}" \
    -W \
    /bin/bash
