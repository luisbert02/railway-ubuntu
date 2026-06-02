#!/bin/bash
set -e

USERNAME="${USERNAME:-admin}"
PASSWORD="${PASSWORD:-changeme123}"
PORT="${PORT:-8080}"

echo "Iniciando ttyd en puerto $PORT"

exec ttyd -p "$PORT" -c "$USERNAME:$PASSWORD" -W bash --login
