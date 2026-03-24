#!/bin/bash
LOG_FILE="/app/logs/infrapilot.log"
THRESHOLD=80

total=$(free -m | awk '/^Mem:/ {print $2}')
used=$(free -m | awk '/^Mem:/ {print $3}')
pct=$(awk "BEGIN {printf \"%.1f\", ($used/$total)*100}")

echo -e "\n------------ M E M O R Y   U S A G E ------------\n" >> "$LOG_FILE"
echo -e "[$(date '+%Y-%m-%d %H:%M:%S')]\n" >> "$LOG_FILE"

if [ $(echo "$pct > $THRESHOLD" | bc) -eq 1 ]; then
    echo "WARNING: High memory usage (${pct}%)" >> "$LOG_FILE"
    EXIT_CODE=1
else
    echo "Memory usage is within safe limits (${pct}%)" >> "$LOG_FILE"
    EXIT_CODE=0
fi

echo -e "\n--------------------------------------------------\n" >> "$LOG_FILE"

SUMMARY_FILE="/app/logs/memory_summary.txt"
echo "---------------- MEMORY USAGE SUMMARY ----------------" > "$SUMMARY_FILE"
echo "Last Checked : $(date '+%Y-%m-%d %H:%M:%S')" >> "$SUMMARY_FILE"
echo "Memory Usage : ${pct}%" >> "$SUMMARY_FILE"
echo "Used : ${used} MB" >> "$SUMMARY_FILE"
echo "Total : ${total} MB" >> "$SUMMARY_FILE"

exit $EXIT_CODE
