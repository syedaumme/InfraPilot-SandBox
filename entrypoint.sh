#!/bin/bash

# 1. Start the cron service in the background
service cron start

# 2. Start the Flask API (the main process)
python3 api.py
