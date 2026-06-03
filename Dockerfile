FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl wget git vim nano htop \
    net-tools python3 python3-pip \
    build-essential ca-certificates tini \
    && rm -rf /var/lib/apt/lists/*

# Instalar Node.js 20
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g wetty

RUN mkdir -p /data /root/workspace
WORKDIR /root/workspace

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENV PORT=8080

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/start.sh"]
