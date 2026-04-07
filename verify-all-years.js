// 完整验证所有年份的统计
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

console.log(`=== 完整年份统计 ===`);
console.log(`年份范围: ${transformedData[0].year} - ${transformedData[transformedData.length - 1].year}`);
console.log(`总年份数: ${transformedData.length}`);
console.log(`总专业数: ${transformedData.reduce((sum, d) => sum + d.majorCount, 0)}\n`);

// 按年代统计
console.log(`=== 按年代统计 ===`);
const decades = {};
transformedData.forEach(d => {
  const decade = Math.floor(d.year / 10) * 10;
  if (!decades[decade]) {
    decades[decade] = { yearCount: 0, collegeSum: 0, majorSum: 0, years: [] };
  }
  decades[decade].yearCount++;
  decades[decade].collegeSum += d.departmentCount;
  decades[decade].majorSum += d.majorCount;
  decades[decade].years.push(d.year);
});

Object.keys(decades).sort().forEach(decade => {
  const data = decades[decade];
  const avgColleges = (data.collegeSum / data.yearCount).toFixed(1);
  const avgMajors = (data.majorSum / data.yearCount).toFixed(1);
  console.log(`${decade}年代: ${data.yearCount}年, 平均 ${avgColleges} 个学院/年, 平均 ${avgMajors} 个专业/年`);
});

// 检查是否有异常数据
console.log(`\n=== 异常数据检查 ===`);
transformedData.forEach(d => {
  if (d.majorCount > 100) {
    console.log(`${d.year}年: 专业数较多 (${d.majorCount})`);
  }
  if (d.departmentCount > 25) {
    console.log(`${d.year}年: 学院数较多 (${d.departmentCount})`);
  }
});
