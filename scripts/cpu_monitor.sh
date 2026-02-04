#!/bin/bash
# ----------------------------
# CPU Threshold Configuration
# ----------------------------
CPU_THRESHOLD=80

# ----------------------------
# Detect top CPU usage
# ----------------------------
top_cpu=$(ps -eo %cpu --sort=-%cpu | head -n 2 | tail -n 1 | cut -d. -f1)

echo "CPU Usage Check"
echo "---------------"

# ----------------------------
# Threshold-based detection
# ----------------------------
if [ "$top_cpu" -gt "$CPU_THRESHOLD" ]; then
    echo "WARNING: High CPU usage detected (${top_cpu}%)"
else
    echo "CPU usage is within safe limits (${top_cpu}%)"
fi

echo
echo "Top CPU-consuming processes:"
ps -eo pid,comm,%cpu --sort=-%cpu | head
