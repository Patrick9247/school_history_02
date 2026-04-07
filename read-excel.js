const XLSX = require('xlsx');

// 读取 Excel 文件
const workbook = XLSX.readFile('/workspace/projects/public/本科专业发展-导出数据.xlsx');

// 获取第一个工作表
const sheetName = workbook.SheetNames[0];
const worksheet = workbook.Sheets[sheetName];

// 转换为 JSON 数据
const data = XLSX.utils.sheet_to_json(worksheet);

console.log('工作表名称:', sheetName);
console.log('数据行数:', data.length);
console.log('前 5 行数据:');
console.log(JSON.stringify(data.slice(0, 5), null, 2));
