#!/bin/bash

cd /workspace/projects/scripts

# 创建合并后的 SQL 文件，只有一个 BEGIN 和 COMMIT
echo "BEGIN;" > final-import.sql

# 循环处理每个 batch 文件
for i in {1..24}; do
  # 读取 batch 文件，删除 BEGIN 和 COMMIT 行
  cat batch-$i.sql | grep -v "^BEGIN;" | grep -v "^COMMIT;" >> final-import.sql
done

echo "COMMIT;" >> final-import.sql

# 计算总行数
total_lines=$(wc -l < final-import.sql)
echo "Merged $total_lines lines (with single BEGIN/COMMIT)"

# 验证文件格式
echo "First 10 lines:"
head -n 10 final-import.sql
echo "..."
echo "Last 5 lines:"
tail -n 5 final-import.sql
