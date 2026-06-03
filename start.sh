#!/bin/bash
set -e

USERNAME="${USERNAME:-admin}"
PASSWORD="${PASSWORD:-changeme123}"
PORT="${PORT:-8080}"

echo "PORT asignado por Railway: $PORT"

cat > /etc/nginx/sites-enabled/default << EOF
server {
    listen ${PORT};

    location / {
        proxy_pass http://127.0.0.1:7681;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_read_timeout 86400;
        proxy_send_timeout 86400;
    }
}
EOF

nginx -t

/usr/local/bin/ttyd \
    -p 7681 \
    -c "${USERNAME}:${PASSWORD}" \
    -W \
    --max-clients 10 \
    /bin/bash &

sleep 2

exec nginx -g "daemon off;"
