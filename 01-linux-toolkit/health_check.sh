#!/bin/bash

LOG_FILE="/var/log/sys_health.log"

echo "===== $(date) =====" | sudo tee -a $LOG_FILE

echo "CPU Usage:" | sudo tee -a $LOG_FILE
top -bn1 | grep "Cpu(s)" | sudo tee -a $LOG_FILE

echo "Memory Usage:" | sudo tee -a $LOG_FILE
free -h | sudo tee -a $LOG_FILE

echo "Disk Usage:" | sudo tee -a $LOG_FILE
df -h / | sudo tee -a $LOG_FILE

echo "" | sudo tee -a $LOG_FILE
