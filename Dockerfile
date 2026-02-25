FROM ubuntu:22.04

RUN apt update && apt install -y \
    cron \
    procps \
    python3 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY scripts/ ./scripts/
COPY logs/ ./logs/
COPY frontend/ ./frontend/
COPY mycron /etc/cron.d/mycron

RUN chmod +x scripts/*.sh
RUN crontab /etc/cron.d/mycron

EXPOSE 80

CMD service cron start && \
    python3 -m http.server 80 --directory /app
