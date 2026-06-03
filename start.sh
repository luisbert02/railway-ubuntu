#!/bin/bash
set -e

USERNAME="${USERNAME:-admin}"
PASSWORD="${PASSWORD:-changeme123}"
PORT="${PORT:-8080}"

echo "============================================"
echo "PORT asignado por Railway: $PORT"
echo "============================================"

# Configurar nginx
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

nginx -t

/usr/local/bin/ttyd -p 7681 -c "${USERNAME}:${PASSWORD}" -W /bin/bash &

sleep 1

exec nginx -g "daemon off;"
