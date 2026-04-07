#!/bin/bash

# 使用 curl 调用 API 来批量导入数据
cd /workspace/projects/scripts

# 检查服务是否运行
if ! curl -s http://localhost:5000 > /dev/null; then
  echo "服务未运行，请先启动服务"
  exit 1
fi

# 循环执行所有批次
for i in {1..48}; do
  echo "正在执行批次 $i/48..."
  
  # 读取 SQL 文件
  sql=$(cat import-part-$i.sql)
  
  # 调用 API 执行 SQL
  response=$(curl -s -X POST http://localhost:5000/api/import-batch \
    -H "Content-Type: application/json" \
    -d "{\"batchNumber\":$i}")
  
  # 检查响应
  if echo "$response" | grep -q '"success":true'; then
    echo "✓ 批次 $i 执行成功"
  else
    echo "✗ 批次 $i 执行失败: $response"
  fi
  
  # 等待一下避免过载
  sleep 0.1
done

echo "所有批次执行完成"
