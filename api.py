#!/usr/bin/env python3
"""
InfraPilot API — reads log files written by bash scripts
and serves them as JSON over HTTP so the browser can fetch them.

WHY this exists: browsers are sandboxed and cannot read container
filesystem files directly. This API is the bridge between your
bash scripts and your frontend dashboard.
"""

from flask import Flask, jsonify, Response
import os, re, time, subprocess
from datetime import datetime

app = Flask(__name__)
LOGS_DIR = os.environ.get("LOGS_DIR", "/app/logs")

def read_log(filename):
    path = os.path.join(LOGS_DIR, filename)
    if not os.path.exists(path):
        return None
    with open(path, "r") as f:
        return f.read().strip()

def parse_cpu(raw):
    """Extract a float CPU percentage from whatever the bash script wrote."""
    if not raw:
        return None
    # Try to find a number like 23.5 or 23
    match = re.search(r"(\d+\.?\d*)", raw.split("\n")[-1])
    return float(match.group(1)) if match else None

def parse_disk(raw):
    """Return list of {mount, used_pct, used, total} from df-style output."""
    if not raw:
        return []
    results = []
    for line in raw.strip().split("\n"):
        parts = line.split()
        if len(parts) >= 5:
            try:
                pct = int(parts[4].replace("%", ""))
                results.append({
                    "mount": parts[5] if len(parts) > 5 else parts[4],
                    "used_pct": pct,
                    "used": parts[2],
                    "total": parts[1],
                })
            except (ValueError, IndexError):
                continue
    return results

def parse_memory(raw):
    """Parse free -m output or a number into used/total/pct."""
    if not raw:
        return None
    for line in raw.strip().split("\n"):
        if line.lower().startswith("mem"):
            parts = line.split()
            if len(parts) >= 3:
                try:
                    total = int(parts[1])
                    used = int(parts[2])
                    pct = round((used / total) * 100, 1) if total else 0
                    return {"used_mb": used, "total_mb": total, "used_pct": pct}
                except ValueError:
                    pass
    match = re.search(r"(\d+\.?\d*)", raw)
    return {"used_pct": float(match.group(1))} if match else None

@app.route("/api/metrics")
def metrics():
    cpu_raw = read_log("cpu.log")
    disk_raw = read_log("disk.log")
    mem_raw = read_log("memory.log")

    # Fallback: use live system data if logs are empty (first run)
    cpu_val = parse_cpu(cpu_raw)
    if cpu_val is None:
        try:
            out = subprocess.check_output(
                "top -bn1 | grep 'Cpu(s)' | awk '{print $2}'",
                shell=True, text=True).strip()
            cpu_val = float(out) if out else 0.0
        except Exception:
            cpu_val = 0.0

    disk_data = parse_disk(disk_raw)
    if not disk_data:
        try:
            out = subprocess.check_output("df -m", shell=True, text=True)
            disk_data = parse_disk(out)
        except Exception:
            disk_data = []

    mem_data = parse_memory(mem_raw)
    if mem_data is None:
        try:
            out = subprocess.check_output("free -m", shell=True, text=True)
            mem_data = parse_memory(out)
        except Exception:
            mem_data = None

    return jsonify({
        "timestamp": datetime.utcnow().isoformat() + "Z",
        "cpu": {"used_pct": round(cpu_val, 1)},
        "memory": mem_data,
        "disk": disk_data,
        "log_sources": {
            "cpu": cpu_raw is not None,
            "disk": disk_raw is not None,
            "memory": mem_raw is not None,
        }
    })

@app.route("/api/logs/<name>")
def get_log(name):
    """Serve raw log content — useful for debugging."""
    allowed = ["cpu.log", "disk.log", "memory.log", "monitor.log"]
    if name not in allowed:
        return jsonify({"error": "not found"}), 404
    content = read_log(name)
    return Response(content or "(empty)", mimetype="text/plain")

@app.route("/health")
def health():
    """Health check endpoint — Kubernetes / Docker HEALTHCHECK hits this."""
    return jsonify({"status": "ok", "time": datetime.utcnow().isoformat()})

@app.route("/")
def root():
    return jsonify({"service": "InfraPilot API", "version": "2.0", "docs": "/api/metrics"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=False)
