#!/bin/bash

# 批量导入所有数据
echo "开始批量导入数据..."
echo "由于数据量较大（2331 条记录），需要分批执行"
echo ""

# 显示批次文件列表
echo "已创建 48 个批次文件，每个文件约 50 条记录："
ls -lh /workspace/projects/scripts/import-part-*.sql | awk '{print $9, $5}'

echo ""
echo "请使用以下命令逐批导入数据："
echo ""
echo "对于每个批次 i (1-48)，执行："
echo "  cat /workspace/projects/scripts/import-part-i.sql | sqlite3 database.db"
echo ""
echo "或者使用 PostgreSQL 命令："
echo "  psql -d your_database -f /workspace/projects/scripts/import-part-i.sql"
echo ""
echo "注意：由于当前环境的限制，建议使用 exec_sql 工具逐批执行"
