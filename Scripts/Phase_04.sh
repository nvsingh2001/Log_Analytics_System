#!/usr/bin/bash

echo "Phase 04"
cd /home/ares/projects/BridgeLabz/Log_Analytics_System

echo "Running Phase 04"

echo "Making Custom Mapper and Reducer Executable"
chmod +x ./custom_wordcount/mapper.py ./custom_wordcount/reducer.py

echo "Removing old output (if exists)"
hdfs dfs -rm -r -f /Log_Analytics_System/output_py_wc

echo "Running Hadoop Streaming Job"

hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-3.5.0.jar \
  -files custom_wordcount/mapper.py,custom_wordcount/reducer.py \
  -input /Log_Analytics_System/large_logs/large_log.log -output /Log_Analytics_System/output_py_wc \
  -mapper mapper.py \
  -combiner reducer.py \
  -reducer reducer.py

echo "Verifying Output"
hdfs dfs -cat /Log_Analytics_System/output_py_wc/part-00000 | head

echo "Phase 04 Completed"
