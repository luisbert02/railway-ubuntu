#!/bin/bash
set -e

# Valores por defecto si no se configuran variables
USERNAME="${USERNAME:-admin}"
PASSWORD="${PASSWORD:-changeme123}"
PORT="${PORT:-8080}"

echo "================================================"
echo "  Ubuntu 24.04 LTS - Railway Terminal"
echo "================================================"
echo "  Usuario : $USERNAME"
echo "  Puerto  : $PORT"
echo "  Data    : /data (persistente)"
echo "================================================"

# Crear archivo de bienvenida
cat > /etc/motd << EOF

╔══════════════════════════════════════╗
║   Ubuntu 24.04 LTS en Railway  🚀   ║
╚══════════════════════════════════════╝

  Workspace : /root/workspace
  Datos     : /data  (persiste entre deploys)

  Comandos útiles:
    apt install <paquete>   instalar software
    cd /data                ir a carpeta persistente

EOF

# Iniciar ttyd con autenticación básica
exec ttyd \
    --port "$PORT" \
    --credential "$USERNAME:$PASSWORD" \
    --writable \
    bash --login
