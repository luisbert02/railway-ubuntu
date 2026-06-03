#!/bin/bash
set -e

USERNAME="${USERNAME:-admin}"
PASSWORD="${PASSWORD:-changeme123}"
PORT="${PORT:-8080}"

# Configurar nginx en el puerto de Railway
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

# Quitar configuracion default de nginx que ocupa otros puertos
rm -f /etc/nginx/sites-enabled/default.bak
nginx -t

# Iniciar ttyd en puerto interno fijo 7681
/usr/local/bin/ttyd -p 7681 -c "${USERNAME}:${PASSWORD}" -W /bin/bash &

sleep 1

# Nginx toma el puerto de Railway
exec nginx -g "daemon off;"
