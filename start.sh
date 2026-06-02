#!/bin/bash
set -e

USERNAME="${USERNAME:-admin}"
PASSWORD="${PASSWORD:-changeme123}"

echo "PORT recibido de Railway: $PORT"

exec /usr/local/bin/ttyd -p ${PORT} -c "${USERNAME}:${PASSWORD}" -W /bin/bash
