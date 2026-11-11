#!/bin/bash

LOG_DIR="logs"

mkdir -p "$LOG_DIR"

LOG_FILE="$LOG_DIR/monitor.log"

log_message() {
	echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

log_message "Monitoring Started"

REPORT_DIR="reports"

mkdir -p "$REPORT_DIR"

CURRENT_DATE=$(date +%Y%m%d_%H%M%S)

REPORT_FILE="$REPORT_DIR/health_report_$CURRENT_DATE.txt"

exec > "$REPORT_FILE"

echo ========== "System Health Report" ==========

echo "----- Hostname -----"
hostname

echo "----- Current-date -----"
date

echo "----- System-uptime -----"
uptime

echo "----- CPU-information -----"
lscpu

echo "-----Available-processors -----"
nproc

echo "----- Disk-usage -----"
df -h

echo "----- Memory-usage -----"
free -h

disk_usage=$(df -P / | awk 'NR==2 {gsub("%","",$5); print $5}')

if [[ "$disk_usage" -ge 80 ]]
then 
	echo "WARNING: Disk usage is high"
else
	echo "HEALTHY: Disk usage is normal"
fi 

memory_usage=$(free | awk '/^Mem:/ {print int($3 * 100 / $2)}')

if [[ "$memory_usage" -ge 80 ]]
then 
	echo "WARNING: Memory usage is high"
else
	echo "HEALTHY: Memory usage is normal"
fi	

log_message "Health report generated: $REPORT_FILE"
log_message "Monitoring completed"
