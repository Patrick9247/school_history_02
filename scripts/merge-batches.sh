#!/bin/bash

# 合并所有 batch SQL 文件为一个大的事务
cd /workspace/projects/scripts

# 创建合并后的 SQL 文件
echo "BEGIN;" > all-batches.sql
for i in {1..24}; do
  cat batch-$i.sql >> all-batches.sql
done

# 计算总行数
total_lines=$(wc -l < all-batches.sql)
echo "Merged $total_lines lines"

# 读取并输出前 200 行以验证
head -n 200 all-batches.sql
