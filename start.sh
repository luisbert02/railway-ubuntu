#!/bin/bash
set -e

USERNAME="${USERNAME:-admin}"
PASSWORD="${PASSWORD:-changeme123}"

echo "Iniciando ttyd en puerto $PORT"

exec /usr/local/bin/ttyd \
    -p ${PORT} \
    -c "${USERNAME}:${PASSWORD}" \
    -W \
    --browser \
    /bin/bash
