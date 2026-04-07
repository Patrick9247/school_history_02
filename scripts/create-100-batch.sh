#!/bin/bash

cd /workspace/projects/scripts

# 创建一个包含 100 条记录的批次
echo "BEGIN;" > batch-100-test.sql
sed -n '2,301p' final-import.sql >> batch-100-test.sql
echo "COMMIT;" >> batch-100-test.sql

# 输出文件信息
echo "Created batch-100-test.sql with 100 records:"
wc -l batch-100-test.sql
