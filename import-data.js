const fs = require('fs');
const http = require('http');

// 读取转换后的数据
const data = JSON.parse(fs.readFileSync('/workspace/projects/public/import-data.json', 'utf-8'));

console.log(`准备导入 ${data.length} 条数据`);

// 分批导入
const BATCH_SIZE = 50; // 每批50条
const totalBatches = Math.ceil(data.length / BATCH_SIZE);

let importedCount = 0;

function importBatch(batchIndex) {
  return new Promise((resolve, reject) => {
    const start = batchIndex * BATCH_SIZE;
    const end = Math.min(start + BATCH_SIZE, data.length);
    const batch = data.slice(start, end);

    const postData = JSON.stringify({ data: batch });

    const options = {
      hostname: 'localhost',
      port: 5000,
      path: '/api/professional-history/bulk',
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Content-Length': Buffer.byteLength(postData)
      }
    };

    const req = http.request(options, (res) => {
      let responseData = '';

      res.on('data', (chunk) => {
        responseData += chunk;
      });

      res.on('end', () => {
        if (res.statusCode === 200 || res.statusCode === 201) {
          try {
            const result = JSON.parse(responseData);
            console.log(`批次 ${batchIndex + 1}/${totalBatches} 导入成功: ${result.count || batch.length} 条`);
            importedCount += result.count || batch.length;
            resolve(result);
          } catch (error) {
            console.error(`批次 ${batchIndex + 1} 解析响应失败:`, error.message);
            reject(error);
          }
        } else {
          console.error(`批次 ${batchIndex + 1} 失败: HTTP ${res.statusCode}`);
          console.error('响应:', responseData);
          reject(new Error(`HTTP ${res.statusCode}`));
        }
      });
    });

    req.on('error', (error) => {
      console.error(`批次 ${batchIndex + 1} 请求失败:`, error.message);
      reject(error);
    });

    req.write(postData);
    req.end();
  });
}

// 递归导入所有批次
async function importAllBatches() {
  console.log('开始导入数据...\n');

  for (let i = 0; i < totalBatches; i++) {
    try {
      await importBatch(i);
      // 短暂延迟以避免服务器过载
      if (i < totalBatches - 1) {
        await new Promise(resolve => setTimeout(resolve, 200));
      }
    } catch (error) {
      console.error(`批次 ${i + 1} 导入失败，停止导入`);
      console.error(`已成功导入 ${importedCount} 条数据`);
      process.exit(1);
    }
  }

  console.log(`\n✅ 导入完成！共导入 ${importedCount} 条数据`);
}

// 检查服务是否运行
function checkService() {
  return new Promise((resolve, reject) => {
    const req = http.get('http://localhost:5000/api/professional-history', (res) => {
      if (res.statusCode === 200) {
        console.log('服务运行正常\n');
        resolve();
      } else {
        reject(new Error(`服务返回 HTTP ${res.statusCode}`));
      }
      req.on('error', reject);
    });

    req.on('error', (error) => {
      console.error('无法连接到服务，请确保服务正在运行: http://localhost:5000');
      reject(error);
    });
  });
}

// 执行导入
checkService()
  .then(importAllBatches)
  .catch((error) => {
    console.error('导入失败:', error.message);
    process.exit(1);
  });
