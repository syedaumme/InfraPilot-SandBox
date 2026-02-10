#!/bin/bash

LOG_FILE="../logs/infrapilot.log"

top_cpu=$(ps -eo %cpu --sort=-%cpu | head -n 2 | tail -n 1 | cut -d. -f1)

echo -e "\n ---------------------------- C P U   U S A G E   C H E C K -----------------------------------\n">>"$LOG_FILE"

echo -e "\n [$(date '+%Y-%m-%d %H:%M:%S')]\n" >>"$LOG_FILE"
if [ "$top_cpu" -gt 80 ]; then
    echo "WARNING: High CPU usage detected (${top_cpu}%)" >>"$LOG_FILE"
else
    echo "CPU usage is within safe limits (${top_cpu}%)" >>"$LOG_FILE"
fi

echo -e "\n-----------------------------------------------------------------------------------------------\n">>"$LOG_FILE"
echo -e "\nTop CPU-consuming processes:\n [$(date '+%Y-%m-%d %H:%M:%S')] \n ">>"$LOG_FILE"
ps -eo pid,comm,%cpu --sort=-%cpu | head>>"$LOG_FILE"
