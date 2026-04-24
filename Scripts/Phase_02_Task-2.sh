#!/bin/bash

echo "Phase 2"
echo "Running Phase 02"

echo "Creating Log_Analytics_System Directory"
hdfs dfs -mkdir -p /Log_Analytics_System/logs

echo "Copying Log_Analytics_System Directory"
hdfs dfs -put /home/ares/projects/BridgeLabz/Log_Analytics_System/Data/ /Log_Analytics_System/logs/

echo "Listing Log_Analytics_System Directory"
hdfs dfs -ls /Log_Analytics_System

echo "Reading Log_Analytics_System Directory"
hdfs dfs -cat /Log_Analytics_System/logs/*

echo "Checking Number of Blocks created"
hadoop fsck /Log_Analytics_System -files -blocks -locations

echo "Phase 02 Completed"
