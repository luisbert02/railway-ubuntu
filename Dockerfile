FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl wget git vim nano htop \
    net-tools python3 python3-pip \
    nodejs npm build-essential \
    ca-certificates tini \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64 \
    -o /usr/local/bin/ttyd && chmod +x /usr/local/bin/ttyd

RUN mkdir -p /data /root/workspace
WORKDIR /root/workspace

COPY start.sh /start.sh
RUN chmod +x /start.sh
ENV PORT=8080
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/start.sh"]
