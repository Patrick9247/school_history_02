const XLSX = require('xlsx');

// 读取 Excel 文件
const workbook = XLSX.readFile('/workspace/projects/public/本科专业发展-导出数据.xlsx');
const sheetName = workbook.SheetNames[0];
const worksheet = workbook.Sheets[sheetName];
const data = XLSX.utils.sheet_to_json(worksheet);

console.log(`读取到 ${data.length} 条数据`);

// 转换数据格式
const transformedData = data.map((row, index) => {
  const year = row['年度（「日期」）'];
  // 处理年份，可能是日期格式，需要提取年份
  let yearNumber = year;
  if (typeof year === 'string' && year.includes('-')) {
    yearNumber = parseInt(year.split('-')[0]);
  } else if (year instanceof Date) {
    yearNumber = year.getFullYear();
  } else if (typeof year === 'number') {
    // Excel 日期序列号
    const date = new Date((year - 25569) * 86400 * 1000);
    yearNumber = date.getFullYear();
  } else if (typeof year === 'string') {
    // 如果是纯数字字符串
    yearNumber = parseInt(year);
  }

  return {
    year: parseInt(yearNumber),
    major: row['专业（「文本」）'] || '',
    category: row['现归属学院（「文本」）'] || '',
    description: `${row['学校名称（「文本」）'] || ''} · ${row['原所在院系（「文本」）'] || ''}`,
    level: row['学制（「单选」）'] || '',
    department: row['原所在院系（「文本」）'] || ''
  };
});

// 按年份排序
transformedData.sort((a, b) => a.year - b.year);

console.log(`转换后的数据示例：`);
console.log(JSON.stringify(transformedData.slice(0, 3), null, 2));

// 保存为 JSON 文件供导入使用
const fs = require('fs');
fs.writeFileSync('/workspace/projects/public/import-data.json', JSON.stringify(transformedData, null, 2), 'utf-8');

console.log(`\n数据已保存到 /workspace/projects/public/import-data.json`);
console.log(`共 ${transformedData.length} 条记录`);

// 按年份统计
const yearStats = {};
transformedData.forEach(item => {
  if (!yearStats[item.year]) {
    yearStats[item.year] = 0;
  }
  yearStats[item.year]++;
});

console.log(`\n年份统计：`);
Object.keys(yearStats).sort().forEach(year => {
  console.log(`${year}年: ${yearStats[year]} 个专业`);
});
