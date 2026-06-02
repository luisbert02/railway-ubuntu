#!/bin/bash
set -e

USERNAME="${USERNAME:-admin}"
PASSWORD="${PASSWORD:-changeme123}"

echo "PORT: $PORT"

exec /usr/local/bin/ttyd \
    -p ${PORT} \
    -c "${USERNAME}:${PASSWORD}" \
    -W \
    -i \
    /bin/bash
