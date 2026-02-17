#!/bin/bash

#Variable for logfile - shows history or memory of data

LOG_FILE="/app/logs/infrapilot.log"

# -e command option is used to include special charaters with \n newline inside echo"
echo -e "\n-------------------------------- S Y S T E M   I N F O ----------------------------------------\n" >> "$LOG_FILE"

echo -e "[$(date '+%Y-%m-%d %H:%M:%S')]\n" >> "$LOG_FILE"
echo -e "Hostname : $(hostname) " >> "$LOG_FILE"
echo -e "\nUptime :\n" >> "$LOG_FILE"
uptime >> "$LOG_FILE"
echo -e "\nDisk Usage : \n" >> "$LOG_FILE"
df -h / >> "$LOG_FILE"
# Exit Code
EXIT_CODE=0
echo -e "\n-----------------------------------------------------------------------------------------------\n" >> "$LOG_FILE"
exit $EXIT_CODE
