#!/bin/bash
set -e

echo "Iniciando wetty en puerto $PORT"

exec wetty \
    --port ${PORT} \
    --base / \
    --ssh-host localhost \
    --allow-iframe
