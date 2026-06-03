#!/bin/bash
set -e

USERNAME="${USERNAME:-admin}"
PASSWORD="${PASSWORD:-changeme123}"
PORT="${PORT:-8080}"

# Configurar nginx como proxy WebSocket
cat > /etc/nginx/sites-enabled/default << EOF
server {
    listen ${PORT};
    location / {
        proxy_pass http://127.0.0.1:7681;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host \$host;
        proxy_read_timeout 86400;
    }
}
EOF

# Iniciar ttyd en puerto interno 7681
/usr/local/bin/ttyd -p 7681 -c "${USERNAME}:${PASSWORD}" -W /bin/bash &

# Iniciar nginx en el puerto de Railway
exec nginx -g "daemon off;"
