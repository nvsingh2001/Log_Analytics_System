#!/bin/bash

echo "Phase_02 Part-2"
cd /home/ares/projects/BridgeLabz/Log_Analytics_System/

echo "Running Phase 02 Part-2"

echo "Generating Large Log File"

yes "127.0.0.1 - - [24/Apr/2026:14:00:00 +0530] \"GET /index.html HTTP/1.1\" 200 1024" | head -n 15000000 >./Data/large_log.log

echo "Done"

echo "Verifying Generated Log File"

ls -lh ./Data/large_log.log

echo "Uploading Log File to HDFS"
hdfs dfs -mkdir -p /Log_Analytics_System/large_logs
hdfs dfs -put ./Data/large_log.log /Log_Analytics_System/large_logs/

echo "Verifying Block Splitting"
hdfs fsck /Log_Analytics_System/large_logs/large_log.log -files -blocks -locations

echo "Completed Phase_02 Part-2"
