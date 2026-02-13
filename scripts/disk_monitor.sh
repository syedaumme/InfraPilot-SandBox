#!/bin/bash

LOG_FILE="../logs/infrapilot.log"


THRESHOLD=80

usage=$(df / | tail -1 | awk '{print $5}' | tr -d '%')

echo -e " \n-------------------------------- D I S K   U S A G E ------------------------------------------\n" >> "$LOG_FILE"

if [ "$usage" -gt "$THRESHOLD" ]; then
echo "[$(date '+%Y-%m-%d %H:%M:%S')] WARNING: Disk is above 80 % : $usage%" >> "$LOG_FILE"
EXIT_CODE=1
else
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Disk Usage is Normal : $usage%" >> "$LOG_FILE"
fi
EXIT_CODE=0
echo -e "\n-----------------------------------------------------------------------------------------------\n" >> "$LOG_FILE"

# REAL TIME SNAPSHOT

SUMMARY_FILE="../logs/disk_summary.txt"
echo "---------------- DISK USAGE SUMMARY ----------------" > "$SUMMARY_FILE"
echo "Last Checked : $(date '+%Y-%m-%d %H:%M:%S')" >> "$SUMMARY_FILE"
echo "Disk Usage : ${usage}%" >> "$SUMMARY_FILE"
echo >> "$SUMMARY_FILE"


exit $EXIT_CODE
