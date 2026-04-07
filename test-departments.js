// 测试院系数据（department字段）
const fs = require('fs');

// 读取数据
const apiData = JSON.parse(fs.readFileSync('/workspace/projects/data/professional-history.json', 'utf-8'));

// 测试不同年份的院系
const testYears = [1956, 1960, 1980, 1990, 2000, 2024];

console.log(`=== 不同年份的原所在院系分布 ===\n`);

testYears.forEach(year => {
  const yearData = apiData.filter(item => item.year === year);

  // 按原所在院系分组
  const deptMap = new Map();
  yearData.forEach(item => {
    const deptName = item.department || '其他院系';
    if (!deptMap.has(deptName)) {
      deptMap.set(deptName, []);
    }
    deptMap.get(deptName).push(item.major);
  });

  console.log(`${year}年 (${yearData.length} 个专业):`);
  console.log(`  院系数: ${deptMap.size}`);

  deptMap.forEach((majors, deptName) => {
    console.log(`    ${deptName}: ${majors.length} 个专业`);
    majors.slice(0, 2).forEach(major => {
      console.log(`      - ${major}`);
    });
    if (majors.length > 2) {
      console.log(`      ... 还有 ${majors.length - 2} 个专业`);
    }
  });

  console.log('');
});

console.log(`=== 总结 ===`);
console.log(`可以看到院系名称的历史变化：`);
console.log(`- 1956-1960年：使用"系"（如地质测量及找矿系、水文地质及工程地质系）`);
console.log(`- 1980年：有些使用编号（如七系、三系），有些使用"系"`);
console.log(`- 1990年：使用规范的"系"名称（如地质学系、应用化学系）`);
console.log(`- 2000年后：开始出现"学院"（如环境与土木工程学院）`);
console.log(`- 2024年：大部分是"学院"，个别是"系"`);
