# Log Analytics System

A Hadoop-based distributed system for processing and analyzing large-scale log data. This project demonstrates various phases of log processing, from basic HDFS operations to complex custom MapReduce jobs using Python streaming.

## Project Structure

```text
Log_Analytics_System/
├── custom_wordcount/       # Python scripts for MapReduce
│   ├── mapper.py           # Standard word count mapper
│   ├── reducer.py          # Generic reducer for counting
│   └── mapper_error.py     # Log-specific mapper for status code analysis
├── Data/                   # Local storage for log files
├── Scripts/                # Bash scripts for different execution phases
│   ├── Phase_01.sh         # Hadoop environment verification
│   ├── Phase_02_Task-2.sh  # HDFS basic operations & small data upload
│   ├── Phase_02_Task-3.sh  # Large log generation & block verification
│   ├── Phase_03.sh         # Standard WordCount on large logs
│   ├── Phase_04.sh         # Custom Python streaming (WordCount)
│   └── Phase_05.sh         # Advanced log analysis (Error tracking)
└── README.md
```

## Phases of Execution

### Phase 1: Environment Verification
Validates that the Hadoop cluster (HDFS & MapReduce) is running correctly using standard example jars.

### Phase 2: Data Management
- **Task 2:** Sets up the initial directory structure in HDFS and uploads sample data.
- **Task 3:** Generates a large-scale synthetic log file (15 million lines) to test HDFS block splitting and distribution.

### Phase 3: Standard Processing
Uses the built-in Hadoop MapReduce examples to perform word counts on the generated large log files.

### Phase 4: Custom Python Streaming
Implements a custom WordCount using Python scripts (`mapper.py` and `reducer.py`) via the Hadoop Streaming API. This phase demonstrates how to use non-Java languages for MapReduce tasks.

### Phase 5: Advanced Analytics (Error Tracking)
Uses a specialized mapper (`mapper_error.py`) to parse log entries and identify request failures (HTTP status codes >= 400). It groups errors by status code and endpoint, providing insights into system health.

## Getting Started

### Prerequisites
- Hadoop 3.x installed and configured.
- Python 3.x installed on all nodes.
- `$HADOOP_HOME` environment variable set.

### Running the System
The scripts are designed to be run sequentially from the project root:

```bash
chmod +x Scripts/*.sh
./Scripts/Phase_01.sh
./Scripts/Phase_02_Task-2.sh
./Scripts/Phase_02_Task-3.sh
./Scripts/Phase_03.sh
./Scripts/Phase_04.sh
./Scripts/Phase_05.sh
```

## Features
- **Scalable Processing:** Designed for distributed environments using HDFS.
- **Custom Logic:** Extensible Python-based mapping and reducing logic.
- **Log Parsing:** Regex-based log analysis for status code and endpoint grouping.
- **Automated Workflow:** End-to-end automation from data generation to analysis.
