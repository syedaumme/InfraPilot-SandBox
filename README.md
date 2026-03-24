nfraPilot — System Observatory

A fundamentals-first infrastructure monitoring stack built from scratch to understand how observability systems actually work underneath enterprise tooling.


What is InfraPilot?
InfraPilot is a lightweight, containerized monitoring system that collects Linux system health metrics using bash scripts, exposes them over a real HTTP API, and displays them on a live dashboard — all without relying on Prometheus, Grafana, or any enterprise observability platform.
It was built deliberately from first principles: every layer is intentional, every component exists because it solves a real problem, and every architectural decision mirrors what production SRE and DevOps teams actually do at scale.
The core question InfraPilot answers:

Before you configure Prometheus, do you understand what an exporter is doing? Before you set up Grafana, do you know how dashboards actually get their data?

InfraPilot builds that understanding from the ground up.

Who is it for?
AudienceHow InfraPilot helpsJunior DevOps / SRE engineersUnderstand the mechanics behind monitoring stacks without black-box toolingStudents learning Linux & containersA real project that connects bash, cron, Docker, and HTTP in one working systemDevelopers running personal serversLightweight health monitoring with zero cloud cost and zero vendor dependencyHome lab operatorsDeploy on any Linux VM in minutes — no Kubernetes, no cloud account requiredHiring managers evaluating candidatesA project that demonstrates systems thinking, not just tool configuration

The Problem It Solves
Every company running servers needs to answer three questions continuously:

Is my system healthy right now?
What are my resource trends over time?
Will something break before it does?

Enterprise tools like Datadog, New Relic, and Grafana Cloud answer these questions — but they abstract away the mechanics. InfraPilot answers the same questions while keeping every layer visible and understandable.

System Architecture
┌─────────────────────────────────────────────────────────────────┐
│                    Docker / Podman Container                     │
│                                                                 │
│  ┌─────────────────┐    writes to    ┌──────────────────────┐  │
│  │   Bash Scripts  │ ─────────────▶  │     Log Files        │  │
│  │                 │                 │                      │  │
│  │ cpu_monitor.sh  │                 │  logs/cpu.log        │  │
│  │ disk_monitor.sh │                 │  logs/disk.log       │  │
│  │ system_info.sh  │                 │  logs/memory.log     │  │
│  └────────┬────────┘                 │  logs/infrapilot.log │  │
│           │                          └──────────┬───────────┘  │
│           │ scheduled by                        │ read by      │
│           ▼                                     ▼              │
│  ┌─────────────────┐              ┌─────────────────────────┐  │
│  │   Cron Daemon   │              │     Flask API (api.py)  │  │
│  │                 │              │                         │  │
│  │  */5 * * * *    │              │  GET /api/metrics       │  │
│  │  runs scripts   │              │  GET /api/logs/<name>   │  │
│  └─────────────────┘              │  GET /health            │  │
│                                   └──────────┬──────────────┘  │
│                                              │ HTTP JSON        │
└──────────────────────────────────────────────┼─────────────────┘
                                               │
                         ┌─────────────────────▼──────────────┐
                         │         Browser / Postman           │
                         │                                     │
                         │  Dashboard polls /api/metrics       │
                         │  every 10 seconds                   │
                         │                                     │
                         │  ┌─────┐  ┌──────┐  ┌──────────┐  │
                         │  │ CPU │  │  MEM │  │   DISK   │  │
                         │  │ 23% │  │  61% │  │  / 44%   │  │
                         │  └─────┘  └──────┘  └──────────┘  │
                         └────────────────────────────────────┘
How the data flows — step by step

Cron fires every 5 minutes inside the container
Bash scripts run and collect CPU usage, disk usage, memory, and system info
Scripts append output to log files in /app/logs/
Flask API reads those log files when a request arrives
Flask parses and returns JSON over HTTP
The browser dashboard fetches /api/metrics every 10 seconds
JavaScript updates the gauges and charts with the new data

This is the same pattern as a Prometheus exporter — a small process that collects metrics and exposes them over HTTP for scraping. InfraPilot builds this pattern from scratch so you understand it before you configure Prometheus.

Tech Stack
LayerTechnologyWhy this choiceBase OSUbuntu 22.04 (inside container)Stable LTS, well-documented, production standardMetric collectionBash scriptsDirect OS access, no dependencies, mirrors what real exporters doSchedulingCronUnix standard for time-based automationAPI layerPython 3 + FlaskMinimal, readable, teaches HTTP fundamentals clearlyContainerisationDocker / PodmanReproducible environments, mirrors production deploymentFrontendVanilla HTML / CSS / JSNo framework overhead — makes the HTTP fetch pattern explicitRegistryDockerHubPublic image distribution, standard for open source projectsVersion controlGit + GitHubSource of truth, CI/CD integration point
Coming next:

Kubernetes — container orchestration and self-healing
Jenkins + GitHub Webhooks — automated build and deploy pipeline
Prometheus + Grafana — replace custom API with industry-standard metrics format


Project Structure
InfraPilot-SandBox/
│
├── api.py                  # Flask API — reads logs, serves JSON over HTTP
├── index.html              # Dashboard frontend — polls API, renders metrics
├── Dockerfile              # Container definition — builds the full stack
├── mycron                  # Cron schedule — when each script runs
│
├── scripts/
│   ├── cpu_monitor.sh      # Collects CPU usage percentage
│   ├── disk_monitor.sh     # Collects disk usage per mount point
│   ├── system_info.sh      # Collects hostname, uptime, OS info
│   └── memory_monitor.sh   # Collects RAM usage (used/total/percentage)
│
├── logs/                   # Generated at runtime — not committed to git
│   ├── cpu.log
│   ├── disk.log
│   ├── memory.log
│   └── infrapilot.log
│
└── README.md

