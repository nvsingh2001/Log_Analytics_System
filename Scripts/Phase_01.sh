#!/bin/bash

echo "Phase 01"
echo "Running Phase 01"

cd /home/ares/projects/BridgeLabz/Log_Analytics_System/Scripts

echo "Verify All Hadoop Daemons"

jps

# echo "Verifying HDFS is Working"
#
# echo "Creating test_dir"
# hdfs dfs -mkdir /test_dir
#
# echo "Creating sample.txt"
# echo "hello hadoop" >sample.txt
#
# echo "Copying sample.txt to test_dir"
# hdfs dfs -put sample.txt /test_dir/
#
# echo "Listing test_dir"
# hdfs dfs -ls /test_dir
#
# echo "Reading sample.txt"
# hdfs dfs -cat /test_dir/sample.txt

echo "Verifying MapReduce Execution"
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-*.jar wordcount /test_dir /output

echo "Checking Output"
hdfs dfs -ls /output
hdfs dfs -cat /output/part-r-00000

echo "Verifying HDFS Health"

echo "Phase 01 completed"
