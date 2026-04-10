# 🛸 InfraPilot - A System Observatory
**A Lightweight, First-Principles Infrastructure and Observability Stack**

[![Docker Hub](https://img.shields.io/badge/DockerHub-Image-blue?logo=docker)](https://hub.docker.com/r/kulsum16/infrapilot)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> "Understanding the 'why' before the 'how'." InfraPilot is a custom-built monitoring suite designed to bridge the gap between production operations and systems engineering by deconstructing how metrics are collected, processed, and visualized.

---
## 🏗 System Architecture

This diagram illustrates the end-to-end data flow—from raw kernel metrics to a containerized web dashboard.

```mermaid
graph TD
    subgraph " "
        direction TB
        %% Nodes
        A["<div style='font-weight:bold'>⚡ Bash Metrics Collection</div>"] 
        B["<div style='font-weight:bold'>📊 System Metrics (/proc)</div>"]
        C["<div style='font-weight:bold'>🕒 Cron Schedule (5m)</div>"]
        
        D[("🗄️ infrapilot.log<br/>(Historical Data)")]
        E[("📄 summary_txt Files<br/>(Real-time)")]

        %% Connections with "Flow" labels
        A ===>|stream| B
        C -. Orchestrator Logic .-> B
        B --> D
        B --> E
    end

    subgraph "API Layer (The Bridge)"
        F{"🐍 Python Flask API"}
        G1["GET /"]
        G2["GET /api/metrics"]
        
        D ==>|Read| F
        E ==>|Read| F
        F --- G1
        F --- G2
    end

    subgraph "Frontend (Observability)"
        H["🖥️ JS Monitoring Dashboard<br/><i>Polling every 10s...</i>"]
        I1(("🟢"))
        I2(("🟢"))
        
        G2 ==>|JSON| H
        H --> I1
        H --> I2
        
        style I1 fill:#00ff00,stroke:#fff,stroke-width:4px
        style I2 fill:#00ff00,stroke:#fff,stroke-width:4px
    end

    %% High-End Styling
    style A fill:#f1c40f,stroke:#f39c12,stroke-width:2px,color:#000
    style B fill:#3498db,stroke:#2980b9,stroke-width:2px,color:#fff
    style C fill:#95a5a6,stroke:#7f8c8d,stroke-width:2px,color:#fff
    style F fill:#8e44ad,stroke:#2c3e50,stroke-width:3px,color:#fff
    style H fill:#2c3e50,stroke:#00ff00,stroke-width:2px,color:#fff
    
    %% Glow effects (simulated with line thickness)
    linkStyle 0,4,5,8 stroke:#f1c40f,stroke-width:4px;
    linkStyle 1,2,3 stroke:#3498db,stroke-width:2px;
```

# 🚀 The Mission
In an era of "black-box" monitoring tools, InfraPilot was built to deconstruct the observability pipeline. This project simulates the core mechanics of industry standards like Prometheus and Datadog by building them from the ground up.

## Why this matters for SRE:
• *System Visibility:* Transforming raw /proc and df data into structured JSON.

• *Automation Patterns:* Utilizing cron for reliable, decoupled data collection.

• *Container Lifecycle:* Fully containerized with Podman/Docker for reproducible deployments.

• *Edge Case Handling:* Built-in "Live Fallback" logic for when logs are stale or missing.

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


