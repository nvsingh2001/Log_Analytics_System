#!/bin/bash

echo "Phase 03"
cd /home/ares/projects/BridgeLabz/Log_Analytics_System

echo "Running Phase 03"

echo "Running WordCount on Large Log File"
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-*.jar wordcount /Log_Analytics_System/large_logs/large_log.log /Log_Analytics_System/output_wc

echo "Verifying Output"
hdfs dfs -ls /Log_Analytics_System/output_wc
hdfs dfs -cat /Log_Analytics_System/output_wc/part-r-00000 | head

echo "Phase 03 Completed"
