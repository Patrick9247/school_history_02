// 导入数据到数据库
const { Pool } = require('pg');
const fs = require('fs');
const path = require('path');

// 数据库连接配置
const pool = new Pool({
  connectionString: 'postgresql://postgres:postgres@localhost:5432/postgres'
});

// 读取数据文件
const data = JSON.parse(fs.readFileSync(path.join(__dirname, '../data/professional-history.json'), 'utf8'));

async function importData() {
  const client = await pool.connect();

  try {
    console.log('开始导入数据...');

    // 清空表（如果需要重新导入）
    // await client.query('TRUNCATE TABLE professional_history CASCADE');

    let inserted = 0;
    let updated = 0;

    for (const item of data) {
      // 检查是否已存在
      const existing = await client.query(
        'SELECT id FROM professional_history WHERE id = $1',
        [item.id]
      );

      if (existing.rows.length > 0) {
        // 更新现有记录
        await client.query(
          `UPDATE professional_history
           SET year = $1, major = $2, category = $3, description = $4, level = $5, department = $6, updated_at = NOW()
           WHERE id = $7`,
          [item.year, item.major, item.category, item.description, item.level, item.department, item.id]
        );
        updated++;
      } else {
        // 插入新记录
        await client.query(
          `INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
           VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)`,
          [item.id, item.year, item.major, item.category, item.description, item.level, item.department, new Date(), new Date()]
        );
        inserted++;
      }

      if ((inserted + updated) % 50 === 0) {
        console.log(`已处理 ${inserted + updated} 条记录...`);
      }
    }

    console.log('\n导入完成！');
    console.log(`✅ 新增: ${inserted} 条`);
    console.log(`🔄 更新: ${updated} 条`);
    console.log(`📊 总计: ${inserted + updated} 条`);

  } catch (error) {
    console.error('导入失败:', error);
  } finally {
    client.release();
    await pool.end();
  }
}

importData();
