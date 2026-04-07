// 验证2024年学院专业数量
const fs = require('fs');

// 读取数据
const apiData = JSON.parse(fs.readFileSync('/workspace/projects/data/professional-history.json', 'utf-8'));

// 2024年的数据
const year2024Data = apiData.filter(item => item.year === 2024);

console.log(`=== 2024年数据验证 ===`);
console.log(`总专业数: ${year2024Data.length}\n`);

// 按学院统计
const collegeMap = new Map();
year2024Data.forEach(item => {
  const collegeName = item.category || '其他';
  if (!collegeMap.has(collegeName)) {
    collegeMap.set(collegeName, []);
  }
  collegeMap.get(collegeName).push(item.major);
});

console.log(`学院数量: ${collegeMap.size}\n`);

console.log(`=== 学院专业列表 ===`);
Array.from(collegeMap.entries())
  .sort((a, b) => b[1].length - a[1].length)
  .forEach(([college, majors]) => {
    console.log(`${college}: ${majors.length} 个专业`);
    majors.slice(0, 3).forEach(major => {
      console.log(`  - ${major}`);
    });
    if (majors.length > 3) {
      console.log(`  ... 还有 ${majors.length - 3} 个专业`);
    }
    console.log('');
  });

// 验证总数
const totalMajors = Array.from(collegeMap.values()).reduce((sum, majors) => sum + majors.length, 0);
console.log(`验证: ${totalMajors} 个专业 (应该等于 ${year2024Data.length})`);

if (totalMajors === year2024Data.length) {
  console.log('✅ 数据一致');
} else {
  console.log('❌ 数据不一致');
}
