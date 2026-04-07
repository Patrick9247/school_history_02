// 检查学院数据的完整性
const fs = require('fs');

// 读取数据
const data = JSON.parse(fs.readFileSync('/workspace/projects/data/professional-history.json', 'utf-8'));

// 代码中定义的学院
const codeColleges = [
  "地球与行星科学学院",
  "地球物理学院",
  "能源学院（页岩气现代产业学院）",
  "能源学院",
  "核技术与自动化工程学院",
  "环境与土木工程学院",
  "材料与化学化工学院（锂资源与锂电产业学院）",
  "管理科学学院",
  "沉积地质研究院",
  "生态环境学院",
  "物理学院",
  "数学科学学院",
  "外国语学院",
  "文法学院（纪检监察学院）",
  "马克思主义学院",
  "商学院",
  "地理与规划学院",
  "信息科学与技术学院",
  "机电工程学院",
  "体育学院",
  "计算机与网络安全学院（示范性软件学院）",
  "传播科学与艺术学院",
  "国际教育学院（成都理工大学牛津布鲁克斯学院）"
];

// 数据中的学院
const dataColleges = Array.from(new Set(data.map(item => item.category)));

console.log('=== 学院数据对比 ===\n');
console.log(`代码中定义的学院数量: ${codeColleges.length}`);
console.log(`数据中的学院数量: ${dataColleges.length}\n`);

// 检查代码中定义的学院是否都在数据中
console.log('=== 代码中定义但数据中不存在的学院 ===');
codeColleges.forEach(college => {
  if (!dataColleges.includes(college)) {
    console.log(`❌ ${college}`);
  }
});

console.log('\n=== 数据中存在但代码中未定义的学院 ===');
dataColleges.forEach(college => {
  if (!codeColleges.includes(college)) {
    console.log(`❌ ${college}`);
  }
});

// 检查每个学院的专业数量
console.log('\n=== 学院专业数量统计 ===\n');
codeColleges.forEach(college => {
  const majors = data.filter(item => item.category === college);
  console.log(`${college}: ${majors.length} 个专业`);
});
