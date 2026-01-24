#!/bin/bash

usage=$(df / | tail -1 | awk '{print $5}' | tr -d '%')

if [ "$usage" -gt 80 ]; then
echo "WARNING: Disk is above 80 % : $usage%"
else
echo "Disk Usage is Normal : $usage%"
fi
