const fs = require('fs');
const { execSync } = require('child_process');

// 读取 SQL 文件
const sqlContent = fs.readFileSync('./scripts/import-data.sql', 'utf8');

// 提取所有 INSERT 语句
const insertStatements = sqlContent.match(/INSERT INTO professional_history[\s\S]*?;/g);

console.log(`Found ${insertStatements.length} INSERT statements`);

// 每批执行的记录数
const batchSize = 100;
let currentBatch = [];

for (let i = 0; i < insertStatements.length; i++) {
  currentBatch.push(insertStatements[i]);

  // 当达到批次大小或者是最后一条记录时执行
  if (currentBatch.length >= batchSize || i === insertStatements.length - 1) {
    const batchNum = Math.floor(i / batchSize) + 1;
    const totalBatches = Math.ceil(insertStatements.length / batchSize);

    // 创建批量 SQL
    const batchSQL = `BEGIN;\n${currentBatch.join('\n')}\nCOMMIT;`;

    // 输出批量 SQL 到文件
    const batchFile = `./scripts/batch-${batchNum}.sql`;
    fs.writeFileSync(batchFile, batchSQL);

    console.log(`Generated batch ${batchNum}/${totalBatches} (${currentBatch.length} records)`);

    currentBatch = [];
  }
}

console.log('All batch files generated successfully');
