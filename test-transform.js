// 测试 transformData 函数的逻辑
const fs = require('fs');

// 读取数据
const apiData = JSON.parse(fs.readFileSync('/workspace/projects/data/professional-history.json', 'utf-8'));

// transformData 函数逻辑
const transformData = (apiData) => {
  const yearMap = new Map();

  apiData.forEach(item => {
    if (!yearMap.has(item.year)) {
      yearMap.set(item.year, []);
    }
    yearMap.get(item.year).push(item);
  });

  const result = [];
  yearMap.forEach((items, year) => {
    const deptMap = new Map();

    items.forEach(item => {
      // 使用 category（学院）而不是 department 来统计院系
      const deptName = item.category || '其他';
      if (!deptMap.has(deptName)) {
        deptMap.set(deptName, []);
      }
      deptMap.get(deptName).push({
        name: item.major,
        code: '',
        degree: item.level || '本科',
        college: item.category || '',
        original_college: item.category || '',
        original_dept: item.department || '',
      });
    });

    const departments = [];
    deptMap.forEach((majors, deptName) => {
      departments.push({
        name: deptName,
        college: deptName,
        majorCount: majors.length,
        majors,
      });
    });

    result.push({
      year,
      departmentCount: departments.length,
      majorCount: items.length,
      departments,
    });
  });

  return result.sort((a, b) => a.year - b.year);
};

const transformedData = transformData(apiData);

// 输出2024年的统计
const year2024 = transformedData.find(d => d.year === 2024);
console.log(`=== 2024年数据统计 ===`);
console.log(`专业总数: ${year2024.majorCount}`);
console.log(`学院总数: ${year2024.departmentCount}`);
console.log(`\n学院列表：`);
year2024.departments.forEach(dept => {
  console.log(`  ${dept.name}: ${dept.majorCount} 个专业`);
});

// 验证几个关键年份
console.log(`\n=== 关键年份验证 ===`);
const keyYears = [1956, 1980, 2000, 2024, 2025];
keyYears.forEach(year => {
  const yearData = transformedData.find(d => d.year === year);
  if (yearData) {
    console.log(`${year}年: ${yearData.departmentCount} 个学院, ${yearData.majorCount} 个专业`);
  }
});
