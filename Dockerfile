FROM ubuntu:22.04

# Install required packages
RUN apt update && apt install -y cron procps

# Set working directory
WORKDIR /app

# Copy scripts
COPY scripts/ ./scripts/

# Create logs folder
RUN mkdir logs

# Make scripts executable
RUN chmod +x scripts/*.sh

# Copy custom crontab file
COPY mycron /etc/cron.d/infrapilot

# Give cron file correct permissions
RUN chmod 0644 /etc/cron.d/infrapilot

# Start cron in foreground
CMD ["cron", "-f"]

