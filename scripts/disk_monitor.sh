#!/bin/bash

LOG_FILE="../logs/infrapilot.log"

usage=$(df / | tail -1 | awk '{print $5}' | tr -d '%')

echo -e " \n-------------------------------- D I S K   U S A G E ------------------------------------------\n" >> "$LOG_FILE"

if [ "$usage" -gt 80 ]; then
echo "[$(date '+%Y-%m-%d %H:%M:%S')] WARNING: Disk is above 80 % : $usage%" >> "$LOG_FILE"
else
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Disk Usage is Normal : $usage%" >> "$LOG_FILE"
fi

echo -e "\n-----------------------------------------------------------------------------------------------\n" >> "$LOG_FILE"
