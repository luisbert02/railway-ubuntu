FROM ubuntu:24.04

# Evitar prompts interactivos durante instalación
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Lima

# Actualizar e instalar herramientas esenciales
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    vim \
    nano \
    htop \
    net-tools \
    iputils-ping \
    unzip \
    zip \
    tar \
    python3 \
    python3-pip \
    nodejs \
    npm \
    build-essential \
    ca-certificates \
    tzdata \
    tini \
    && rm -rf /var/lib/apt/lists/*

# Instalar ttyd (terminal web)
RUN curl -L https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64 -o /usr/local/bin/ttyd \
    && chmod +x /usr/local/bin/ttyd

# Crear directorio de trabajo persistente
RUN mkdir -p /data /root/workspace

# Copiar script de inicio
COPY start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /root/workspace

# Railway asigna $PORT automáticamente
EXPOSE $PORT

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/start.sh"]
