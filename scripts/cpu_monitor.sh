#!/bin/bash

echo "CPU Process Snapshot : "
echo "-----------------------"

ps -eo pid,comm,%cpu --sort=-%cpu | head

