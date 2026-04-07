// 更新专业代码到数据库
const { Pool } = require('pg');
const fs = require('fs');
const path = require('path');

// 数据库连接配置
const pool = new Pool({
  connectionString: 'postgresql://postgres:postgres@localhost:5432/postgres'
});

// 加载专业代码映射
const majorCodeMapping = require('./major-code-mapping.js');

// 读取数据文件
const data = JSON.parse(fs.readFileSync(path.join(__dirname, '../data/professional-history.json'), 'utf8'));

async function updateMajorCodes() {
  const client = await pool.connect();

  try {
    console.log('开始更新专业代码...');

    // 统计信息
    let updated = 0;
    let notFound = 0;
    let skipped = 0;

    // 按专业分组，避免重复更新
    const majorGroups = {};
    data.forEach(item => {
      if (!majorGroups[item.major]) {
        majorGroups[item.major] = [];
      }
      majorGroups[item.major].push(item);
    });

    console.log(`找到 ${Object.keys(majorGroups).length} 个不同的专业`);

    // 更新每个专业的代码
    for (const [majorName, items] of Object.entries(majorGroups)) {
      const code = majorCodeMapping[majorName];

      if (!code) {
        console.log(`❌ 未找到专业代码: ${majorName}`);
        notFound++;
        continue;
      }

      // 检查是否已经有代码
      const checkResult = await client.query(
        'SELECT code FROM professional_history WHERE major = $1 LIMIT 1',
        [majorName]
      );

      if (checkResult.rows.length > 0 && checkResult.rows[0].code) {
        console.log(`⏭️  跳过 (已有代码): ${majorName} -> ${code}`);
        skipped++;
        continue;
      }

      // 更新该专业的所有记录
      const result = await client.query(
        'UPDATE professional_history SET code = $1 WHERE major = $2',
        [code, majorName]
      );

      console.log(`✅ 更新: ${majorName} -> ${code} (${result.rowCount} 条记录)`);
      updated++;
    }

    console.log('\n更新完成！');
    console.log(`✅ 成功更新: ${updated} 个专业`);
    console.log(`⏭️  跳过 (已有代码): ${skipped} 个专业`);
    console.log(`❌ 未找到代码: ${notFound} 个专业`);

  } catch (error) {
    console.error('更新失败:', error);
  } finally {
    client.release();
    await pool.end();
  }
}

updateMajorCodes();
