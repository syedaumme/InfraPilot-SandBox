# 📌 InfraPilot-SandBox

InfraPilot-SandBox is a **fundamentals-first DevOps learning project** designed to demonstrate how a frontend interface can interact with a Linux system to **inspect system health**, **execute shell scripts**, and **present system-level outputs**.

The project mirrors the *core idea* behind internal DevOps and SRE dashboards:  
**making operating system state visible, understandable, and explainable**.

This is intentionally built as a **system-health sandbox**, prioritizing **clarity, reasoning, and reliability** over scale or advanced tooling.

---

## 🎯 Project Intent & Learning Goals

This project was built to achieve three personal and professional goals:

### 1. Strengthen Linux & OS Fundamentals
- Understand how Linux exposes CPU, disk, and process information
- Gain confidence reading and interpreting system state
- Learn how failures and bottlenecks manifest at the OS level

### 2. Build Real DevOps Thinking (Not Just Tools)
- Learn how DevOps tools *surface* system information
- Practice automation with intent (cron, scripts)
- Understand **why** and **when** to automate

### 3. Interview-Ready System Explanation
- Be able to explain *what the system does* and *why it is designed this way*
- Practice tradeoffs, scope control, and design reasoning
- Build a project that can be confidently discussed end-to-end in interviews

---

## 🧩 High-Level System Architecture

<img width="215" height="793" alt="InfraPilot System Architecture" src="https://github.com/user-attachments/assets/2ca87d81-d0fb-4bbc-b9d6-67e0e8a731f9" />

---

## 🧠 What This Project Does

InfraPilot-SandBox incrementally builds a complete DevOps workflow:

- Executes Linux inspection commands via Bash scripts
- Collects and logs system health information in a structured, readable format
- Uses `cron` for unattended, scheduled execution
- Packages the backend using Docker for portability
- Deploys the system using Kubernetes (single-pod design)
- Automates delivery using Jenkins + GitHub Webhooks
- Displays system health and logs in a simple frontend UI

Each layer is added **only after the underlying fundamentals are understood**.

---

## 📘 Day-Wise Learning Structure (Very Important)

This repository is organized as a **day-by-day learning journey**.

- Each day focuses on a specific Linux / DevOps concept
- Commands explored are logged
- Notes explain *what was learned and why*
- Scripts evolve gradually, not all at once

This makes the repository useful for:
- My own revision and interview preparation
- Anyone who wants to **learn Linux and DevOps incrementally**
- Learners who prefer *building systems over memorizing commands*

---

## 🚧 Scope & Limitations (Intentional Design Choices)

- ❌ Not a production monitoring system  
- ❌ No Prometheus / Grafana  
- ❌ No alerting or large-scale automation  
- ❌ Minimal security hardening  

**Why these limitations exist:**

The purpose of this project is **learning and reasoning**, not production readiness.
Advanced tooling is intentionally avoided to keep the focus on:
- OS behavior
- Script logic
- Automation intent
- System explainability

This restraint is a **design decision**, not a gap.

---

## 🛠️ Tech Stack

- **Operating System:** Linux  
- **Scripting:** Bash  
- **Version Control:** Git & GitHub  
- **Scheduling & Automation:** Cron  
- **Containerization:** Docker  
- **Orchestration:** Kubernetes (basic, single pod)  
- **CI/CD:** Jenkins + GitHub Webhooks  
- **Frontend:** HTML / CSS  

---

## 👤 Author

**Syeda Umme Kulsum**  
DevOps / SRE Engineer  

Hands-on learner with a strong focus on **Linux fundamentals, system visibility, and reliability-oriented thinking**.

---

## 📈 Project Status

- 🟢 Actively evolving  
- 🟢 Fundamentals-first   
- 🟢 Public learning repository  

---

## 📌 Final Note

InfraPilot-SandBox is designed to evolve **one concept at a time**.

Every addition prioritizes:
- understanding over speed
- clarity over complexity
- explainability over feature count

This project reflects how I approach learning and system design:  
**build slowly, understand deeply, and own every layer**.
