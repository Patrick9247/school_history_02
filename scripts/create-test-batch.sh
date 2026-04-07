#!/bin/bash

cd /workspace/projects/scripts

# 从 final-import.sql 中提取前 500 条记录
# 每条记录大约 3 行（INSERT + VALUES + ON CONFLICT）

echo "BEGIN;" > test-500.sql

# 提取 500 条记录（大约 1500 行）
head -n 1501 final-import.sql | tail -n 1499 >> test-500.sql

echo "COMMIT;" >> test-500.sql

# 验证
echo "First 5 lines:"
head -n 5 test-500.sql
echo "..."
echo "Last 5 lines:"
tail -n 5 test-500.sql
echo "Total lines:"
wc -l test-500.sql
