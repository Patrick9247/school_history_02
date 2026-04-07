// 从 JSON 文件生成 SQL 插入语句
const fs = require('fs');
const path = require('path');

const data = JSON.parse(fs.readFileSync(path.join(__dirname, '../data/professional-history.json'), 'utf8'));

console.log('BEGIN;');

data.forEach((item, index) => {
  // 转义单引号
  const major = (item.major || '').replace(/'/g, "''");
  const category = (item.category || '').replace(/'/g, "''");
  const description = (item.description || '').replace(/'/g, "''");
  const level = (item.level || '').replace(/'/g, "''");
  const department = (item.department || '').replace(/'/g, "''");

  console.log(`INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)`);
  console.log(`VALUES (${item.id}, ${item.year}, '${major}', '${category}', '${description}', '${level}', '${department}', NOW(), NOW())`);
  console.log(`ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();`);
  console.log();
});

console.log('COMMIT;');
