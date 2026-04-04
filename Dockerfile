FROM ubuntu:22.04

#Entryfile for running Cron
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
 
# Suppress interactive prompts during apt installs
ENV DEBIAN_FRONTEND=noninteractive
 
# Install system deps
# - cron:    runs your monitoring bash scripts on schedule
# - procps:  provides ps, top, free (used by scripts)
# - python3 + pip: Flask API
RUN apt-get update && apt-get install -y \
    cron \
    procps \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*
 
# Install Flask — the API framework
RUN pip3 install flask 
 
WORKDIR /app
 
# Copy project files into the container image
COPY scripts/ ./scripts/
COPY logs/     ./logs/
COPY api.py    ./api.py
COPY index.html ./frontend/index.html
COPY mycron    /etc/cron.d/mycron
 
# Make all bash scripts executable
RUN chmod +x scripts/*.sh
 
# Install the cron schedule
RUN chmod 0644 /etc/cron.d/mycron 
 
# Expose Flask port
# (v1 exposed 80 for the static server — now Flask runs on 5000)
EXPOSE 5000
 
# ── Startup command ──────────────────────────────────────────────────────────
# We need TWO things running:
#   1. cron daemon (background) — executes your bash scripts on schedule
#   2. Flask API (foreground)   — serves metrics to the browser
#
# Docker containers only have ONE "main" process (PID 1).
# We start cron first (background with &), then Flask takes PID 1.
# If Flask dies, the container stops — which is correct behaviour.
# ─────────────────────────────────────────────────────────────────────────────
CMD service cron start && \
    python3 -m flask --app api.py run --host=0.0.0.0 --port=5000
CMD ["/bin/bash", "/entrypoint.sh"]
