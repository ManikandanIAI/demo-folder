#!/bin/bash

# Define output file
OUTPUT_FILE="copy1.txt"

# Check if the output file is writable
if [ ! -w "$(dirname "$OUTPUT_FILE")" ]; then
  echo "Error: Cannot write to directory $(dirname "$OUTPUT_FILE")"
  exit 1
fi

# Clear the output file (or create it if it doesn't exist)
: > "$OUTPUT_FILE"

# Check CPU consumption
echo "=== CPU Usage ===" >> "$OUTPUT_FILE"
if command -v mpstat > /dev/null; then
  mpstat 1 1 >> "$OUTPUT_FILE"  # Collect CPU stats for 1 second
else
  echo "Error: mpstat not installed. Install sysstat package." >> "$OUTPUT_FILE"
fi
echo "=================" >> "$OUTPUT_FILE"

# Check disk usage
echo -e "\n=== Disk Usage ===" >> "$OUTPUT_FILE"
df -h >> "$OUTPUT_FILE"
echo "=================" >> "$OUTPUT_FILE"

# Check processes with high CPU/memory utilization
echo -e "\n=== Top Processes by CPU Usage ===" >> "$OUTPUT_FILE"
ps -eo pid,ppid,%cpu,%mem,cmd --sort=-%cpu | head -n 10 >> "$OUTPUT_FILE"
echo "=================" >> "$OUTPUT_FILE"

echo "System information written to $OUTPUT_FILE"