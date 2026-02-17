#!/bin/bash

LOG_FILE="/app/logs/infrapilot.log"

THRESHOLD=80

top_cpu=$(ps -eo %cpu --sort=-%cpu | head -n 2 | tail -n 1 | cut -d. -f1)

echo -e "\n ---------------------------- C P U   U S A G E   C H E C K -----------------------------------\n">>"$LOG_FILE"

echo -e "\n [$(date '+%Y-%m-%d %H:%M:%S')]\n" >>"$LOG_FILE"

if [ "$top_cpu" -gt "$THRESHOLD" ]; then
    echo "WARNING: High CPU usage detected (${top_cpu}%)" >>"$LOG_FILE"
EXIT_CODE=1
else
    echo "CPU usage is within safe limits (${top_cpu}%)" >>"$LOG_FILE"
EXIT_CODE=0
fi

echo -e "\n-----------------------------------------------------------------------------------------------\n">>"$LOG_FILE"
echo -e "\nTop CPU-consuming processes:\n [$(date '+%Y-%m-%d %H:%M:%S')] \n ">>"$LOG_FILE"
ps -eo pid,comm,%cpu --sort=-%cpu | head>>"$LOG_FILE"


# Summary file / Real time snapshot

SUMMARY_FILE="/app/logs/cpu_summary.txt"
echo "---------------- CPU USAGE SUMMARY ----------------" > "$SUMMARY_FILE"
echo "Last Checked : $(date '+%Y-%m-%d %H:%M:%S')" >> "$SUMMARY_FILE"
echo "CPU Usage : ${top_cpu}%" >> "$SUMMARY_FILE"
echo >> "$SUMMARY_FILE"

echo "Top CPU-consuming processes:" >> "$SUMMARY_FILE"
ps -eo pid,comm,%cpu --sort=-%cpu | head >> "$SUMMARY_FILE"
exit $EXIT_CODE
