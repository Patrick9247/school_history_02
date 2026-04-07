// 测试学院专业映射
const fs = require('fs');

// 读取数据
const data = JSON.parse(fs.readFileSync('/workspace/projects/data/professional-history.json', 'utf-8'));

console.log(`总数据量: ${data.length}\n`);

// 按学院统计
const collegeMap = new Map();

data.forEach(item => {
  const collegeName = item.category || '其他';
  if (!collegeMap.has(collegeName)) {
    collegeMap.set(collegeName, []);
  }
  collegeMap.get(collegeName).push(item.major);
});

// 输出统计
console.log('=== 学院及专业数量统计 ===\n');

Array.from(collegeMap.entries())
  .sort((a, b) => b[1].length - a[1].length)
  .forEach(([college, majors]) => {
    console.log(`${college}: ${majors.length} 个专业`);
    // 显示前 3 个专业
    majors.slice(0, 3).forEach(major => {
      console.log(`  - ${major}`);
    });
    if (majors.length > 3) {
      console.log(`  ... 还有 ${majors.length - 3} 个专业`);
    }
    console.log('');
  });

console.log(`\n总共 ${collegeMap.size} 个学院`);

// 检查是否有数据中的学院没有匹配
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

console.log('\n=== 代码中定义的学院检查 ===\n');
codeColleges.forEach(codeCollege => {
  if (collegeMap.has(codeCollege)) {
    console.log(`✅ ${codeCollege}: ${collegeMap.get(codeCollege).length} 个专业`);
  } else {
    console.log(`❌ ${codeCollege}: 数据中不存在`);
  }
});