Quick Start — Run InfraPilot on your machine
Prerequisites

Docker or Podman installed
Any Linux system or Linux VM (Mac/Windows users: use WSL2 or a VM)
Port 5000 free

Option A — Pull from DockerHub (fastest)
bash# Pull the latest image
docker pull kulsum16/infrapilot:latest

# Run it
docker run -d \
  --name infrapilot \
  -p 5000:5000 \
  kulsum16/infrapilot:latest

# Verify it started
docker logs infrapilot
Option B — Build from source
bash# Clone the repo
git clone https://github.com/syedaumme/InfraPilot-SandBox.git
cd InfraPilot-SandBox

# Build the image
docker build -t infrapilot:local .

# Run it
docker run -d \
  --name infrapilot \
  -p 5000:5000 \
  infrapilot:local
Access the system
EndpointWhat you gethttp://localhost:5000Live dashboard UIhttp://localhost:5000/api/metricsRaw JSON — CPU, memory, diskhttp://localhost:5000/healthHealth check — used by Kubernetes liveness probeshttp://localhost:5000/api/logs/cpu.logRaw log content viewer

Note: Log files populate after cron's first run (~5 minutes). Until then, the API serves live fallback data directly from system calls — the dashboard will still show real metrics.


Debugging inside the container
bash# Get a shell inside the running container
docker exec -it infrapilot bash

# Check cron is running
service cron status

# Manually run a script to test it
/app/scripts/cpu_monitor.sh

# Check if logs are being written
tail -f /app/logs/cpu.log

# Test the API from inside the container
curl http://localhost:5000/api/metrics

Why this architecture matters for SRE
The monitoring stack you reach for first (Datadog, Prometheus, Grafana) is built on exactly this pattern:
InfraPilot componentProduction equivalentcpu_monitor.shPrometheus Node Exporter (collects OS metrics)Flask /api/metricsPrometheus scrape endpoint (exposes metrics over HTTP)mycronPrometheus scrape interval configurationindex.html dashboardGrafana dashboard/health endpointKubernetes liveness probe targetDockerHub imageContainer registry (ECR, GCR, ACR)
When you understand InfraPilot end to end, you understand why Prometheus is designed the way it is.

Roadmap

 Phase 1 — Bash monitoring + cron automation + log generation
 Phase 2 — Flask API + live dashboard + Dockerised deployment
 Phase 3 — Kubernetes deployment with liveness probes and rolling updates
 Phase 4 — Jenkins CI/CD pipeline with GitHub Webhook triggers
 Phase 5 — Prometheus + Grafana replacing the custom API layer
 Phase 6 — Alerting — threshold-based Slack/email notifications


Author
Syeda Umme Kulsum
DevOps / SRE Engineer
Transitioning from production operations (command centre, State Street) into technical Site Reliability Engineering — using projects like InfraPilot to build and demonstrate deep infrastructure ownership.

GitHub: @syedaumme
DockerHub: kulsum16
LinkedIn: syeda-umme-kulsum














# 📌 InfraPilot-SandBox

InfraPilot is a lightweight, containerized infrastructure monitoring stack built to understand observability fundamentals from first principles..

Rather than relying on enterprise tooling, this project focuses on the mechanics behind monitoring systems.

The project mirrors the *core idea* behind internal DevOps and SRE dashboards:  
**making operating system state visible, understandable, and explainable**.

It is a  **system-health sandbox**, prioritizing **clarity, reasoning, and reliability**.

---

## 🧩 High-Level System Architecture

<img width="512" height="1020" alt="image" src="https://github.com/user-attachments/assets/9d40ac11-a6d3-4f8f-ab03-c18a9760f4b9" />


---

## 🧠Purpose

To simulate how monitoring systems:

- Collect system metrics

- Structure logs

- Automate execution

- Isolate runtime environments

- Present system state

This project emphasizes infrastructure thinking over tool usage.
---

## 🧱 Core Components

• Bash-based CPU & disk monitoring
• Structured log generation
• Cron-based automation
• Dockerized runtime
• Minimal frontend visualization.

---

## 📁 Repository Structure
```
scripts/ → Monitoring logic
logs/ → Generated log outputs
frontend/ → Dashboard UI
cheatsheets/ → Linux & backend references
Dockerfile → Container definition
mycron → Scheduled execution config
```
---

## 🛠️ Tech Stack

- **Operating System:** Linux  
- **Scripting:** Bash  
- **Version Control:** Git & GitHub  
- **Scheduling & Automation:** Cron  
- **Containerization:** Docker  
- **Orchestration:** Kubernetes 
- **CI/CD:** Jenkins + GitHub Webhooks  
- **Frontend:** HTML / CSS / JS 

---
## 📈 Project Status

- Phase 1: Local monitoring + containerization ✅
- Phase 2: Dashboard Optimization and Kubernetes deployment (in progress).
- Phase 3: CI/CD integration
- Phase 4: Health checks & alert simulation
  
---

## 🔗 Links

DockerHub: kulsum16

## 👤 Author

**Syeda Umme Kulsum**  
DevOps / SRE Engineer  <3


