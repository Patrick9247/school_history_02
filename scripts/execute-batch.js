const fs = require('fs');
const { Pool } = require('pg');

// 从环境变量获取数据库连接信息
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

async function executeBatchFiles() {
  const client = await pool.connect();

  try {
    // 获取所有 batch 文件
    const batchFiles = fs.readdirSync('./scripts')
      .filter(file => file.startsWith('batch-') && file.endsWith('.sql'))
      .sort();

    console.log(`Found ${batchFiles.length} batch files`);

    for (const file of batchFiles) {
      const batchNum = file.replace('batch-', '').replace('.sql', '');
      const sql = fs.readFileSync(`./scripts/${file}`, 'utf8');

      console.log(`Executing batch ${batchNum}...`);

      await client.query(sql);

      console.log(`✓ Batch ${batchNum} completed`);
    }

    console.log('All batches executed successfully');
  } catch (error) {
    console.error('Error:', error);
    throw error;
  } finally {
    client.release();
    await pool.end();
  }
}

executeBatchFiles().catch(console.error);
