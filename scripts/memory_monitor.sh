#!/bin/bash
# memory_monitor.sh
# Collects RAM usage and writes to the central log and a summary file
# Same pattern as cpu_monitor.sh and disk_monitor.sh

LOG_FILE="/app/logs/infrapilot.log"
THRESHOLD=80

# free -m gives memory in megabytes
# We extract: total, used, available from the "Mem:" line
total=$(free -m | awk '/^Mem:/ {print $2}')
used=$(free -m | awk '/^Mem:/ {print $3}')
pct=$(awk "BEGIN {printf \"%.1f\", ($used/$total)*100}")

echo -e "\n---------------------------- M E M O R Y   U S A G E ---------------------------------\n" >> "$LOG_FILE"
echo -e "[$(date '+%Y-%m-%d %H:%M:%S')]\n" >> "$LOG_FILE"

if [ $(echo "$pct > $THRESHOLD" | bc) -eq 1 ]; then
    echo "WARNING: High memory usage detected (${pct}%)" >> "$LOG_FILE"
    EXIT_CODE=1
else
    echo "Memory usage is within safe limits (${pct}%)" >> "$LOG_FILE"
    EXIT_CODE=0
fi

echo -e "\n-------------------------------------------------------------------------------\n" >> "$LOG_FILE"

# Summary file — this is what api.py reads for real-time data
SUMMARY_FILE="/app/logs/memory_summary.txt"
echo "---------------- MEMORY USAGE SUMMARY ----------------" > "$SUMMARY_FILE"
echo "Last Checked : $(date '+%Y-%m-%d %H:%M:%S')" >> "$SUMMARY_FILE"
echo "Memory Usage : ${pct}%" >> "$SUMMARY_FILE"
echo "Used : ${used} MB" >> "$SUMMARY_FILE"
echo "Total : ${total} MB" >> "$SUMMARY_FILE"

exit $EXIT_CODE
