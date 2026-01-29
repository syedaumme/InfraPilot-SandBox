📌 InfraPilot-SandBox

InfraPilot-SandBox is a beginner-friendly DevOps learning project that demonstrates how a frontend interface can interact with a Linux system to inspect system health, execute shell scripts, and display outputs — similar in spirit to internal DevOps dashboards used by platform and SRE teams.

This project is designed as a system-health sandbox, focusing on visibility, reasoning, and reliability, not large-scale automation.

🎯 Project Goals

Understand how Linux exposes system state (CPU, disk, processes)

Learn how DevOps tools surface OS-level information

Build confidence with Bash scripting and automation

Practice containerization, orchestration, and CI/CD without overengineering

Develop the ability to explain system design decisions clearly (interview-ready)

🧩 High-Level Architecture
User
 ↓
Frontend UI (HTML / CSS)
 ↓
Backend Script Layer (Bash)
 ↓
Linux Operating System
 ↓
Logs / Output Files
 ↑
Cron / Docker / Kubernetes

🧠 What This Project Does

Runs Linux inspection commands via Bash scripts

Logs system health outputs in a structured way

Uses cron for scheduled execution

Packages the backend using Docker

Deploys the system using Kubernetes (single pod)

Uses Jenkins + GitHub Webhooks for CI/CD

Displays system health and logs in a simple frontend UI

🚧 Scope & Limitations (Intentional)

❌ Not a production monitoring system

❌ No Prometheus / Grafana

❌ No large-scale automation or alerting

❌ Minimal security hardening

Why?
The focus is learning, clarity, and system reasoning, not scale.

🛠️ Tech Stack

OS: Linux

Scripting: Bash

Version Control: Git & GitHub

Automation: Cron

Containerization: Docker

Orchestration: Kubernetes (basic)

CI/CD: Jenkins + GitHub Webhooks

Frontend: HTML / CSS

📂 Repository Structure
InfraPilot-SandBox/
├── scripts/
│   ├── system_info.sh
│   ├── disk_monitor.sh
│   ├── cpu_monitor.sh
│   └── process_watchdog.sh
│
├── docs/
│   ├── day1-notes.md … day30-notes.md
│
├── logs/
│   ├── day1.log … infrapilot.log
│
├── cheatsheets/
│   ├── infrapilot-backend-cheatsheet.md
│   └── linux-git-cheatsheet.md
│
├── frontend/
│   └── index.html
│
└── README.md

👤 Author

Syeda Umme Kulsum
DevOps / SRE Engineer
(Hands-on learner focused on Linux fundamentals and system reliability)

📈 Project Status

🟢 Actively evolving
🟢 Fundamentals-first
🟢 Interview-aligned
🟢 Public learning repository
