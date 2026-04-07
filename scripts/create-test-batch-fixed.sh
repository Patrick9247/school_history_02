#!/bin/bash

cd /workspace/projects/scripts

# 提取前 500 条记录（从第 2 行开始，到第 1502 行，每条记录 3 行）
# BEGIN 在第 1 行

echo "BEGIN;" > test-500.sql
sed -n '2,1501p' final-import.sql >> test-500.sql
echo "COMMIT;" >> test-500.sql

# 验证
echo "First 5 lines:"
head -n 5 test-500.sql
echo "..."
echo "Last 5 lines:"
tail -n 5 test-500.sql
echo "Total lines:"
wc -l test-500.sql
