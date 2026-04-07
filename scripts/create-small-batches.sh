#!/bin/bash

# 创建多个小批次 SQL 文件，每个文件 50 条记录
cd /workspace/projects/scripts

for i in {1..47}; do
  start=$(( (i - 1) * 3 * 50 + 2 ))
  end=$(( i * 3 * 50 + 1 ))
  
  echo "BEGIN;" > import-part-$i.sql
  sed -n "${start},${end}p" final-import.sql >> import-part-$i.sql
  echo "COMMIT;" >> import-part-$i.sql
  
  lines=$(wc -l < import-part-$i.sql)
  echo "Created import-part-$i.sql with $lines lines"
done

# 处理最后的剩余部分（如果有的话）
last_start=$(( 47 * 3 * 50 + 2 ))
echo "BEGIN;" > import-part-48.sql
sed -n "${last_start},$(( 6995 - 1 ))p" final-import.sql >> import-part-48.sql
echo "COMMIT;" >> import-part-48.sql

lines=$(wc -l < import-part-48.sql)
echo "Created import-part-48.sql with $lines lines"

# 计算总文件数
count=$(ls import-part-*.sql | wc -l)
echo "Total $count batch files created"
