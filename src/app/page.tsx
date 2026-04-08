'use client';

import { useEffect, useState, useRef, useCallback, useMemo } from 'react';

// 行星颜色配置（明亮色系，全部带状纹理，条纹随机）
const PLANET_COLORS = [
  // 所有行星都带状纹理，使用随机条纹，亮度提升
  { name: '水星', color: '#9A9A9A', gradient: ['#BABABA', '#7A7A7A'], baseBandColor: '#AAAAAA' },
  { name: '金星', color: '#C9A96E', gradient: ['#D9B97E', '#A98A5E'], baseBandColor: '#B9A97E' },
  { name: '地球', color: '#5A8A8A', gradient: ['#6A9A9A', '#4A7A7A'], baseBandColor: '#6A8A8A' },
  { name: '火星', color: '#C45C5C', gradient: ['#D46C6C', '#A44C4C'], baseBandColor: '#B45C5C' },
  { name: '木星', color: '#C49A4E', gradient: ['#D4AA5E', '#A48A3E'], baseBandColor: '#B49A4E' },
  { name: '土星', color: '#C4A850', gradient: ['#D4B860', '#A49840'], baseBandColor: '#B4A850' },
  { name: '天王星', color: '#6A9A9A', gradient: ['#8AAAAA', '#5A8A8A'], baseBandColor: '#7A9A9A' },
  { name: '海王星', color: '#5A7A9A', gradient: ['#7A8AAA', '#4A6A8A'], baseBandColor: '#6A7A9A' },
  { name: '冥王星', color: '#9A856A', gradient: ['#AA957A', '#8A756A'], baseBandColor: '#9A857A' },
  { name: '月球', color: '#8A8A8A', gradient: ['#9A9A9A', '#7A7A7A'], baseBandColor: '#8A8A8A' },
  { name: '彗星', color: '#8A6A9A', gradient: ['#9A7AAA', '#7A5A8A'], baseBandColor: '#8A6A9A' },
  { name: '星云', color: '#5A8A8A', gradient: ['#7A9A9A', '#4A7A7A'], baseBandColor: '#6A8A8A' },
  { name: '银河', color: '#7A5A8A', gradient: ['#8A6A9A', '#6A4A7A'], baseBandColor: '#7A5A8A' },
  { name: '极光', color: '#5A8A5A', gradient: ['#7A9A7A', '#4A7A4A'], baseBandColor: '#6A8A6A' },
  { name: '亮星1', color: '#8A7A6A', gradient: ['#9A8A7A', '#7A6A5A'], baseBandColor: '#8A7A7A' },
  { name: '亮星2', color: '#6A8A9A', gradient: ['#8A9AAA', '#5A7A8A'], baseBandColor: '#7A8A9A' },
  { name: '亮星3', color: '#9A6A8A', gradient: ['#AA7A9A', '#8A5A7A'], baseBandColor: '#9A6A8A' },
  { name: '亮星4', color: '#6A9A8A', gradient: ['#8AAA9A', '#5A8A7A'], baseBandColor: '#7A9A8A' },
  { name: '亮星5', color: '#8A8A6A', gradient: ['#9A9A7A', '#7A7A5A'], baseBandColor: '#8A8A7A' },
  { name: '亮星6', color: '#9A8A6A', gradient: ['#AA9A7A', '#8A7A5A'], baseBandColor: '#9A8A7A' },
  { name: '亮星7', color: '#8A6A6A', gradient: ['#9A7A7A', '#7A5A5A'], baseBandColor: '#8A7A7A' },
  { name: '亮星8', color: '#6A6A8A', gradient: ['#8A7A9A', '#5A5A7A'], baseBandColor: '#7A6A8A' },
];

// 生成带状纹理数据（条纹角度随机，数量3-8条，带宽度变化和云层效果）
const generateBandData = (index: number, baseColor: string): { bands: boolean; bandColors: string[]; bandAngle: number; bandCount: number; swirlStrength: number; cloudColor: string; bandWidthVar: number; turbulence: number; ovalBands: { offset: number; width: number; color: string }[] } => {
  // 使用索引生成确定性随机数，确保每次渲染一致
  const seed = index * 12345;
  const randomBetween = (min: number, max: number, seedOffset: number) => {
    const x = Math.sin(seed + seedOffset) * 10000;
    return min + (x - Math.floor(x)) * (max - min);
  };
  
  // 随机条纹数量（5-8条，更丰富的层次）
  const bandCount = Math.floor(randomBetween(5, 9, index)) as 5 | 6 | 7 | 8;
  
  // 随机条纹角度（-20到20度，更柔和的倾斜）
  const bandAngle = randomBetween(-20, 20, index + 100);
  
  // 漩涡强度（增加，让条纹更弯曲）
  const swirlStrength = randomBetween(0.1, 0.25, index + 200);
  
  // 湍流强度（新增，影响条纹的不规则性）
  const turbulence = randomBetween(0.05, 0.15, index + 250);
  
  // 条纹宽度变化（0.4-1.5，影响条纹厚度不均匀）
  const bandWidthVar = randomBetween(0.4, 1.5, index + 300);
  
  // 生成条纹颜色（更柔和的深浅交替，自然过渡）
  const bandColors: string[] = [];
  for (let i = 0; i < bandCount; i++) {
    // 条纹亮度变化更柔和
    const isLight = i % 2 === 0;
    const colorVar = isLight ? randomBetween(15, 35, index * 100 + i) : randomBetween(-30, -15, index * 100 + i);
    const adjustedColor = adjustBrightness(baseColor, colorVar);
    bandColors.push(adjustedColor);
  }
  
  // 云层颜色（基于基础色，添加一点蓝/白色调）
  const cloudColor = adjustBrightness(baseColor, randomBetween(20, 35, index + 400));
  
  // 生成不规则的椭圆云斑（模拟木星大红斑等）
  const ovalBands: { offset: number; width: number; color: string }[] = [];
  const ovalCount = Math.floor(randomBetween(2, 4, index + 500));
  for (let i = 0; i < ovalCount; i++) {
    ovalBands.push({
      offset: randomBetween(-0.5, 0.5, index * 10 + i),
      width: randomBetween(0.08, 0.2, index * 10 + i + 100),
      color: adjustBrightness(baseColor, randomBetween(10, 25, index * 10 + i + 200))
    });
  }
  
  return { bands: true, bandColors, bandAngle, bandCount, swirlStrength, cloudColor, bandWidthVar, turbulence, ovalBands };
};

// 合并 adjustBrightness 到 adjustBrightness
const adjustBrightness = (hexColor: string, percent: number): string => {
  const num = parseInt(hexColor.replace('#', ''), 16);
  const r = Math.min(255, Math.max(0, (num >> 16) + percent));
  const g = Math.min(255, Math.max(0, ((num >> 8) & 0x00FF) + percent));
  const b = Math.min(255, Math.max(0, (num & 0x0000FF) + percent));
  return '#' + ((r << 16) | (g << 8) | b).toString(16).padStart(6, '0');
};

// 获取学院球颜色（使用行星颜色，随机带状纹理，更自然的参数）
const getPlanetColor = (index: number) => {
  const planet = PLANET_COLORS[index % PLANET_COLORS.length];
  const bandData = generateBandData(index, planet.baseBandColor || planet.color);
  return {
    ...planet,
    ...bandData
  };
};

// 特殊年份颜色配置（提取到组件外部，避免重复创建）
const SPECIAL_YEAR_COLORS: Record<number, string> = {
  1956: '#FF6B6B',
  1958: '#FFA500',
  1965: '#9370DB',
  1993: '#FFA500',
  2001: '#FFD700',
  2017: '#00FF7F',
  2025: '#00CED1'
};

// 灯带颜色配置（提取到组件外部）
const LIGHT_COLORS = [
  '147, 197, 253', // 蓝色
  '167, 139, 250', // 紫色
  '236, 72, 153', // 粉色
  '34, 211, 238', // 青色
  '251, 146, 60', // 橙色
  '74, 222, 128', // 绿色
  '250, 204, 21', // 黄色
  '248, 113, 113', // 红色
  '192, 132, 252', // 浅紫
  '96, 165, 250', // 深蓝
  '167, 243, 208', // 青绿
  '254, 202, 202', // 浅红
];

// 角度缓存接口
interface AngleCache {
  cos: number;
  sin: number;
}

// 创建角度缓存（避免重复计算 sin/cos）
function createAngleCache(steps: number): AngleCache[] {
  const cache: AngleCache[] = [];
  for (let i = 0; i <= steps; i++) {
    const angle = (i / steps) * Math.PI * 2;
    cache[i] = { cos: Math.cos(angle), sin: Math.sin(angle) };
  }
  return cache;
}

interface Major {
  name: string;
  code: string;
  degree: string;
  college: string;
  original_college: string;
  original_dept: string;
  year?: number; // 可选的年份字段
}

interface Department {
  name: string;
  college: string;
  majorCount: number;
  majors: Major[];
}

interface YearData {
  year: number;
  departmentCount: number;
  majorCount: number;
  departments: Department[];
}

interface ApiDataItem {
  id: number;
  year: number;
  major: string;
  category: string;
  description: string;
  level: string;
  department: string;
  createdAt: string;
  updatedAt: string;
}

interface KeyEvent {
  year: number;
  label: string;
  desc: string;
}

interface College {
  name: string;
  color: string;
  majors: Major[];
}

// 行星数据类型
interface PlanetData {
  name: string;
  bands: boolean;
  bandColors?: string[];
  bandAngle?: number;
  swirlStrength?: number;
  cloudColor?: string;
  bandWidthVar?: number;
  turbulence?: number;
  ovalBands?: { offset: number; width: number; color: string }[];
}

interface DepartmentNode {
  name: string;
  color: string;
  majors: Major[];
  college: string;
  planetData?: PlanetData;
}

interface PathPoint {
  x: number;
  y: number;
  z: number;
  scale: number;
  progress: number;
}

interface RenderObject {
  type: 'sun' | 'college' | 'major' | 'department';
  lx: number;
  ly: number;
  lz: number;
  x?: number;
  y?: number;
  scale?: number;
  z?: number;
  radius: number;
  color: string;
  name?: string;
  index?: number;
  parentIndex?: number;
  majorData?: Major;
  collegeName?: string;
  angle?: number;
  planetData?: PlanetData;
}

export default function ProfessionalSpiralTower() {
  const [data, setData] = useState<YearData[]>([]);
  const [loading, setLoading] = useState(true);
  const [currentView, setCurrentView] = useState<'spiral' | 'solar'>('spiral');
  const [selectedYear, setSelectedYear] = useState<number | null>(null);
  const selectedYearRef = useRef<number | null>(null); // 用于 canvas 实时读取
  const [rawApiData, setRawApiData] = useState<ApiDataItem[]>([]); // 保存原始 API 数据
  const [departmentsByYear, setDepartmentsByYear] = useState<Map<number, DepartmentNode[]>>(new Map()); // 按年份缓存的院系数据
  const [tooltip, setTooltip] = useState<{
    year: number;
    count: number;
    event: string;
    x: number;
    y: number;
    visible: boolean;
  }>({ year: 0, count: 0, event: '', x: 0, y: 0, visible: false });
  const [selectedCollege, setSelectedCollege] = useState<College | null>(null);
  const [selectedMajor, setSelectedMajor] = useState<Major | null>(null);
  const [showCollegeHistory, setShowCollegeHistory] = useState(false); // 是否显示学院历史
  const [collegesWithMajors, setCollegesWithMajors] = useState<College[]>([]);
  const [yearStats, setYearStats] = useState<{ year: number; deptCount: number; majorCount: number } | null>(null);
  const [hoveredYear, setHoveredYear] = useState<number | null>(null); // 记录当前悬停的年份
  const [milestones, setMilestones] = useState<{ year: number; content: string }[]>([]); // 大事记数据
  const [showYearMenu, setShowYearMenu] = useState(false); // 是否显示年份点击菜单
  const [yearMenuPosition, setYearMenuPosition] = useState({ x: 0, y: 0 }); // 菜单位置
  const [milestoneModal, setMilestoneModal] = useState<{ visible: boolean; year: number; content: string }>({ visible: false, year: 0, content: '' }); // 大事记弹窗

  const canvasRef = useRef<HTMLCanvasElement>(null);
  const rotationRef = useRef(0);
  const solarRotXRef = useRef(0.6); // Google Earth 风格倾斜视角
  const solarRotYRef = useRef(0);
  const solarAutoRotationRef = useRef(0); // 学院球自动旋转角度
  const isDraggingRef = useRef(false);
  const isHoveringCollegeRef = useRef(false); // 鼠标是否悬停在学院球上
  const isHoveringSpiralRef = useRef(false); // 鼠标是否悬停在螺旋体上
  const isTouchingNodeRef = useRef(false); // 触摸是否在球上
  const lastMousePosRef = useRef({ x: 0, y: 0 });
  const animationFrameRef = useRef<number | undefined>(undefined);
  const zoomLevelRef = useRef(1);
  const animationTimeRef = useRef(0);
  const majorRotationAnglesRef = useRef<number[]>([]);
  const renderObjectsRef = useRef<RenderObject[]>([]); // 保存太阳系视图的渲染对象
  const spiralProjectionRef = useRef<{
    project3D: (lx: number, ly: number, lz: number, rotX: number, rotY: number, cx: number, cy: number) => { x: number; y: number; scale: number; z: number };
    isMobile: boolean;
    isTablet: boolean;
    spiralHeight: number;
    baseRadius: number;
    totalYears: number;
    startYear: number;
    rings: number;
  } | null>(null);

  // 光点队列（用于连续产生流星效果）
  const lightParticlesRef = useRef<Array<{
    progress: number;      // 0-2之间，0-1在螺旋线上，1-2飞出
    color: string;         // 随机颜色
    createdAt: number;     // 创建时间戳
    flyOutStart?: {        // 飞出时的起始位置和方向
      x: number;
      y: number;
      z: number;
      scale: number;
      dirX: number;
      dirY: number;
      opacity: number;
    };
  }>>([]);

  // 产生新光点的定时器
  const lastLightCreateTimeRef = useRef(0);
  const LIGHT_CREATE_INTERVAL = 0.53; // 每秒产生的光点数量（0.53秒产生一个，增加3倍）

  // 标记是否已初始化光点队列
  const lightParticlesInitializedRef = useRef(false);

  // 获取随机颜色
  const getRandomLightColor = (): string => {
    return LIGHT_COLORS[Math.floor(Math.random() * LIGHT_COLORS.length)];
  };

  // 基础学院数据（不带专业）
  const baseColleges: College[] = useMemo(() => [
    { name: "地球与行星科学学院", color: "#3b82f6", majors: [] },
    { name: "地球物理学院", color: "#10b981", majors: [] },
    { name: "能源学院（页岩气现代产业学院）", color: "#f59e0b", majors: [] },
    { name: "能源学院", color: "#f97316", majors: [] },
    { name: "核技术与自动化工程学院", color: "#ef4444", majors: [] },
    { name: "环境与土木工程学院", color: "#06b6d4", majors: [] },
    { name: "材料与化学化工学院（锂资源与锂电产业学院）", color: "#8b5cf6", majors: [] },
    { name: "管理科学学院", color: "#ec4899", majors: [] },
    { name: "沉积地质研究院", color: "#14b8a6", majors: [] },
    { name: "生态环境学院", color: "#22c55e", majors: [] },
    { name: "物理学院", color: "#0ea5e9", majors: [] },
    { name: "数学科学学院", color: "#6366f1", majors: [] },
    { name: "外国语学院", color: "#f472b6", majors: [] },
    { name: "文法学院（纪检监察学院）", color: "#84cc16", majors: [] },
    { name: "马克思主义学院", color: "#dc2626", majors: [] },
    { name: "商学院", color: "#f97316", majors: [] },
    { name: "地理与规划学院", color: "#eab308", majors: [] },
    { name: "信息科学与技术学院", color: "#7c3aed", majors: [] },
    { name: "机电工程学院", color: "#db2777", majors: [] },
    { name: "体育学院", color: "#14b8a6", majors: [] },
    { name: "计算机与网络安全学院（示范性软件学院）", color: "#9333ea", majors: [] },
    { name: "传播科学与艺术学院", color: "#a855f7", majors: [] },
    { name: "国际教育学院（成都理工大学牛津布鲁克斯学院）", color: "#f472b6", majors: [] }
  ], []);

  // 学院数据（使用带专业的版本）
  const colleges = useMemo((): College[] => {
    return collegesWithMajors.length > 0 ? collegesWithMajors : baseColleges;
  }, [collegesWithMajors, baseColleges]);

  // 提取所有专业列表（去重）
  const allMajors = useMemo(() => {
    const majorSet = new Set<string>();
    colleges.forEach(college => {
      college.majors.forEach(major => {
        majorSet.add(major.name);
      });
    });
    return Array.from(majorSet).sort();
  }, [colleges]);

  // 优化：缓存最大年份，避免重复计算
  const maxYear = useMemo(() => {
    return data.length > 0 ? Math.max(...data.map(d => d.year)) : 2025;
  }, [data]);

  // 生成所有年份数组（1956-2025，包括无数据的年份）
  const allYears = useMemo(() => {
    const years: number[] = [];
    for (let y = 1956; y <= maxYear; y++) {
      years.push(y);
    }
    return years;
  }, [maxYear]);

  // 关键事件
  const keyEvents: KeyEvent[] = useMemo(() => [
    { year: 1956, label: "建校", desc: "成都地质勘探学院" },
    { year: 1958, label: "更名", desc: "成都地质学院" },
    { year: 1965, label: "迁入", desc: "北京地质学院三系" },
    { year: 1993, label: "更名", desc: "成都理工学院" },
    { year: 2001, label: "合并", desc: "组建成都理工大学" },
    { year: 2017, label: "双一流", desc: "入选双一流" },
    { year: 2025, label: "现今", desc: "72个本科专业" }
  ], []);

  // 获取数据
  const fetchData = useCallback(async () => {
    try {
      const response = await fetch('/api/professional-history');
      const result = await response.json();

      if (result.success && result.data) {
        // 保存原始 API 数据
        setRawApiData(result.data);

        // 清空按年份缓存的院系数据，确保数据更新后显示正确的当年专业
        setDepartmentsByYear(new Map());

        const transformedData = transformData(result.data);
        setData(transformedData);

        // 按学院分组专业（所有年份）
        const collegeMap = new Map<string, Major[]>();
        result.data.forEach((item: ApiDataItem) => {
          const collegeName = item.category || '其他学院';
          if (!collegeMap.has(collegeName)) {
            collegeMap.set(collegeName, []);
          }
          collegeMap.get(collegeName)?.push({
            name: item.major,
            code: '',
            degree: item.level || '本科',
            college: item.category || '',
            original_college: item.category || '',
            original_dept: item.department || '',
            year: item.year, // 添加年份信息
          });
        });

        // 更新学院数据的专业列表（精确匹配）
        const updatedColleges: College[] = baseColleges.map(college => {
          // 优先精确匹配学院名称
          let matchingMajors: Major[] = collegeMap.get(college.name) || [];

          // 如果精确匹配失败，尝试使用学院名称的部分匹配
          if (matchingMajors.length === 0) {
            const collegeShortName = college.name.split('（')[0];
            matchingMajors = Array.from(collegeMap.entries())
              .filter(([collegeName]) => collegeName === collegeShortName || collegeName.startsWith(collegeShortName + '（'))
              .flatMap(([, majors]) => majors);
          }

          return {
            ...college,
            majors: matchingMajors.length > 0 ? matchingMajors : []
          };
        });

        setCollegesWithMajors(updatedColleges);
      }
    } catch (error) {
      console.error('Error fetching data:', error);
    } finally {
      setLoading(false);
    }
  }, [baseColleges]);

  // 获取大事记数据
  const fetchMilestones = useCallback(async () => {
    try {
      const docUrl = 'https://code.coze.cn/api/sandbox/coze_coding/file/proxy?expire_time=-1&file_path=assets%2F%E5%A4%A7%E4%BA%8B%E8%AE%B0.docx&nonce=00982661-045a-4adc-8cbd-40af26bce6ce&project_id=7625930670103068735&sign=085ed2a2fcae23c3673561f952774f00ea357c3c8a63bd56e16784f90c0adb90';
      const response = await fetch('/api/fetch-milestones', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ url: docUrl })
      });
      const result = await response.json();

      if (result.status === 'success' && result.content) {
        // 解析大事记文本，按年份提取
        const text = result.content;
        const parsedMilestones: { year: number; content: string }[] = [];
        
        // 使用正则匹配年份标题（格式：1956年\n\n...）
        const yearPattern = /(19[5-9]\d|20[0-2]\d)年\n\n([\s\S]*?)(?=\n\n(19[5-9]\d|20[0-2]\d)年|$)/g;
        let match;
        
        while ((match = yearPattern.exec(text)) !== null) {
          const year = parseInt(match[1]);
          const content = match[2].trim();
          if (content && content.length > 0) {
            parsedMilestones.push({ year, content });
          }
        }
        
        setMilestones(parsedMilestones);
        console.log('Loaded milestones:', parsedMilestones.length, parsedMilestones.map(m => `${m.year}年`));
      }
    } catch (error) {
      console.error('Error fetching milestones:', error);
    }
  }, []);

  // 根据选中年份过滤学院专业
  const getCollegesByYear = useCallback((year: number): College[] => {
    if (!rawApiData || rawApiData.length === 0) return collegesWithMajors;

    // 过滤该年份的数据
    const yearData = rawApiData.filter(item => item.year === year);

    // 按学院分组
    const collegeMap = new Map<string, Major[]>();
    yearData.forEach(item => {
      const collegeName = item.category || '其他学院';
      if (!collegeMap.has(collegeName)) {
        collegeMap.set(collegeName, []);
      }
      collegeMap.get(collegeName)?.push({
        name: item.major,
        code: '',
        degree: item.level || '本科',
        college: item.category || '',
        original_college: item.category || '',
        original_dept: item.department || '',
      });
    });

    // 更新学院数据的专业列表
    return baseColleges.map(college => {
      let matchingMajors: Major[] = collegeMap.get(college.name) || [];

      if (matchingMajors.length === 0) {
        const collegeShortName = college.name.split('（')[0];
        matchingMajors = Array.from(collegeMap.entries())
          .filter(([collegeName]) => collegeName === collegeShortName || collegeName.startsWith(collegeShortName + '（'))
          .flatMap(([, majors]) => majors);
      }

      return {
        ...college,
        majors: matchingMajors.length > 0 ? matchingMajors : []
      };
    });
  }, [rawApiData, collegesWithMajors, baseColleges]);

  // 根据选中年份获取院系数据（使用 department 字段）
  const getDepartmentsByYear = useCallback((year: number): DepartmentNode[] => {
    if (!rawApiData || rawApiData.length === 0) return [];

    // 检查缓存
    if (departmentsByYear.has(year)) {
      return departmentsByYear.get(year)!;
    }

    // 过滤该年份的数据
    const yearData = rawApiData.filter(item => item.year === year);

    // 按原所在院系分组
    const deptMap = new Map<string, { majors: Major[], college: string }>();
    yearData.forEach(item => {
      const deptName = item.department || '其他院系';
      if (!deptMap.has(deptName)) {
        deptMap.set(deptName, { majors: [], college: item.category || '' });
      }
      deptMap.get(deptName)!.majors.push({
        name: item.major,
        code: '',
        degree: item.level || '本科',
        college: item.category || '',
        original_college: item.category || '',
        original_dept: item.department || '',
        year: item.year, // 添加年份信息，确保专业只显示当年数据
      });
    });

    // 生成院系节点，使用行星颜色
    const departments: DepartmentNode[] = Array.from(deptMap.entries()).map(([deptName, data], index) => {
      const planetColor = getPlanetColor(index);
      return {
        name: deptName,
        color: planetColor.color,
        majors: data.majors,
        college: data.college,
        planetData: planetColor
      };
    });

    // 缓存结果
    setDepartmentsByYear(prev => new Map(prev).set(year, departments));

    return departments;
  }, [rawApiData, departmentsByYear]);

  // 获取当前视图使用的学院数据
  const currentColleges = useMemo(() => {
    if (currentView === 'solar' && selectedYear !== null) {
      return getCollegesByYear(selectedYear);
    }
    return colleges;
  }, [currentView, selectedYear, getCollegesByYear, colleges]);

  // 获取当前视图使用的院系数据（直接使用 rawApiData 过滤，确保显示当年专业）
  const currentDepartments = useMemo(() => {
    if (currentView !== 'solar' || selectedYear === null) {
      return [];
    }
    
    // 直接使用 rawApiData 过滤该年份的数据，避免缓存问题
    const yearData = rawApiData.filter(item => item.year === selectedYear);
    
    // 按原所在院系分组
    const deptMap = new Map<string, { majors: Major[], college: string }>();
    yearData.forEach(item => {
      const deptName = item.department || '其他院系';
      if (!deptMap.has(deptName)) {
        deptMap.set(deptName, { majors: [], college: item.category || '' });
      }
      deptMap.get(deptName)!.majors.push({
        name: item.major,
        code: '',
        degree: item.level || '本科',
        college: item.category || '',
        original_college: item.category || '',
        original_dept: item.department || '',
        year: item.year, // 保存年份信息
      });
    });

    // 生成院系节点，使用行星颜色
    const departments: DepartmentNode[] = Array.from(deptMap.entries()).map(([deptName, data], index) => {
      const planetColor = getPlanetColor(index);
      return {
        name: deptName,
        color: planetColor.color,
        majors: data.majors,
        college: data.college,
        planetData: planetColor
      };
    });

    return departments;
  }, [currentView, selectedYear, rawApiData]);

  // 使用 ref 存储 currentDepartments 的最新值，避免依赖项数组大小变化问题
  const currentDepartmentsRef = useRef<DepartmentNode[]>([]);
  currentDepartmentsRef.current = currentDepartments;

  const transformData = (apiData: ApiDataItem[]): YearData[] => {
    const yearMap = new Map<number, ApiDataItem[]>();

    // 优化：使用 for...of 替代 forEach，性能更好
    for (const item of apiData) {
      const year = item.year;
      if (!yearMap.has(year)) {
        yearMap.set(year, []);
      }
      yearMap.get(year)!.push(item);
    }

    const result: YearData[] = [];
    // 优化：使用 for...of 替代 forEach
    for (const [year, items] of yearMap) {
      const deptMap = new Map<string, Major[]>();

      for (const item of items) {
        // 使用 category（学院）而不是 department 来统计院系
        const deptName = item.category || '其他';
        if (!deptMap.has(deptName)) {
          deptMap.set(deptName, []);
        }
        deptMap.get(deptName)!.push({
          name: item.major,
          code: '',
          degree: item.level || '本科',
          college: item.category || '',
          original_college: item.category || '',
          original_dept: item.department || '',
        });
      }

      const departments: Department[] = [];
      for (const [deptName, majors] of deptMap) {
        departments.push({
          name: deptName,
          college: deptName, // 学院名称
          majorCount: majors.length,
          majors,
        });
      }

      result.push({
        year,
        departmentCount: departments.length,
        majorCount: items.length,
        departments,
      });
    }

    return result.sort((a, b) => a.year - b.year);
  };

  useEffect(() => {
    fetchData();
    fetchMilestones();
  }, [fetchData, fetchMilestones]);

  // 用户发送的光球状态
  const [userSelectedMajor, setUserSelectedMajor] = useState<string>(''); // 用户选中的专业
  const [highlightedMajor, setHighlightedMajor] = useState<string | null>(null); // 高亮显示的专业名
  const [popoverOpen, setPopoverOpen] = useState(false); // 下拉列表打开状态
  const userLightBallsRef = useRef<Array<{
    majorName: string;
    progress: number;
    color: string;
    createdAt: number;
    firstAppearYear: number; // 该专业第一次出现的年份
    flyOutStart?: {
      x: number;
      y: number;
      z: number;
      scale: number;
      dirX: number;
      dirY: number;
      opacity: number;
    };
  }>>([]);

  // 获取可用于发送光球的专业列表
  // 在太阳系视图中，只显示当前选中年份的专业
  // 在螺旋视图中，显示所有专业
  const selectableMajors = useMemo(() => {
    // 如果在太阳系视图且有选中年份，使用当前年份的专业
    if (currentView === 'solar' && selectedYear !== null) {
      const yearData = rawApiData.filter(item => item.year === selectedYear);
      const majorSet = new Set<string>();
      yearData.forEach(item => {
        majorSet.add(item.major);
      });
      return Array.from(majorSet).sort();
    }
    // 否则使用所有专业（螺旋视图）
    return allMajors;
  }, [currentView, selectedYear, rawApiData, allMajors]);

  // 发送光球 / 点亮专业球
  const sendLightBall = () => {
    if (!userSelectedMajor) return;

    if (currentView === 'solar') {
      // 太阳系视图：点亮对应的专业球
      setHighlightedMajor(userSelectedMajor);
    } else {
      // 螺旋视图：使用原有逻辑，发送光球
      // 计算该专业第一次出现的年份
      const majorFirstAppear = rawApiData
        .filter(item => item.major === userSelectedMajor)
        .map(item => item.year)
        .sort((a, b) => a - b)[0] || 1956;
      
      const newLightBall = {
        majorName: userSelectedMajor,
        progress: 0,
        color: getRandomLightColor(),
        createdAt: animationTimeRef.current,
        firstAppearYear: majorFirstAppear
      };
      userLightBallsRef.current.push(newLightBall);
    }
    // 发送后清空输入并关闭下拉列表
    setUserSelectedMajor('');
    setPopoverOpen(false);
  };

  // 太阳系视图搜索功能
  const [searchKeyword, setSearchKeyword] = useState<string>(''); // 搜索关键词
  const [searchOpen, setSearchOpen] = useState(false); // 搜索框打开状态

  // 点击外部关闭下拉列表
  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      const target = event.target as HTMLElement;
      if (!target.closest('.major-input-container')) {
        setPopoverOpen(false);
      }
      if (!target.closest('.search-container')) {
        setSearchOpen(false);
      }
    };

    if (popoverOpen || searchOpen) {
      document.addEventListener('click', handleClickOutside);
    }

    return () => {
      document.removeEventListener('click', handleClickOutside);
    };
  }, [popoverOpen, searchOpen]);

  // Canvas 绘制
  useEffect(() => {
    if (!canvasRef.current || data.length === 0) return;

    const canvas = canvasRef.current;
    const ctx = canvas.getContext('2d');
    if (!ctx) return;

    const rect = canvas.parentElement?.getBoundingClientRect();
    if (!rect) return;

    // 调试：打印 data 的年份信息
    console.log('data info:', {
      length: data.length,
      years: data.map(d => d.year),
      firstYear: data[0]?.year,
      lastYear: data[data.length - 1]?.year
    });

    // 获取设备像素比，支持高 DPI 屏幕
    const dpr = window.devicePixelRatio || 1;

    // 设置 Canvas 的物理尺寸
    canvas.width = rect.width * dpr;
    canvas.height = rect.height * dpr;

    // 设置 Canvas 的 CSS 尺寸
    canvas.style.width = `${rect.width}px`;
    canvas.style.height = `${rect.height}px`;

    // 缩放绘图上下文，使绘图逻辑使用逻辑坐标
    ctx.scale(dpr, dpr);

    const centerX = rect.width / 2;
    const centerY = rect.height / 2;
    const startYear = 1956;
    const endYear = maxYear;
    const totalYears = endYear - startYear + 1; // 70年 (1956-2025)
    
    console.log('spiral params:', { startYear, endYear, totalYears });
    const rings = 6;

    // 响应式参数调整
    const isMobile = rect.width < 768;
    const isTablet = rect.width >= 768 && rect.width < 1024;

    // 螺旋线视图参数（固定大小，不缩放）
    const spiralHeight = isMobile ? 600 : (isTablet ? 700 : 800);
    const baseRadius = Math.min(rect.width, rect.height) * (isMobile ? 0.22 : (isTablet ? 0.20 : 0.18));

    // 计算某年对应的螺旋位置
    const getYearProgress = (year: number) => {
      return (year - startYear) / (totalYears - 1); // 使用 (totalYears - 1) 作为分母，与节点生成一致
    };

    // 获取数据中所有有数据的年份集合
    const dataYearsSet = new Set(data.map(item => item.year));
    
    // 生成螺旋节点（所有年份，包括1966-1971空白的用白球显示）
    const spiralNodes = allYears.map((year) => {
      const progress = getYearProgress(year); // 使用统一的进度计算
      const angle = progress * rings * Math.PI * 2;
      const dataItem = data.find(item => item.year === year);
      const hasData = dataItem !== undefined;
      const isEmptyYear = !hasData; // 1966-1971等无数据年份
      
      // 无数据的年份显示浅灰色球（更明显）
      const specialColor = isEmptyYear ? '#aaaaaa' : (SPECIAL_YEAR_COLORS[year] || null);
      
      console.log('node:', { year, progress, angle, majorCount: dataItem?.majorCount || 0, isEmptyYear });
      return {
        localX: Math.cos(angle) * baseRadius,
        localY: (1 - progress) * spiralHeight - spiralHeight / 2,
        localZ: Math.sin(angle) * baseRadius,
        year: year,
        count: dataItem?.majorCount || 0,
        departmentCount: dataItem?.departmentCount || 0,
        size: 8, // 固定大小（2/3比例）
        specialColor: specialColor,
        hasData: hasData // 标记是否有数据
      };
    });

    // 3D 投影函数（接收 centerX, centerY 作为参数，确保点击检测与渲染一致）
    const project3D = (lx: number, ly: number, lz: number, rotX: number, rotY: number, cx: number, cy: number) => {
      // 绕 Y 轴旋转
      const x = lx * Math.cos(rotY) - lz * Math.sin(rotY);
      const z = lx * Math.sin(rotY) + lz * Math.cos(rotY);
      const y = ly;

      // 绕 X 轴旋转
      const y2 = y * Math.cos(rotX) - z * Math.sin(rotX);
      const z2 = y * Math.sin(rotX) + z * Math.cos(rotX);

      const perspective = 1200;
      // 防止除以零或负数
      const z2Clamped = Math.max(-perspective + 10, z2);
      const scale = perspective / (perspective + z2Clamped);
      return { x: cx + x * scale, y: cy + y2 * scale * 0.6, scale: Math.max(0.1, scale), z: z2 };
    };

    // 保存 project3D 和相关参数到 ref
    spiralProjectionRef.current = {
      project3D,
      isMobile,
      isTablet,
      spiralHeight,
      baseRadius,
      totalYears,
      startYear,
      rings
    };

    // 调整颜色亮度（支持 hex 和 hsl 格式）
    const adjustBrightness = (color: string, amount: number): string => {
      // 如果是 hsl 格式
      if (color.startsWith('hsl(')) {
        const match = color.match(/hsl\(([\d.]+),\s*([\d.]+)%,\s*([\d.]+)%\)/);
        if (match) {
          const h = parseFloat(match[1]);
          const s = parseFloat(match[2]);
          const l = Math.max(0, Math.min(100, parseFloat(match[3]) + amount));
          return `hsl(${h}, ${s}%, ${l}%)`;
        }
      }

      // 如果是 hex 格式
      const num = parseInt(color.slice(1), 16);
      const r = Math.max(0, Math.min(255, (num >> 16) + amount));
      const g = Math.max(0, Math.min(255, ((num >> 8) & 0x00FF) + amount));
      const b = Math.max(0, Math.min(255, (num & 0x0000FF) + amount));
      return '#' + ((r << 16) | (g << 8) | b).toString(16).padStart(6, '0');
    };

    // 将颜色转换为带透明度的格式
    const addAlpha = (color: string, alpha: number): string => {
      if (color.startsWith('hsl(')) {
        const match = color.match(/hsl\(([\d.]+),\s*([\d.]+)%,\s*([\d.]+)%\)/);
        if (match) {
          const h = parseFloat(match[1]);
          const s = parseFloat(match[2]);
          const l = parseFloat(match[3]);
          return `hsla(${h}, ${s}%, ${l}%, ${alpha})`;
        }
      }
      // hex 格式转换为 rgba
      const num = parseInt(color.slice(1), 16);
      const r = num >> 16;
      const g = (num >> 8) & 0x00FF;
      const b = num & 0x0000FF;
      return `rgba(${r}, ${g}, ${b}, ${alpha})`;
    };

    // 绘制球体
    const drawSphere = (x: number, y: number, radius: number, color: string, opacity: number, glow?: boolean, enable3D: boolean = true, planetData?: PlanetData, rotation?: number) => {
      // 防止无效值
      if (!isFinite(x) || !isFinite(y) || !isFinite(radius) || radius <= 0) {
        return;
      }

      // 旋转角度（用于带状纹理动画）
      const rot = rotation || 0;
      const swirl = planetData?.swirlStrength || 0.08;
      const bandWidthVar = planetData?.bandWidthVar || 1;

      if (glow) {
        // 外层光芒（淡）
        const outerGlowGradient = ctx.createRadialGradient(x, y, radius * 0.8, x, y, radius * 2.5);
        outerGlowGradient.addColorStop(0, addAlpha(color, 0.2));
        outerGlowGradient.addColorStop(0.5, addAlpha(color, 0.1));
        outerGlowGradient.addColorStop(1, addAlpha(color, 0));
        ctx.beginPath();
        ctx.arc(x, y, radius * 2.5, 0, Math.PI * 2);
        ctx.fillStyle = outerGlowGradient;
        ctx.globalAlpha = opacity * 0.6;
        ctx.fill();
        ctx.globalAlpha = 1;

        // 内层光芒（亮）
        const innerGlowGradient = ctx.createRadialGradient(x, y, radius * 0.5, x, y, radius * 1.5);
        innerGlowGradient.addColorStop(0, addAlpha(color, 0.4));
        innerGlowGradient.addColorStop(0.6, addAlpha(color, 0.2));
        innerGlowGradient.addColorStop(1, addAlpha(color, 0));
        ctx.beginPath();
        ctx.arc(x, y, radius * 1.5, 0, Math.PI * 2);
        ctx.fillStyle = innerGlowGradient;
        ctx.globalAlpha = opacity * 0.8;
        ctx.fill();
        ctx.globalAlpha = 1;
      }

      // 保存当前上下文状态
      ctx.save();
      ctx.beginPath();
      ctx.arc(x, y, radius, 0, Math.PI * 2);
      ctx.clip();

      if (planetData?.bands && planetData.bandColors) {
        // 绘制自然行星纹理（增强版）
        const bandColors = planetData.bandColors;
        const bandCount = bandColors.length;
        const bandAngle = (planetData.bandAngle || 0) * Math.PI / 180;
        const cloudColor = planetData.cloudColor || color;
        const turbulence = planetData.turbulence || 0.1;
        const swirl = planetData.swirlStrength || 0.15;
        const bandWidthVar = planetData.bandWidthVar || 1;
        const ovalBands = planetData.ovalBands || [];

        // 行星渲染 - 优化版本
        // 使用固定的 planetData 索引作为随机种子，确保纹理固定
        const planetSeed = (planetData?.swirlStrength || 0.1) * 10000;
        const rand = (offset: number, min: number, max: number) => {
          const t = Math.sin((planetSeed + offset) * 12.9898 + 78.233) * 43758.5453;
          return min + (t - Math.floor(t)) * (max - min);
        };
        
        // 预计算随机值（只计算一次）
        const bandRandoms: number[][] = [];
        for (let i = 0; i < bandCount + 3; i++) {
          bandRandoms.push([rand(i * 7, -0.85, 0.85), rand(i * 7 + 1, 0.5, 1.2), rand(i * 7 + 2, 0, Math.PI * 2)]);
        }
        const thinRandoms: number[][] = [];
        for (let i = 0; i < 5; i++) {
          thinRandoms.push([rand(100 + i * 8, -0.7, 0.7), rand(100 + i * 8 + 1, -15, 5)]);
        }
        const vortexRandoms: number[][] = [];
        for (let i = 0; i < 3; i++) {
          vortexRandoms.push([rand(200 + i * 11, -0.5, 0.5), rand(200 + i * 11 + 1, -20, 0)]);
        }
        const cloudRandoms: number[][] = [];
        for (let i = 0; i < 4; i++) {
          cloudRandoms.push([rand(300 + i * 6, -0.7, 0.7), rand(300 + i * 6 + 1, 0.1, 0.3)]);
        }
        
        // 步骤1: 基础球体（简化渐变）
        const baseGradient = ctx.createRadialGradient(
          x - radius * 0.4, y - radius * 0.4, 0,
          x + radius * 0.3, y + radius * 0.3, radius * 1.2
        );
        baseGradient.addColorStop(0, adjustBrightness(color, 25));
        baseGradient.addColorStop(0.4, adjustBrightness(color, 10));
        baseGradient.addColorStop(0.7, color);
        baseGradient.addColorStop(1, adjustBrightness(color, -40));
        ctx.beginPath();
        ctx.arc(x, y, radius, 0, Math.PI * 2);
        ctx.fillStyle = baseGradient;
        ctx.globalAlpha = opacity;
        ctx.fill();

        // 步骤2: 表面纹理层 - 使用3D投影模拟真实的行星自转
        // 自转轴固定倾斜23.5度（像地球），纹理绕倾斜轴旋转产生透视效果
        const AXIAL_TILT = 23.5 * Math.PI / 180; // 23.5度倾角
        
        // 3D自转投影函数：计算3D球面上一点绕倾斜轴旋转后的2D投影位置
        // 这是模拟真实行星自转的关键 - 球面上不同纬度的点移动速度不同
        const projectRotation = (bx: number, by: number, bz: number, angle: number) => {
          // 第一步：将点转换到自转轴坐标系（自转轴沿Z轴）
          const y1 = by * Math.cos(AXIAL_TILT) - bz * Math.sin(AXIAL_TILT);
          const z1 = by * Math.sin(AXIAL_TILT) + bz * Math.cos(AXIAL_TILT);
          
          // 第二步：绕Z轴（新自转轴）旋转
          const cosA = Math.cos(angle);
          const sinA = Math.sin(angle);
          const bx1 = bx * cosA - y1 * sinA;
          const y2 = bx * sinA + y1 * cosA;
          
          // 第三步：转换回原坐标系
          const newBy = y2 * Math.cos(AXIAL_TILT) + z1 * Math.sin(AXIAL_TILT);
          const newBz = -y2 * Math.sin(AXIAL_TILT) + z1 * Math.cos(AXIAL_TILT);
          
          return { x: bx1, y: newBy, z: newBz };
        };
        
        // 主条纹带 - 使用3D投影计算条纹位置，产生真实的自转透视效果
        for (let i = 0; i < bandCount + 2; i++) {
          const [baseY, widthVar, phase] = bandRandoms[i] || [0, 1, 0];
          const bandY = baseY * radius;
          const bandHeight = (radius * 0.4 / bandCount) * widthVar;
          // 漩涡效果与自转角度关联
          const waveOffset = (Math.sin(baseY * 4 + rot + phase) * radius * swirl + Math.sin(baseY * 6 - rot * 1.2) * radius * turbulence * 0.7);
          
          // 使用3D投影计算条纹带的实际位置
          const projCenter = projectRotation(waveOffset, bandY, 0, rot);
          const projX = projCenter.x * 0.8; // 透视压缩效果
          const projY = projCenter.y;
          
          ctx.beginPath();
          ctx.ellipse(x + projX, y + projY, radius * 1.4, bandHeight, 0, 0, Math.PI * 2);
          ctx.fillStyle = bandColors[i % bandCount];
          ctx.globalAlpha = opacity * 0.5;
          ctx.fill();
        }
        
        // 漩涡斑块 - 使用3D投影，斑块随自转从右向左移动
        for (let i = 0; i < 2; i++) {
          const [vortexYRatio, colorOffset] = vortexRandoms[i] || [0, -10];
          const vortexY = vortexYRatio * radius;
          const vortexX = Math.sin(vortexYRatio * 5 + rot) * radius * swirl;
          const vortexWidth = radius * 0.15;
          
          // 3D投影斑块位置
          const projVortex = projectRotation(vortexX, vortexY, 0, rot);
          
          ctx.beginPath();
          ctx.ellipse(x + projVortex.x * 0.8, y + projVortex.y, vortexWidth, vortexWidth * 0.6, 0, 0, Math.PI * 2);
          ctx.fillStyle = adjustBrightness(bandColors[i % bandCount], colorOffset);
          ctx.globalAlpha = opacity * 0.4;
          ctx.fill();
        }
        
        // 云带 - 使用3D投影，云层随自转漂移
        for (let i = 0; i < 3; i++) {
          const [cloudYRatio, cloudAlpha] = cloudRandoms[i] || [0, 0.2];
          const cloudY = cloudYRatio * radius;
          const cloudXOffset = rot * radius * 0.3; // 云层随自转横向漂移
          
          // 3D投影云带
          const projCloud = projectRotation(cloudXOffset, cloudY, 0, rot);
          
          ctx.beginPath();
          ctx.ellipse(x + projCloud.x * 0.7, y + projCloud.y, radius * 0.8, radius * 0.03, 0, 0, Math.PI * 2);
          ctx.fillStyle = `rgba(255, 255, 255, ${cloudAlpha})`;
          ctx.globalAlpha = opacity;
          ctx.fill();
        }

        // 步骤2.5: 自转指示器 - 使用3D投影，赤道标记和特征斑块随自转真实移动
        // 赤道高亮带 - 明显的白色带，使用3D投影随自转旋转
        const equatorY = 0;
        
        // 绘制赤道带（透视椭圆弧）
        ctx.beginPath();
        ctx.ellipse(x, y, radius * 0.9, radius * 0.06, 0, 0, Math.PI * 2);
        ctx.strokeStyle = 'rgba(255, 255, 255, 0.5)';
        ctx.lineWidth = radius * 0.1;
        ctx.globalAlpha = opacity * 0.5;
        ctx.stroke();
        
        // 特征斑块 - 使用3D投影，斑块随自转从右向左移动（1秒1圈）
        const spotInitialAngle = 0; // 斑块初始在右侧
        const spotCurrentAngle = spotInitialAngle + rot; // 随自转移动
        const spotRadius3D = radius * 0.85; // 斑块在球面上的位置
        
        // 斑块的3D位置
        const spot3D = projectRotation(
          Math.cos(spotCurrentAngle) * spotRadius3D,
          Math.sin(spotCurrentAngle * 0.3) * radius * 0.15, // 轻微的纬度变化
          Math.sin(spotCurrentAngle) * spotRadius3D * 0.3
        );
        
        // 斑块大小根据z值变化（靠近观察者时大，远离时小）
        const spotScale = 0.7 + spot3D.z * 0.3 / radius;
        const spotX = x + spot3D.x * 0.8;
        const spotY = y + spot3D.y;
        
        // 只在斑块朝向观察者时绘制
        if (spot3D.z > -radius * 0.5) {
          ctx.beginPath();
          ctx.ellipse(spotX, spotY, radius * 0.12 * spotScale, radius * 0.08 * spotScale, 0.3, 0, Math.PI * 2);
          ctx.fillStyle = adjustBrightness(color, -35);
          ctx.globalAlpha = opacity * 0.75 * spotScale;
          ctx.fill();
          
          // 斑块内部高光
          ctx.beginPath();
          ctx.ellipse(spotX * 0.95, spotY * 0.95, radius * 0.06 * spotScale, radius * 0.04 * spotScale, 0.3, 0, Math.PI * 2);
          ctx.fillStyle = adjustBrightness(color, -20);
          ctx.globalAlpha = opacity * 0.5 * spotScale;
          ctx.fill();
        }
        
        // 经线标记 - 使用3D投影画经线，像地球仪上的经线一样随自转旋转
        for (let i = 0; i < 3; i++) {
          const lineInitialAngle = (i / 3) * Math.PI; // 三条经线间隔120度
          const lineCurrentAngle = lineInitialAngle + rot * 0.8; // 经线随自转移动，稍慢于表面特征
          
          // 经线的两个端点
          const lineTop3D = projectRotation(
            Math.cos(lineCurrentAngle) * radius * 0.9,
            -radius * 0.9,
            Math.sin(lineCurrentAngle) * radius * 0.3
          );
          const lineBottom3D = projectRotation(
            Math.cos(lineCurrentAngle) * radius * 0.9,
            radius * 0.9,
            Math.sin(lineCurrentAngle) * radius * 0.3
          );
          
          // 只绘制朝向观察者的经线部分
          if (lineTop3D.z > -radius * 0.3 || lineBottom3D.z > -radius * 0.3) {
            ctx.beginPath();
            ctx.moveTo(x + lineTop3D.x * 0.8, y + lineTop3D.y);
            ctx.quadraticCurveTo(
              x + lineTop3D.x * 0.6, 
              y, 
              x + lineBottom3D.x * 0.8, 
              y + lineBottom3D.y
            );
            ctx.strokeStyle = 'rgba(255, 255, 255, 0.25)';
            ctx.lineWidth = 1;
            ctx.globalAlpha = opacity * 0.35;
            ctx.stroke();
          }
        }

        // 步骤3: 极地冰盖（简化）
        const polarCapHeight = radius * 0.2;
        const polarRand = (offset: number) => rand(500 + offset, 0, 1);
        
        // 北极
        const northGrad = ctx.createRadialGradient(x, y - radius * 0.88, 0, x, y - radius * 0.88, radius * 0.5);
        northGrad.addColorStop(0, 'rgba(255, 255, 255, 0.7)');
        northGrad.addColorStop(0.5, 'rgba(220, 235, 250, 0.5)');
        northGrad.addColorStop(1, 'rgba(180, 200, 225, 0.2)');
        ctx.beginPath();
        ctx.ellipse(x, y - radius * 0.88, radius * 0.5, polarCapHeight, 0, 0, Math.PI * 2);
        ctx.fillStyle = northGrad;
        ctx.globalAlpha = opacity;
        ctx.fill();
        
        // 南极
        const southGrad = ctx.createRadialGradient(x, y + radius * 0.88, 0, x, y + radius * 0.88, radius * 0.45);
        southGrad.addColorStop(0, 'rgba(255, 255, 255, 0.65)');
        southGrad.addColorStop(0.5, 'rgba(210, 230, 250, 0.45)');
        southGrad.addColorStop(1, 'rgba(170, 195, 225, 0.15)');
        ctx.beginPath();
        ctx.ellipse(x, y + radius * 0.88, radius * 0.45, polarCapHeight * 0.85, 0, 0, Math.PI * 2);
        ctx.fillStyle = southGrad;
        ctx.globalAlpha = opacity * 0.85;
        ctx.fill();

        // 步骤4: 晨昏线阴影（背光面）
        ctx.save();
        ctx.beginPath();
        ctx.arc(x, y, radius, 0, Math.PI * 2);
        const nightGradient = ctx.createLinearGradient(x - radius, y, x + radius, y);
        nightGradient.addColorStop(0, 'rgba(0, 0, 0, 0)');
        nightGradient.addColorStop(0.35, 'rgba(0, 0, 0, 0)');
        nightGradient.addColorStop(0.5, 'rgba(0, 0, 0, 0.08)');
        nightGradient.addColorStop(0.65, 'rgba(0, 0, 0, 0.25)');
        nightGradient.addColorStop(0.8, 'rgba(0, 0, 0, 0.45)');
        nightGradient.addColorStop(1, 'rgba(0, 0, 0, 0.6)');
        ctx.fillStyle = nightGradient;
        ctx.globalAlpha = opacity;
        ctx.fill();
        ctx.restore();

        // 步骤5: 大气辉光（边缘发光）- 这是行星最标志的效果
        ctx.save();
        // 外层大气辉光
        const outerAtmos = ctx.createRadialGradient(x, y, radius, x, y, radius * 1.25);
        outerAtmos.addColorStop(0, 'rgba(130, 180, 255, 0)');
        outerAtmos.addColorStop(0.5, 'rgba(130, 180, 255, 0.08)');
        outerAtmos.addColorStop(0.8, 'rgba(150, 195, 255, 0.18)');
        outerAtmos.addColorStop(1, 'rgba(180, 215, 255, 0.28)');
        ctx.beginPath();
        ctx.arc(x, y, radius * 1.25, 0, Math.PI * 2);
        ctx.fillStyle = outerAtmos;
        ctx.globalAlpha = opacity;
        ctx.fill();

        // 内层大气辉光（更亮）
        const innerAtmos = ctx.createRadialGradient(x, y, radius * 0.9, x, y, radius * 1.08);
        innerAtmos.addColorStop(0, 'rgba(180, 210, 255, 0)');
        innerAtmos.addColorStop(0.4, 'rgba(180, 210, 255, 0.12)');
        innerAtmos.addColorStop(1, 'rgba(200, 225, 255, 0.22)');
        ctx.beginPath();
        ctx.arc(x, y, radius * 1.08, 0, Math.PI * 2);
        ctx.fillStyle = innerAtmos;
        ctx.globalAlpha = opacity * 0.9;
        ctx.fill();
        ctx.restore();

        // 步骤6: 向光面微弱高光
        const sunlit = ctx.createRadialGradient(
          x - radius * 0.4, y - radius * 0.4, 0,
          x - radius * 0.2, y - radius * 0.2, radius * 0.8
        );
        sunlit.addColorStop(0, 'rgba(255, 255, 255, 0.2)');
        sunlit.addColorStop(0.5, 'rgba(255, 255, 255, 0.06)');
        sunlit.addColorStop(1, 'rgba(255, 255, 255, 0)');
        ctx.beginPath();
        ctx.arc(x, y, radius, 0, Math.PI * 2);
        ctx.fillStyle = sunlit;
        ctx.globalAlpha = opacity * 0.7;
        ctx.fill();
      } else if (enable3D) {
        // Google Earth 风格的 3D 渐变效果（调亮）
        // 创建多层渐变实现更真实的 3D 效果
        const gradient = ctx.createRadialGradient(
          x - radius * 0.35, y - radius * 0.35, radius * 0.05,
          x, y, radius * 1.1
        );
        gradient.addColorStop(0, 'rgba(255, 255, 255, 0.45)');
        gradient.addColorStop(0.15, 'rgba(255, 255, 255, 0.2)');
        gradient.addColorStop(0.3, color);
        gradient.addColorStop(0.7, color);
        gradient.addColorStop(0.85, adjustBrightness(color, -8));
        gradient.addColorStop(1, adjustBrightness(color, -25));

        ctx.beginPath();
        ctx.arc(x, y, radius, 0, Math.PI * 2);
        ctx.fillStyle = gradient;
        ctx.globalAlpha = opacity;
        ctx.fill();

        // 添加边缘高光（调亮）
        const edgeGradient = ctx.createLinearGradient(
          x - radius, y - radius,
          x + radius, y + radius
        );
        edgeGradient.addColorStop(0, 'rgba(255, 255, 255, 0.15)');
        edgeGradient.addColorStop(0.4, 'rgba(255, 255, 255, 0)');
        edgeGradient.addColorStop(1, 'rgba(0, 0, 0, 0.12)');
        
        ctx.beginPath();
        ctx.arc(x, y, radius, 0, Math.PI * 2);
        ctx.fillStyle = edgeGradient;
        ctx.globalAlpha = opacity;
        ctx.fill();
        ctx.globalAlpha = 1;

        // 绘制球体轮廓（调亮）
        ctx.beginPath();
        ctx.arc(x, y, radius, 0, Math.PI * 2);
        ctx.strokeStyle = adjustBrightness(color, -20);
        ctx.lineWidth = 1;
        ctx.globalAlpha = opacity * 0.5;
        ctx.stroke();
        ctx.globalAlpha = 1;
      } else {
        // 纯色填充（无3D效果）
        ctx.beginPath();
        ctx.arc(x, y, radius, 0, Math.PI * 2);
        ctx.fillStyle = color;
        ctx.globalAlpha = opacity;
        ctx.fill();
        ctx.globalAlpha = 1;
      }

      // 恢复上下文状态
      ctx.restore();
    };

    // 优化：创建学院轨道的角度缓存
    const orbitSteps = 315;
    const orbitAngleCache = createAngleCache(orbitSteps);

    // 初始化光点队列（只执行一次）
    if (!lightParticlesInitializedRef.current) {
      lightParticlesInitializedRef.current = true;
      lightParticlesRef.current.push({
        progress: 1 / rings,
        color: getRandomLightColor(),
        createdAt: animationTimeRef.current
      });
      lastLightCreateTimeRef.current = animationTimeRef.current;
    }

    const animate = () => {
      ctx.clearRect(0, 0, canvas.width, canvas.height);
      animationTimeRef.current += 0.016;

      if (currentView === 'spiral') {
        if (!isDraggingRef.current && !isTouchDraggingRef.current && !isTouchingNodeRef.current && !isHoveringSpiralRef.current) {
          rotationRef.current += 0.002;
        }

        // 投影节点
        const projectedNodes = spiralNodes.map(node => {
          const proj = project3D(node.localX, node.localY, node.localZ, 0, rotationRef.current, centerX, centerY);
          return { ...node, x: proj.x, y: proj.y, scale: proj.scale, z: proj.z };
        });

        // 绘制连接线（带灯带效果）
        ctx.beginPath();
        const pathPoints: PathPoint[] = [];
        const startProgress = -0.5 / rings;
        const endProgress = 1 + 0.5 / rings;
        const totalProgress = endProgress - startProgress;
        const totalDrawYears = totalYears * totalProgress;
        for (let i = 0; i <= totalDrawYears; i += 0.2) {
          const progress = startProgress + (i / totalDrawYears) * totalProgress;
          const angle = progress * rings * Math.PI * 2;
          const proj = project3D(
            Math.cos(angle) * baseRadius,
            (1 - progress) * spiralHeight - spiralHeight / 2,
            Math.sin(angle) * baseRadius, 0, rotationRef.current, centerX, centerY
          );
          pathPoints.push({ ...proj, progress });
        }

        // 绘制基础线条
        for (let i = 1; i < pathPoints.length; i++) {
          const avgZ = (pathPoints[i - 1].z + pathPoints[i].z) / 2;
          const lineOpacity = Math.max(0.15, Math.min(0.5, (1 - avgZ / 600) * 0.5));

          ctx.beginPath();
          ctx.strokeStyle = `rgba(96, 165, 250, ${lineOpacity})`;
          ctx.lineWidth = 2.5 * Math.min(pathPoints[i - 1].scale, pathPoints[i].scale);
          ctx.moveTo(pathPoints[i - 1].x, pathPoints[i - 1].y);
          ctx.lineTo(pathPoints[i].x, pathPoints[i].y);
          ctx.stroke();
        }

        // 绘制灯带效果（流动的光点）
        const time = animationTimeRef.current;

        // 计算螺旋线末端的飞出方向（切线方向）
        const lastPointIndex = pathPoints.length - 1;
        const secondLastPointIndex = pathPoints.length - 2;
        let flyOutDirX = 0, flyOutDirY = 0;

        if (lastPointIndex > 0 && secondLastPointIndex >= 0) {
          const lastPoint = pathPoints[lastPointIndex];
          const secondLastPoint = pathPoints[secondLastPointIndex];
          const flyOutX = lastPoint.x - secondLastPoint.x;
          const flyOutY = lastPoint.y - secondLastPoint.y;
          const flyOutLength = Math.sqrt(flyOutX * flyOutX + flyOutY * flyOutY);
          if (flyOutLength > 0) {
            flyOutDirX = flyOutX / flyOutLength;
            flyOutDirY = flyOutY / flyOutLength;
          }
        }

        // 定期产生新的光点（限制最多6个）
        if (time - lastLightCreateTimeRef.current > LIGHT_CREATE_INTERVAL && lightParticlesRef.current.length < 6) {
          lastLightCreateTimeRef.current = time;
          lightParticlesRef.current.push({
            progress: 0,
            color: getRandomLightColor(),
            createdAt: time
          });
        }

        // 更新和绘制光点
        const lightSpeed = 0.0005;
        lightParticlesRef.current = lightParticlesRef.current.filter(particle => {
          particle.progress += lightSpeed;

          if (particle.progress >= 2) {
            return false;
          }
          let x: number | undefined, y: number | undefined, z: number | undefined, scale: number = 1, lightOpacity: number = 1;
          let isFlyingOut = false;
          const colorRGB = particle.color;

          if (particle.progress < 1) {
            const segmentProgress = particle.progress;
            const lightPointIndex = Math.floor(segmentProgress * pathPoints.length);
            const nextLightPointIndex = (lightPointIndex + 1) % pathPoints.length;

            if (lightPointIndex < pathPoints.length && nextLightPointIndex < pathPoints.length) {
              const p1 = pathPoints[lightPointIndex];
              const p2 = pathPoints[nextLightPointIndex];

              x = p1.x + (p2.x - p1.x) * segmentProgress;
              y = p1.y + (p2.y - p1.y) * segmentProgress;
              z = p1.z + (p2.z - p1.z) * segmentProgress;
              scale = p1.scale + (p2.scale - p1.scale) * segmentProgress;
              lightOpacity = Math.max(0.6, Math.min(1, (1 - z / 600)));
            }
          } else {
            isFlyingOut = true;
            const flyOutProgress = particle.progress - 1;

            if (flyOutProgress < 0.8) {
              const flyOutDistance = flyOutProgress * 600;
              const lastP = pathPoints[lastPointIndex];

              if (!particle.flyOutStart) {
                particle.flyOutStart = {
                  x: lastP.x,
                  y: lastP.y,
                  z: lastP.z,
                  scale: lastP.scale,
                  dirX: flyOutDirX,
                  dirY: flyOutDirY,
                  opacity: 1.0
                };
              }

              // 使用固定的起始位置计算当前位置
              const startPos = particle.flyOutStart;
              x = startPos.x + startPos.dirX * flyOutDistance;
              y = startPos.y + startPos.dirY * flyOutDistance - flyOutDistance * 0.4;
              z = startPos.z + flyOutDistance * 0.6;
              scale = startPos.scale * (1 - flyOutProgress * 0.4);

              lightOpacity = Math.max(0, 1 - flyOutProgress * 1.25);

              // 绘制飞出时的彗星拖尾效果
              const flyTailSteps = 8;
              const flyTailLength = 80;
              for (let t = 0; t < flyTailSteps; t++) {
                const tailProgress = t / flyTailSteps;
                const tailX = x - startPos.dirX * tailProgress * flyTailLength;
                const tailY = y - (startPos.dirY - 0.4) * tailProgress * flyTailLength;
                const tailZ = z - 0.6 * tailProgress * flyTailLength;
                const tailOpacity = startPos.opacity * (1 - tailProgress) * 0.6;
                const tailRadius = (10 - tailProgress * 7) * startPos.scale;

                const tailGradient = ctx.createRadialGradient(tailX, tailY, 0, tailX, tailY, tailRadius);
                tailGradient.addColorStop(0, `rgba(${colorRGB}, ${tailOpacity * 0.8})`);
                tailGradient.addColorStop(1, `rgba(${colorRGB}, 0)`);

                ctx.beginPath();
                ctx.arc(tailX, tailY, tailRadius, 0, Math.PI * 2);
                ctx.fillStyle = tailGradient;
                ctx.fill();
              }
            } else {
              return false;
            }
          }

          if (x === undefined || y === undefined) {
            return true;
          }

          // 绘制光点发光效果（增加大小和亮度，让光点更醒目）
          if (x !== undefined && y !== undefined) {
            const glowRadius = isFlyingOut ? 9 * scale : 12 * scale; // 增加外圈半径
            const midRadius = isFlyingOut ? 4.5 * scale : 6 * scale; // 增加中圈半径
            const coreRadius = isFlyingOut ? 2 * scale : 3 * scale; // 增加核心半径

            const lightGlowGradient = ctx.createRadialGradient(x, y, 0, x, y, glowRadius);
            lightGlowGradient.addColorStop(0, `rgba(255, 255, 255, ${lightOpacity * 1.0})`);
            lightGlowGradient.addColorStop(0.15, `rgba(${colorRGB}, ${lightOpacity * 0.9})`);
            lightGlowGradient.addColorStop(0.4, `rgba(${colorRGB}, ${lightOpacity * 0.6})`);
            lightGlowGradient.addColorStop(1, `rgba(${colorRGB}, 0)`);

            ctx.beginPath();
            ctx.arc(x, y, glowRadius, 0, Math.PI * 2);
            ctx.fillStyle = lightGlowGradient;
            ctx.fill();

            const midGlowGradient = ctx.createRadialGradient(x, y, 0, x, y, midRadius);
            midGlowGradient.addColorStop(0, `rgba(255, 255, 255, ${lightOpacity * 1.0})`);
            midGlowGradient.addColorStop(0.3, `rgba(${colorRGB}, ${lightOpacity * 1.0})`);
            midGlowGradient.addColorStop(0.7, `rgba(${colorRGB}, ${lightOpacity * 0.8})`);
            midGlowGradient.addColorStop(1, `rgba(${colorRGB}, ${lightOpacity * 0.5})`);

            ctx.beginPath();
            ctx.arc(x, y, midRadius, 0, Math.PI * 2);
            ctx.fillStyle = midGlowGradient;
            ctx.fill();

            const coreGradient = ctx.createRadialGradient(x, y, 0, x, y, coreRadius);
            coreGradient.addColorStop(0, `rgba(255, 255, 255, ${lightOpacity * 1.0})`);
            coreGradient.addColorStop(0.2, `rgba(${colorRGB}, ${lightOpacity * 1.0})`);
            coreGradient.addColorStop(0.5, `rgba(${colorRGB}, ${lightOpacity * 0.95})`);
            coreGradient.addColorStop(1, `rgba(${colorRGB}, ${lightOpacity * 0.9})`);

            ctx.beginPath();
            ctx.arc(x, y, coreRadius, 0, Math.PI * 2);
            ctx.fillStyle = coreGradient;
            ctx.fill();
          }

          return true;
        });

        // 绘制用户发送的光球
        userLightBallsRef.current = userLightBallsRef.current.filter(ball => {
          ball.progress += lightSpeed * 4;

          if (ball.progress >= 2) {
            return false;
          }
          const projection = spiralProjectionRef.current;
          if (!projection) return false;

          const startProgress = (ball.firstAppearYear - projection.startYear) / (projection.totalYears - 1);
          const colorRGB = ball.color;

          let x: number, y: number, z: number, scale: number;
          let isFlyingOut = ball.progress > 1;
          let opacity = 1;
          let coreRadius = 5;

          if (!isFlyingOut) {
            const actualProgress = startProgress + ball.progress * (1 - startProgress);

            const angle = actualProgress * projection.rings * Math.PI * 2;
            const lx = Math.cos(angle) * projection.baseRadius;
            const ly = (1 - actualProgress) * projection.spiralHeight - projection.spiralHeight / 2;
            const lz = Math.sin(angle) * projection.baseRadius;
            const proj = projection.project3D(lx, ly, lz, 0, rotationRef.current, centerX, centerY);

            x = proj.x;
            y = proj.y;
            z = proj.z;
            scale = proj.scale;
          } else {
            // 沿着螺旋轨道线继续向外飞出
            const flyOutProgress = ball.progress - 1; // 0-0.5 表示沿轨道飞出的程度
            const extraAngle = flyOutProgress * Math.PI * 2; // 继续转一圈
            const flyOutActualProgress = 1 + flyOutProgress * 0.5; // 沿轨道向外延伸
            
            const actualProgress = flyOutActualProgress;
            const angle = actualProgress * projection.rings * Math.PI * 2 + extraAngle;
            const lx = Math.cos(angle) * projection.baseRadius;
            const ly = (1 - actualProgress) * projection.spiralHeight - projection.spiralHeight / 2;
            const lz = Math.sin(angle) * projection.baseRadius;
            const proj = projection.project3D(lx, ly, lz, 0, rotationRef.current, centerX, centerY);
            
            x = proj.x;
            y = proj.y;
            scale = proj.scale * (1 - flyOutProgress * 0.3);
            
            // 绘制拖尾效果（沿轨道线）
            const trailCount = 8;
            for (let t = 1; t <= trailCount; t++) {
              const trailProgress = t / trailCount;
              const trailAngle = angle - trailProgress * 0.5;
              const trailProgress2 = actualProgress - trailProgress * 0.05;
              const tlx = Math.cos(trailAngle) * projection.baseRadius;
              const tly = (1 - trailProgress2) * projection.spiralHeight - projection.spiralHeight / 2;
              const tlz = Math.sin(trailAngle) * projection.baseRadius;
              const trailProj = projection.project3D(tlx, tly, tlz, 0, rotationRef.current, centerX, centerY);
              
              const trailOpacity = opacity * (1 - trailProgress * 0.8);
              const trailRadius = coreRadius * (1 - trailProgress * 0.7);
              
              const trailGradient = ctx.createRadialGradient(trailProj.x, trailProj.y, 0, trailProj.x, trailProj.y, trailRadius);
              trailGradient.addColorStop(0, `rgba(${colorRGB}, ${trailOpacity})`);
              trailGradient.addColorStop(1, `rgba(${colorRGB}, 0)`);
              ctx.beginPath();
              ctx.arc(trailProj.x, trailProj.y, trailRadius, 0, Math.PI * 2);
              ctx.fillStyle = trailGradient;
              ctx.fill();
            }
          }
          opacity = isFlyingOut ? Math.max(0, 1 - (ball.progress - 1) * 2) : 1;
          coreRadius = isFlyingOut ? 3 * scale : 5 * scale;

          const glowRadius = isFlyingOut ? 12 * scale : 18 * scale;
          const midRadius = isFlyingOut ? 6 * scale : 10 * scale;

          const lightGlowGradient = ctx.createRadialGradient(x, y, 0, x, y, glowRadius);
          lightGlowGradient.addColorStop(0, `rgba(255, 255, 255, ${opacity})`);
          lightGlowGradient.addColorStop(0.15, `rgba(${colorRGB}, ${opacity * 0.95})`);
          lightGlowGradient.addColorStop(0.4, `rgba(${colorRGB}, ${opacity * 0.7})`);
          lightGlowGradient.addColorStop(1, `rgba(${colorRGB}, 0)`);
          ctx.beginPath();
          ctx.arc(x, y, glowRadius, 0, Math.PI * 2);
          ctx.fillStyle = lightGlowGradient;
          ctx.fill();

          // 中层光晕
          const midGlowGradient = ctx.createRadialGradient(x, y, 0, x, y, midRadius);
          midGlowGradient.addColorStop(0, `rgba(255, 255, 255, ${opacity})`);
          midGlowGradient.addColorStop(0.3, `rgba(${colorRGB}, ${opacity})`);
          midGlowGradient.addColorStop(0.7, `rgba(${colorRGB}, ${opacity * 0.85})`);
          midGlowGradient.addColorStop(1, `rgba(${colorRGB}, ${opacity * 0.6})`);
          ctx.beginPath();
          ctx.arc(x, y, midRadius, 0, Math.PI * 2);
          ctx.fillStyle = midGlowGradient;
          ctx.fill();

          // 核心光球
          const coreGradient = ctx.createRadialGradient(x, y, 0, x, y, coreRadius);
          coreGradient.addColorStop(0, `rgba(255, 255, 255, ${opacity})`);
          coreGradient.addColorStop(0.2, `rgba(${colorRGB}, ${opacity})`);
          coreGradient.addColorStop(0.5, `rgba(${colorRGB}, ${opacity * 0.95})`);
          coreGradient.addColorStop(1, `rgba(${colorRGB}, ${opacity * 0.9})`);
          ctx.beginPath();
          ctx.arc(x, y, coreRadius, 0, Math.PI * 2);
          ctx.fillStyle = coreGradient;
          ctx.fill();

          // 绘制专业名字（在光球附近，飞出时不显示）
          if (!isFlyingOut && opacity > 0.5) {
            ctx.font = `bold ${Math.max(10, 12 * scale)}px sans-serif`;
            ctx.fillStyle = `rgba(255, 255, 255, ${opacity * 0.9})`;
            ctx.textAlign = 'center';
            ctx.textBaseline = 'bottom';
            ctx.fillText(ball.majorName, x, y - glowRadius - 3);
          }

          return true;
        });

        // 触发年份闪烁（当专业光球经过时）
        userLightBallsRef.current.forEach(ball => {
          if (ball.progress < 0.02) { // 开始的前2%进度内闪烁
            const flashIntensity = (0.02 - ball.progress) / 0.02;
            // 找到该年份的节点并绘制闪烁效果
            const flashNode = projectedNodes.find(node => node.year === ball.firstAppearYear);
            if (flashNode) {
              // 在节点位置绘制闪烁光晕
              const flashRadius = flashNode.size * flashNode.scale * (1 + flashIntensity * 0.5);
              const flashGradient = ctx.createRadialGradient(
                flashNode.x, flashNode.y, 0,
                flashNode.x, flashNode.y, flashRadius * 3
              );
              flashGradient.addColorStop(0, `rgba(255, 255, 255, ${flashIntensity * 0.8})`);
              flashGradient.addColorStop(0.3, `rgba(${ball.color}, ${flashIntensity * 0.6})`);
              flashGradient.addColorStop(1, `rgba(${ball.color}, 0)`);
              ctx.beginPath();
              ctx.arc(flashNode.x, flashNode.y, flashRadius * 3, 0, Math.PI * 2);
              ctx.fillStyle = flashGradient;
              ctx.fill();
            }
          }
        });

        // 绘制节点
        const sortedNodes = [...projectedNodes].sort((a, b) => b.z - a.z);

        sortedNodes.forEach(node => {
          const size = node.size * node.scale;
          const opacity = Math.max(0.5, Math.min(1, (1 - node.z / 600)));
          let color: string;
          if (node.specialColor) {
            color = node.specialColor;
          } else {
            // 使用与节点位置计算相同的分母
            const progressDivisor = totalYears - 1; // endYear - startYear = 69
            const hue = 200 + ((node.year - startYear) / progressDivisor) * 60;
            color = `hsl(${hue}, 70%, 60%)`;
          }

          // 所有年度球都发光，显示3D效果（太阳般的均匀渐变）
          const shouldGlow = true;
          
          // 外层柔和光晕
          const outerSunGlow = ctx.createRadialGradient(node.x, node.y, size * 0.4, node.x, node.y, size * 2.2);
          outerSunGlow.addColorStop(0, addAlpha(color, opacity * 0.5));
          outerSunGlow.addColorStop(0.5, addAlpha(color, opacity * 0.25));
          outerSunGlow.addColorStop(1, addAlpha(color, 0));
          ctx.beginPath();
          ctx.arc(node.x, node.y, size * 2.2, 0, Math.PI * 2);
          ctx.fillStyle = outerSunGlow;
          ctx.fill();
          
          // 内层光晕
          const innerSunGlow = ctx.createRadialGradient(node.x, node.y, size * 0.25, node.x, node.y, size * 1.2);
          innerSunGlow.addColorStop(0, addAlpha('#ffffff', opacity * 0.95));
          innerSunGlow.addColorStop(0.2, addAlpha(color, opacity * 0.9));
          innerSunGlow.addColorStop(0.6, addAlpha(color, opacity * 0.75));
          innerSunGlow.addColorStop(1, addAlpha(color, opacity * 0.4));
          ctx.beginPath();
          ctx.arc(node.x, node.y, size * 1.2, 0, Math.PI * 2);
          ctx.fillStyle = innerSunGlow;
          ctx.fill();
          
          // 核心球体（3D渐变）
          const sunCore = ctx.createRadialGradient(node.x - size * 0.3, node.y - size * 0.3, 0, node.x, node.y, size);
          sunCore.addColorStop(0, `rgba(255, 255, 255, ${opacity})`);
          sunCore.addColorStop(0.4, color);
          sunCore.addColorStop(0.8, adjustBrightness(color, -12));
          sunCore.addColorStop(1, adjustBrightness(color, -28));
          ctx.beginPath();
          ctx.arc(node.x, node.y, size, 0, Math.PI * 2);
          ctx.fillStyle = sunCore;
          ctx.fill();

          const keyEvent = keyEvents.find(e => e.year === node.year);
          if (keyEvent) {
            ctx.font = `bold ${8 * node.scale}px sans-serif`;
            ctx.fillStyle = '#fff';
            ctx.textAlign = 'center';
            ctx.textBaseline = 'middle';
            ctx.fillText(node.year.toString(), node.x, node.y);

            ctx.font = `${7 * node.scale}px sans-serif`;
            ctx.fillStyle = `rgba(255,255,255,${opacity * 0.9})`;
            ctx.textAlign = 'left';
            ctx.fillText(keyEvent.label, node.x + size + 4, node.y - 5);
            ctx.font = `${6 * node.scale}px sans-serif`;
            ctx.fillStyle = `rgba(255,255,255,${opacity * 0.65})`;
            ctx.fillText(keyEvent.desc, node.x + size + 4, node.y + 5);
          } else if (node.year % 10 === 0 || hoveredYear === node.year || !node.hasData) {
            const isKeyYear = [1956, 1958, 1965, 1993, 2001, 2017, 2025].includes(node.year);
            const isDecadeYear = node.year % 10 === 0;
            
            if (isKeyYear || isDecadeYear || hoveredYear === node.year) {
              ctx.font = `${9 * node.scale}px sans-serif`;
              ctx.fillStyle = node.hasData 
                ? `rgba(255, 255, 255, ${opacity * 0.8})` 
                : `rgba(180, 180, 180, ${opacity * 0.7})`;
              ctx.textAlign = 'center';
              ctx.fillText(node.year.toString(), node.x, node.y - size - 4);
            }
          }
        });
      } else {
        // 太阳系视图

        // 学院球公转：5秒转一圈（每帧约0.00314）
        if (!isDraggingRef.current && !isHoveringCollegeRef.current && !isTouchDraggingRef.current) {
          solarAutoRotationRef.current += 0.00314;
        }

        // 响应式轨道半径
        const isMobileSolar = canvas.width < 768;
        const isTabletSolar = canvas.width >= 768 && canvas.width < 1024;
        const orbitScaleY = isMobileSolar ? 0.32 : (isTabletSolar ? 0.34 : 0.35);
        const orbitScaleX = isMobileSolar ? 0.28 : (isTabletSolar ? 0.25 : 0.22);

        const orbitRadiusY = Math.min(canvas.width, canvas.height) * orbitScaleY * zoomLevelRef.current;
        const orbitRadiusX = Math.min(canvas.width, canvas.height) * orbitScaleX * zoomLevelRef.current;

        const renderObjects: RenderObject[] = [];

        // 中心太阳（响应式半径，跟随缩放）
        const pulseScale = 1 + Math.sin(animationTimeRef.current * 2) * 0.05;
        const sunRadius = (isMobileSolar ? 12 : (isTabletSolar ? 14 : 14)) * Math.sqrt(zoomLevelRef.current);
        renderObjects.push({
          type: 'sun',
          lx: 0, ly: 0, lz: 0,
          radius: sunRadius * pulseScale,
          color: '#3b82f6'
        });

        // 院系（原所在院系）- Google Earth 风格透视感
        currentDepartmentsRef.current.forEach((dept: DepartmentNode, i: number) => {
          const angle = (i / currentDepartmentsRef.current.length) * Math.PI * 2 - Math.PI / 2 + solarAutoRotationRef.current;
          // Google Earth 风格：椭圆轨道，倾斜视角
          const lx = Math.cos(angle) * orbitRadiusX;
          const ly = Math.sin(angle) * orbitRadiusY;
          // z 值产生上下波动，让学院球在轨道面上有前后位置
          const lz = Math.sin(angle) * orbitRadiusX * 0.4;

          renderObjects.push({
            type: 'department',
            index: i,
            lx, ly, lz,
            radius: (isMobileSolar ? 10 : (isTabletSolar ? 12 : 14)) * Math.sqrt(zoomLevelRef.current),
            color: dept.color,
            name: dept.name,
            collegeName: dept.college,
            planetData: dept.planetData
          });

          // 专业
          if (dept.majors && dept.majors.length > 0) {
            if (majorRotationAnglesRef.current[i] === undefined) {
              majorRotationAnglesRef.current[i] = Math.random() * Math.PI * 2;
            }

            // 专业球围绕学院球旋转，每个学院的专业独立旋转
            majorRotationAnglesRef.current[i] += 0.015 + i * 0.002;

            // 专业球轨道半径（围绕学院球的卫星轨道）
            const majorOrbitRadius = (isMobileSolar ? 28 : (isTabletSolar ? 32 : 36)) * zoomLevelRef.current;
            dept.majors.forEach((major: Major, j: number) => {
              // 每个专业有不同的相位角，围绕学院球均匀分布并持续旋转
              const majorAngle = majorRotationAnglesRef.current[i] + (j / dept.majors.length) * Math.PI * 2;

              // 专业球位置：在学院球位置基础上，加上围绕学院球的轨道偏移
              const mlx = lx + Math.cos(majorAngle) * majorOrbitRadius;
              const mly = ly + Math.sin(majorAngle) * majorOrbitRadius * 0.35; // 椭圆轨道
              const mlz = lz + Math.sin(majorAngle) * majorOrbitRadius * 0.25; // z轴也有轨道深度

              renderObjects.push({
                type: 'major',
                parentIndex: i,
                lx: mlx, ly: mly, lz: mlz,
                radius: (isMobileSolar ? 1.5 : (isTabletSolar ? 1.8 : 2)) * Math.sqrt(zoomLevelRef.current),
                color: dept.color,
                majorData: major,
                collegeName: dept.name,
                angle: majorAngle
              });
            });
          }
        });

        // 投影
        renderObjects.forEach(obj => {
          const proj = project3D(obj.lx, obj.ly, obj.lz, solarRotXRef.current, solarRotYRef.current, centerX, centerY);
          obj.x = proj.x; obj.y = proj.y; obj.scale = proj.scale; obj.z = proj.z;
        });

        renderObjects.sort((a, b) => (b.z || 0) - (a.z || 0));

        // 保存渲染对象到 ref，用于点击检测
        renderObjectsRef.current = renderObjects;

        // 绘制学院轨道线（渐变效果）
        // 外层轨道光晕
        const orbitGlowGradient = ctx.createRadialGradient(
          centerX, centerY, orbitRadiusX * 0.5,
          centerX, centerY, orbitRadiusX * 1.5
        );
        orbitGlowGradient.addColorStop(0, 'rgba(96, 165, 250, 0)');
        orbitGlowGradient.addColorStop(0.7, 'rgba(96, 165, 250, 0.05)');
        orbitGlowGradient.addColorStop(1, 'rgba(96, 165, 250, 0)');
        ctx.beginPath();
        ctx.ellipse(centerX, centerY, orbitRadiusX * 1.3, orbitRadiusY * 1.3, 0, 0, Math.PI * 2);
        ctx.fillStyle = orbitGlowGradient;
        ctx.fill();

        // 主轨道线（渐变）- 带 z 轴投影形成椭圆轨道面
        ctx.beginPath();
        for (let i = 0; i <= orbitSteps; i++) {
          const angleCacheItem = orbitAngleCache[i];
          const orbitAngle = (i / orbitSteps) * Math.PI * 2;
          const lx = angleCacheItem.cos * orbitRadiusX;
          const ly = angleCacheItem.sin * orbitRadiusY;
          // 与学院球一致的 z 值
          const lz = Math.sin(orbitAngle) * orbitRadiusX * 0.4;
          const proj = project3D(lx, ly, lz, solarRotXRef.current, solarRotYRef.current, centerX, centerY);
          if (i === 0) {
            ctx.moveTo(proj.x, proj.y);
          } else {
            ctx.lineTo(proj.x, proj.y);
          }
        }
        ctx.closePath();
        // 创建渐变描边
        const orbitStrokeGradient = ctx.createLinearGradient(
          centerX - orbitRadiusX, centerY,
          centerX + orbitRadiusX, centerY
        );
        orbitStrokeGradient.addColorStop(0, 'rgba(96, 165, 250, 0.15)');
        orbitStrokeGradient.addColorStop(0.3, 'rgba(147, 112, 219, 0.4)');
        orbitStrokeGradient.addColorStop(0.5, 'rgba(96, 165, 250, 0.5)');
        orbitStrokeGradient.addColorStop(0.7, 'rgba(147, 112, 219, 0.4)');
        orbitStrokeGradient.addColorStop(1, 'rgba(96, 165, 250, 0.15)');
        ctx.strokeStyle = orbitStrokeGradient;
        ctx.lineWidth = 3;
        ctx.stroke();

        // 内层轨道光晕 - 带 z 轴投影
        ctx.beginPath();
        for (let i = 0; i <= orbitSteps; i++) {
          const angleCacheItem = orbitAngleCache[i];
          const orbitAngle = (i / orbitSteps) * Math.PI * 2;
          const lx = angleCacheItem.cos * (orbitRadiusX * 0.95);
          const ly = angleCacheItem.sin * (orbitRadiusY * 0.95);
          const lz = Math.sin(orbitAngle) * orbitRadiusX * 0.38;
          const proj = project3D(lx, ly, lz, solarRotXRef.current, solarRotYRef.current, centerX, centerY);
          if (i === 0) {
            ctx.moveTo(proj.x, proj.y);
          } else {
            ctx.lineTo(proj.x, proj.y);
          }
        }
        ctx.closePath();
        ctx.strokeStyle = 'rgba(147, 112, 219, 0.2)';
        ctx.lineWidth = 1;
        ctx.stroke();

        // 绘制专业轨道（精细的虚线轨道）
        currentDepartmentsRef.current.forEach((dept: DepartmentNode, i: number) => {
          if (dept.majors && dept.majors.length > 0) {
            const deptAngle = (i / currentDepartmentsRef.current.length) * Math.PI * 2 - Math.PI / 2 + solarAutoRotationRef.current;
            const dlx = Math.cos(deptAngle) * orbitRadiusX;
            const dly = Math.sin(deptAngle) * orbitRadiusY;
            const majorOrbitRadius = (isMobileSolar ? 28 : (isTabletSolar ? 32 : 36)) * zoomLevelRef.current;
            ctx.beginPath();
            ctx.ellipse(
              centerX + dlx,
              centerY + dly,
              majorOrbitRadius,
              majorOrbitRadius * 0.35,
              0, 0, Math.PI * 2
            );
            ctx.strokeStyle = 'rgba(255, 255, 255, 0.05)';
            ctx.lineWidth = 0.5;
            ctx.setLineDash([2, 4]);
            ctx.stroke();
            ctx.setLineDash([]);
          }
        });

        // 找到高亮专业所属的学院索引
        const highlightedParentIndex = highlightedMajor
          ? renderObjects.find(obj => obj.type === 'major' && obj.majorData?.name === highlightedMajor)?.parentIndex
          : undefined;

        // 绘制球体
        renderObjects.forEach(obj => {
          // 学院球不透明，固定透明度为1
          const opacity = 1;

          // 检查是否匹配搜索关键词
          const searchMatch = searchKeyword.trim() !== '' &&
            ((obj.type === 'department' || obj.type === 'college') &&
             (obj.name || '').toLowerCase().includes(searchKeyword.toLowerCase())) ||
            (obj.type === 'major' &&
             (obj.majorData?.name || '').toLowerCase().includes(searchKeyword.toLowerCase()));

          // 搜索匹配时添加闪闪发光效果
          const shouldGlow = searchMatch ? true :
                             (obj.type === 'major') ? false :
                             (obj.type === 'sun') ? true :
                             false;

          // 检查是否是高亮显示的专业
          const isHighlighted = obj.type === 'major' && obj.majorData?.name === highlightedMajor;
          
          if (obj.type === 'major') {
            const tailLength = 3;
            const glowIntensity = isHighlighted ? (0.6 + Math.sin(animationTimeRef.current * 8) * 0.4) : 0;
            const highlightGlow = isHighlighted;
            const scaledRadius = obj.radius * (obj.scale || 1);
            
            for (let t = tailLength; t >= 0; t--) {
              const trailOpacity = opacity * (1 - t / tailLength) * 0.5;
              const trailRadius = scaledRadius * (1 - t / tailLength);
              drawSphere((obj.x || 0) - t * 2, obj.y || 0, trailRadius, obj.color, trailOpacity, highlightGlow, false);
            }
            
            if (isHighlighted) {
              const outerGlowRadius = scaledRadius * (2.5 + glowIntensity * 1.5);
              drawSphere(obj.x || 0, obj.y || 0, outerGlowRadius, '#FFD700', 0.2 * glowIntensity, true, false);
              const midGlowRadius = scaledRadius * (1.8 + glowIntensity * 0.8);
              drawSphere(obj.x || 0, obj.y || 0, midGlowRadius, '#FFA500', 0.35 * glowIntensity, true, false);
              const innerGlowRadius = scaledRadius * (1.3 + glowIntensity * 0.4);
              drawSphere(obj.x || 0, obj.y || 0, innerGlowRadius, '#FF6600', 0.45 * glowIntensity, true, false);
              drawSphere(obj.x || 0, obj.y || 0, scaledRadius, obj.color, opacity, true, false);
              
              const majorFontSize = isMobileSolar ? 8 : 9;
              const textX = obj.x || 0;
              const textY = (obj.y || 0) + scaledRadius + 14;
              ctx.font = `bold ${majorFontSize * (obj.scale || 1) + 2}px sans-serif`;
              ctx.textAlign = 'center';
              ctx.textBaseline = 'middle';
              const textMetrics = ctx.measureText(obj.majorData?.name || '');
              const textWidth = textMetrics.width;
              const textHeight = majorFontSize * (obj.scale || 1);
              ctx.fillStyle = `rgba(0, 0, 0, ${0.6 * glowIntensity})`;
              ctx.fillRect(textX - textWidth / 2 - 4, textY - textHeight / 2 - 2, textWidth + 8, textHeight + 4);
              ctx.font = `bold ${majorFontSize * (obj.scale || 1)}px sans-serif`;
              ctx.fillStyle = `rgba(255, 255, 255, ${0.9 + glowIntensity * 0.1})`;
              ctx.fillText(obj.majorData?.name || '', textX, textY);
            } else {
              drawSphere(obj.x || 0, obj.y || 0, scaledRadius, obj.color, opacity, false, false);
            }
          } else if (obj.type === 'sun') {
            // Google Earth 太阳效果：均匀的径向渐变，无纹理
            const x = obj.x || 0;
            const y = obj.y || 0;
            const r = obj.radius;
            
            // 最外层大光晕（柔和淡出）
            const outerGlow = ctx.createRadialGradient(x, y, r * 0.8, x, y, r * 3);
            outerGlow.addColorStop(0, `rgba(255, 200, 100, 0.5)`);
            outerGlow.addColorStop(0.4, `rgba(255, 180, 80, 0.25)`);
            outerGlow.addColorStop(0.7, `rgba(255, 150, 50, 0.1)`);
            outerGlow.addColorStop(1, `rgba(255, 120, 30, 0)`);
            ctx.beginPath();
            ctx.arc(x, y, r * 3, 0, Math.PI * 2);
            ctx.fillStyle = outerGlow;
            ctx.fill();
            
            // 中层光晕
            const midGlow = ctx.createRadialGradient(x, y, r * 0.3, x, y, r * 1.8);
            midGlow.addColorStop(0, `rgba(255, 255, 220, 0.9)`);
            midGlow.addColorStop(0.3, `rgba(255, 230, 150, 0.8)`);
            midGlow.addColorStop(0.6, `rgba(255, 200, 100, 0.7)`);
            midGlow.addColorStop(1, `rgba(255, 180, 80, 0.4)`);
            ctx.beginPath();
            ctx.arc(x, y, r * 1.8, 0, Math.PI * 2);
            ctx.fillStyle = midGlow;
            ctx.fill();
            
            // 核心球体（中心白、向外渐变到橙黄色）
            const sunCore = ctx.createRadialGradient(x - r * 0.2, y - r * 0.2, 0, x, y, r);
            sunCore.addColorStop(0, `rgba(255, 255, 255, 1)`);
            sunCore.addColorStop(0.2, `rgba(255, 255, 230, 1)`);
            sunCore.addColorStop(0.5, `rgba(255, 230, 150, 1)`);
            sunCore.addColorStop(0.8, `rgba(255, 200, 100, 1)`);
            sunCore.addColorStop(1, `rgba(255, 180, 80, 1)`);
            ctx.beginPath();
            ctx.arc(x, y, r, 0, Math.PI * 2);
            ctx.fillStyle = sunCore;
            ctx.fill();

            // 在太阳球下方绘制年份（只显示数字，响应式字体）
            const currentYear = selectedYearRef.current;
            if (currentYear) {
              const sunFontSize = isMobileSolar ? 13 : (isTabletSolar ? 14 : 15);
              const scale = obj.scale || 1;
              const yearText = currentYear.toString();
              const textY = y + r + sunFontSize * scale * 0.8; // 字体在球体下方
              
              // 绘制文字阴影（让年份更清晰）
              ctx.font = `bold ${sunFontSize * scale}px "SF Pro Display", "PingFang SC", "Microsoft YaHei", sans-serif`;
              ctx.textAlign = 'center';
              ctx.textBaseline = 'top';
              
              // 文字阴影层
              ctx.fillStyle = 'rgba(0, 0, 0, 0.6)';
              ctx.fillText(yearText, x + 1, textY + 1);
              ctx.fillText(yearText, x - 1, textY - 1);
              ctx.fillText(yearText, x + 1, textY - 1);
              ctx.fillText(yearText, x - 1, textY + 1);
              
              // 文字描边层（更清晰）
              ctx.strokeStyle = 'rgba(0, 0, 0, 0.8)';
              ctx.lineWidth = 2;
              ctx.strokeText(yearText, x, textY);
              
              // 主文字（白色，更清晰）
              ctx.fillStyle = '#FFFFFF';
              ctx.fillText(yearText, x, textY);
            }
          } else if (obj.type === 'college' || obj.type === 'department') {
            // 检查该学院是否包含高亮的专业
            const isCollegeHighlighted = highlightedParentIndex !== undefined && obj.index === highlightedParentIndex;
            const collegeGlowIntensity = isCollegeHighlighted ? (0.5 + Math.sin(animationTimeRef.current * 6) * 0.5) : 0;
            
            // 如果学院被高亮，绘制多层发光效果（发光范围缩小三分之二）
            if (isCollegeHighlighted) {
              const scaledRadius = obj.radius * (obj.scale || 1);
              // 最外层大光晕（缩小到原来的1/3）
              const outerGlowRadius = scaledRadius * (0.8 + collegeGlowIntensity * 0.3);
              drawSphere(obj.x || 0, obj.y || 0, outerGlowRadius, '#FFD700', 0.25 * collegeGlowIntensity, true, false);
              // 中层光晕
              const midGlowRadius = scaledRadius * (0.6 + collegeGlowIntensity * 0.2);
              drawSphere(obj.x || 0, obj.y || 0, midGlowRadius, '#FFA500', 0.35 * collegeGlowIntensity, true, false);
              // 内层光晕
              const innerGlowRadius = scaledRadius * (0.45 + collegeGlowIntensity * 0.15);
              drawSphere(obj.x || 0, obj.y || 0, innerGlowRadius, '#FF8800', 0.45 * collegeGlowIntensity, true, false);
            }
            
            // 绘制学院球大气层光晕效果
            const atmRadius = obj.radius * (obj.scale || 1) * 1.4;
            const atmGradient = ctx.createRadialGradient(
              obj.x || 0, obj.y || 0, obj.radius * (obj.scale || 1) * 0.9,
              obj.x || 0, obj.y || 0, atmRadius
            );
            atmGradient.addColorStop(0, 'rgba(255, 255, 255, 0)');
            atmGradient.addColorStop(0.5, 'rgba(200, 220, 255, 0.15)');
            atmGradient.addColorStop(0.8, 'rgba(150, 180, 255, 0.08)');
            atmGradient.addColorStop(1, 'rgba(100, 150, 255, 0)');
            ctx.beginPath();
            ctx.arc(obj.x || 0, obj.y || 0, atmRadius, 0, Math.PI * 2);
            ctx.fillStyle = atmGradient;
            ctx.globalAlpha = 0.6;
            ctx.fill();
            ctx.globalAlpha = 1;
            
            // 绘制学院球：使用行星数据和旋转角度（带状纹理 + Google Earth 3D 效果）
            // 学院球自转：1秒1圈，自转轴固定（不随公转改变方向）
            // 自转轴保持23.5度倾斜，像地球一样
            const planetRotation = animationTimeRef.current * Math.PI * 2;
            drawSphere(obj.x || 0, obj.y || 0, obj.radius * (obj.scale || 1), obj.color, opacity, shouldGlow || isCollegeHighlighted, true, obj.planetData, planetRotation);

            // 响应式字体大小
            const deptFontSize = isMobileSolar ? 7 : (isTabletSolar ? 7.5 : 8);
            ctx.font = `${deptFontSize * (obj.scale || 1)}px sans-serif`;
            ctx.fillStyle = searchMatch || isCollegeHighlighted ? '#FFD700' : `rgba(255, 255, 255, ${opacity * 0.9})`;
            ctx.textAlign = 'center';
            const displayName = obj.type === 'department' ? obj.name : obj.name?.split('（')[0];
            const textYOffset = obj.radius * (obj.scale || 1) + 10;
            ctx.fillText(displayName || '', obj.x || 0, (obj.y || 0) + textYOffset);
          }
        });

      }

      animationFrameRef.current = requestAnimationFrame(animate);
    };

    animate();

    return () => {
      if (animationFrameRef.current) {
        cancelAnimationFrame(animationFrameRef.current);
      }
    };
  }, [data, currentView, keyEvents, searchKeyword, highlightedMajor]);

  // 鼠标事件处理
  const handleMouseDown = (e: React.MouseEvent) => {
    isDraggingRef.current = true;
    lastMousePosRef.current = { x: e.clientX, y: e.clientY };
  };

  const handleMouseMove = (e: React.MouseEvent) => {
    if (!canvasRef.current || data.length === 0) return;

    const canvas = canvasRef.current;
    const rect = canvas.getBoundingClientRect();
    const x = e.clientX - rect.left;
    const y = e.clientY - rect.top;

    if (isDraggingRef.current) {
      const deltaX = e.clientX - lastMousePosRef.current.x;
      const deltaY = e.clientY - lastMousePosRef.current.y;

      if (currentView === 'spiral') {
        rotationRef.current += deltaX * 0.005;
      } else if (currentView === 'solar') {
        // 太阳系视图
        // 左键拖动（button === 0）：学院球沿着轨道面转动
        // 右键拖动（button === 2）：视角旋转
        if (e.buttons === 1) { // 左键
          solarAutoRotationRef.current += deltaX * 0.01;
        } else if (e.buttons === 2) { // 右键
          // 水平拖拽 → 绕 Y 轴旋转
          solarRotYRef.current += deltaX * 0.005;
          // 垂直拖拽 → 绕 X 轴旋转
          solarRotXRef.current += deltaY * 0.005;
        }
      }
      lastMousePosRef.current = { x: e.clientX, y: e.clientY };
    } else if (currentView === 'spiral') {
      // 检测悬停节点（使用与节点生成相同的 progress 计算）
      // 现在遍历所有年份（包括无数据的年份），使用与节点渲染相同的逻辑
      const projection = spiralProjectionRef.current;
      if (projection) {
        // 获取当前的 centerX 和 centerY（与渲染时一致）
        const hoverCenterX = rect.width / 2;
        const hoverCenterY = rect.height / 2;

        // 使用 progressDivisor = totalYears - 1，与节点生成一致
        const progressDivisor = projection.totalYears - 1;
        
        // 遍历所有年份节点，找到悬停的节点
        let hoveredNode: any = null;
        for (let i = 0; i < allYears.length; i++) {
          const year = allYears[i];
          const progress = progressDivisor > 0 ? (year - projection.startYear) / progressDivisor : 0;
          const angle = progress * projection.rings * Math.PI * 2;
          const lx = Math.cos(angle) * projection.baseRadius;
          const ly = (1 - progress) * projection.spiralHeight - projection.spiralHeight / 2;
          const lz = Math.sin(angle) * projection.baseRadius;
          const proj = projection.project3D(lx, ly, lz, 0, rotationRef.current, hoverCenterX, hoverCenterY);
          const distance = Math.sqrt((x - proj.x) ** 2 + (y - proj.y) ** 2);
          
          if (distance < 20 * proj.scale) {
            // 找到匹配的节点
            const dataItem = data.find(item => item.year === year);
            hoveredNode = {
              year: year,
              majorCount: dataItem?.majorCount || 0,
              departmentCount: dataItem?.departmentCount || 0,
              hasData: dataItem !== undefined
            };
            break;
          }
        }

        if (hoveredNode) {
          isHoveringSpiralRef.current = true;
          const keyEvent = keyEvents.find(e => e.year === hoveredNode.year);
          setHoveredYear(hoveredNode.year);
          setTooltip({
            year: hoveredNode.year,
            count: hoveredNode.majorCount,
            event: hoveredNode.hasData 
              ? (keyEvent ? `${keyEvent.label} · ${keyEvent.desc}` : `${hoveredNode.departmentCount} 个院系 · ${hoveredNode.majorCount} 个专业`)
              : '暂无数据',
            x: e.clientX + 15,
            y: e.clientY + 15,
            visible: true
          });
          // 更新年份统计信息（如果有数据）
          if (hoveredNode.hasData) {
            setYearStats({
              year: hoveredNode.year,
              deptCount: hoveredNode.departmentCount,
              majorCount: hoveredNode.majorCount
            });
          } else {
            setYearStats(null);
          }
        } else {
          isHoveringSpiralRef.current = false;
          setHoveredYear(null);
          setTooltip(prev => ({ ...prev, visible: false }));
          setYearStats(null);
        }
      }
    } else if (currentView === 'solar') {
      // 检测悬停在学院球上
      const renderObjects = renderObjectsRef.current;
      const hoveredDept = renderObjects.find(obj => {
        if (obj.type !== 'department') return false;
        const distance = Math.sqrt((x - (obj.x || 0)) ** 2 + (y - (obj.y || 0)) ** 2);
        return distance < obj.radius * 1.5;
      });

      isHoveringCollegeRef.current = !!hoveredDept;
    }
  };

  const handleMouseUp = () => {
    isDraggingRef.current = false;
    isHoveringSpiralRef.current = false;
  };

  // 鼠标离开 canvas 时的处理
  const handleCanvasMouseLeave = () => {
    isDraggingRef.current = false;
    isHoveringSpiralRef.current = false;
    setHoveredYear(null);
    setTooltip(prev => ({ ...prev, visible: false }));
    setYearStats(null);
  };

  const handleClick = (e: React.MouseEvent) => {
    if (!canvasRef.current || allYears.length === 0) return;

    const canvas = canvasRef.current;
    const rect = canvas.getBoundingClientRect();
    const x = e.clientX - rect.left;
    const y = e.clientY - rect.top;

    // 检测点击节点
    if (currentView === 'spiral') {
      const projection = spiralProjectionRef.current;
      if (!projection || !canvasRef.current) return;

      // 获取当前的 centerX 和 centerY（与渲染时一致）
      const canvasRect = canvasRef.current.getBoundingClientRect();
      const clickCenterX = canvasRect.width / 2;
      const clickCenterY = canvasRect.height / 2;

      // 使用与节点生成相同的 progress 计算
      const progressDivisor = projection.totalYears - 1;
      
      // 遍历所有年份节点，找到点击的节点
      let clickedYear: number | null = null;
      
      for (let i = 0; i < allYears.length; i++) {
        const year = allYears[i];
        const progress = progressDivisor > 0 ? (year - projection.startYear) / progressDivisor : 0;
        const angle = progress * projection.rings * Math.PI * 2;
        const lx = Math.cos(angle) * projection.baseRadius;
        const ly = (1 - progress) * projection.spiralHeight - projection.spiralHeight / 2;
        const lz = Math.sin(angle) * projection.baseRadius;
        const proj = projection.project3D(lx, ly, lz, 0, rotationRef.current, clickCenterX, clickCenterY);
        
        // 使用与渲染一致的球体大小计算阈值
        const nodeSize = 8;
        const renderRadius = nodeSize * proj.scale;
        const clickThreshold = Math.max(renderRadius * 1.5, 20);
        
        const distance = Math.sqrt((x - proj.x) ** 2 + (y - proj.y) ** 2);
        
        if (distance < clickThreshold) {
          // 找到匹配的节点
          clickedYear = year;
          console.log('clicked year:', year);
          break;
        }
      }

      if (clickedYear !== null) {
        // 单击年份球，显示年份菜单
        selectedYearRef.current = clickedYear;
        setSelectedYear(clickedYear);
        setYearMenuPosition({ x: e.clientX, y: e.clientY });
        setShowYearMenu(true);
      } else {
        // 单击空白区域，关闭菜单
        setShowYearMenu(false);
      }
    }
  };

  const handleDoubleClick = (e: React.MouseEvent) => {
    if (!canvasRef.current) return;

    const canvas = canvasRef.current;
    const rect = canvas.getBoundingClientRect();
    const x = e.clientX - rect.left;
    const y = e.clientY - rect.top;

    if (currentView === 'spiral') {
      // 双击年份节点进入太阳系视图（如果有选中的年份）
      if (selectedYear !== null) {
        const dataItem = data.find(item => item.year === selectedYear);
        if (dataItem) {
          // 设置学院球初始旋转角度，与螺旋塔的当前旋转角度保持一致
          solarAutoRotationRef.current = rotationRef.current;
          setCurrentView('solar');
          // 更新年份统计信息
          setYearStats({
            year: selectedYear,
            deptCount: dataItem.departmentCount,
            majorCount: dataItem.majorCount
          });
        }
      }
    } else if (currentView === 'solar') {
      // 检测点击学院或专业球
      const renderObjects = renderObjectsRef.current;
      let clickedObject: RenderObject | null = null;

      // 检测点击学院
      const clickedDept = renderObjects.find(obj => {
        if (obj.type !== 'department') return false;
        const distance = Math.sqrt((x - (obj.x || 0)) ** 2 + (y - (obj.y || 0)) ** 2);
        return distance < obj.radius * 1.5; // 增加点击范围
      });

      if (clickedDept) {
        clickedObject = clickedDept;
      } else {
        // 检测点击专业
        const clickedMajor = renderObjects.find(obj => {
          if (obj.type !== 'major') return false;
          const distance = Math.sqrt((x - (obj.x || 0)) ** 2 + (y - (obj.y || 0)) ** 2);
          return distance < obj.radius * 2; // 专业球较小，增加点击范围
        });

        if (clickedMajor) {
          clickedObject = clickedMajor;
        }
      }

      if (clickedObject) {
        if (clickedObject.type === 'department' && clickedObject.name) {
          // 双击学院，显示该学院的所有专业
          const deptNode = currentDepartmentsRef.current.find(d => d.name === clickedObject.name);
          if (deptNode && deptNode.majors.length > 0) {
            setSelectedCollege({
              name: clickedObject.name,
              color: clickedObject.color,
              majors: deptNode.majors
            });
          }
        } else if (clickedObject.type === 'major' && clickedObject.majorData) {
          // 双击专业，显示专业详细信息
          setSelectedMajor(clickedObject.majorData);
        }
      } else {
        // 双击空白区域，清除选中状态并返回螺旋塔视图
        setSelectedCollege(null);
        setSelectedMajor(null);
        selectedYearRef.current = null;
        setSelectedYear(null);
        setYearStats(null);
        setCurrentView('spiral');
      }
    }
  };

  const zoomIn = () => {
    zoomLevelRef.current = Math.min(zoomLevelRef.current * 1.2, 2);
  };

  const zoomOut = () => {
    zoomLevelRef.current = Math.max(zoomLevelRef.current / 1.2, 0.5);
  };

  const resetView = () => {
    solarRotXRef.current = 0.5;
    solarRotYRef.current = 0;
    zoomLevelRef.current = 1;
  };

  // 鼠标滚轮缩放（只在太阳系视图中生效）
  const handleWheel = (e: React.WheelEvent) => {
    if (currentView === 'solar') {
      e.preventDefault();
      const delta = e.deltaY > 0 ? 0.9 : 1.1;
      zoomLevelRef.current = Math.max(0.5, Math.min(2, zoomLevelRef.current * delta));
    }
  };

  // 触摸事件处理（用于双指缩放和单指拖拽旋转，只在太阳系视图中生效）
  const initialTouchDistanceRef = useRef<number | null>(null);
  const initialZoomRef = useRef<number>(1);
  const isTouchDraggingRef = useRef<boolean>(false);
  const lastTouchPosRef = useRef<{ x: number; y: number } | null>(null);
  const activeTouchCountRef = useRef<number>(0);

  const handleTouchStart = (e: React.TouchEvent) => {
    if (currentView === 'solar') {
      activeTouchCountRef.current = e.touches.length;

      if (e.touches.length === 2) {
        // 双指缩放
        const touch1 = e.touches[0];
        const touch2 = e.touches[1];
        const distance = Math.hypot(
          touch2.clientX - touch1.clientX,
          touch2.clientY - touch1.clientY
        );
        initialTouchDistanceRef.current = distance;
        initialZoomRef.current = zoomLevelRef.current;
        isTouchDraggingRef.current = false;
        lastTouchPosRef.current = null;
      } else if (e.touches.length === 1) {
        // 单指拖拽旋转
        isTouchDraggingRef.current = true;
        lastTouchPosRef.current = { x: e.touches[0].clientX, y: e.touches[0].clientY };
        initialTouchDistanceRef.current = null;
      }
    } else if (currentView === 'spiral') {
      // 螺旋视图：检测是否触摸到球
      if (e.touches.length === 1) {
        const canvas = canvasRef.current;
        if (!canvas) return;

        const rect = canvas.getBoundingClientRect();
        const x = e.touches[0].clientX - rect.left;
        const y = e.touches[0].clientY - rect.top;

        const projection = spiralProjectionRef.current;
        if (!projection) return;

        // 获取当前的 centerX 和 centerY（与渲染时一致）
        const touchCenterX = rect.width / 2;
        const touchCenterY = rect.height / 2;

        // 检测是否触摸到球（遍历所有年份节点）
        let touchedYear: number | null = null;

        // 遍历所有球体，找到触摸范围内的球体（使用与节点生成相同的 progress 计算）
        const progressDivisor = projection.totalYears - 1;
        for (let i = 0; i < allYears.length; i++) {
          const year = allYears[i];
          const progress = progressDivisor > 0 ? (year - projection.startYear) / progressDivisor : 0;
          const angle = progress * projection.rings * Math.PI * 2;
          const lx = Math.cos(angle) * projection.baseRadius;
          const ly = (1 - progress) * projection.spiralHeight - projection.spiralHeight / 2;
          const lz = Math.sin(angle) * projection.baseRadius;
          const proj = projection.project3D(lx, ly, lz, 0, rotationRef.current, touchCenterX, touchCenterY);
          const distance = Math.sqrt((x - proj.x) ** 2 + (y - proj.y) ** 2);

          // 使用与渲染一致的球体大小计算阈值
          const nodeSize = 8;
          const renderRadius = nodeSize * proj.scale;
          const touchThreshold = Math.max(renderRadius * 1.5, 25); // 触摸范围比点击稍大

          if (distance < touchThreshold) {
            // 只记录有数据的年份
            const dataItem = data.find(item => item.year === year);
            if (dataItem) {
              touchedYear = year;
            }
            break;
          }
        }

        isTouchingNodeRef.current = touchedYear !== null;

        // 单指拖拽旋转
        isTouchDraggingRef.current = true;
        lastTouchPosRef.current = { x: e.touches[0].clientX, y: e.touches[0].clientY };
      }
    }
  };

  const handleTouchMove = (e: React.TouchEvent) => {
    if (currentView === 'solar') {
      activeTouchCountRef.current = e.touches.length;

      if (e.touches.length === 2 && initialTouchDistanceRef.current !== null) {
        // 双指缩放
        e.preventDefault();
        const touch1 = e.touches[0];
        const touch2 = e.touches[1];
        const distance = Math.hypot(
          touch2.clientX - touch1.clientX,
          touch2.clientY - touch1.clientY
        );

        // 使用更平滑的缩放比例
        const targetZoom = initialZoomRef.current * (distance / initialTouchDistanceRef.current);
        // 平滑过渡到目标缩放值
        zoomLevelRef.current = Math.max(0.5, Math.min(2, targetZoom));
      } else if (e.touches.length === 1 && isTouchDraggingRef.current && lastTouchPosRef.current) {
        // 单指拖拽旋转
        e.preventDefault();
        const deltaX = e.touches[0].clientX - lastTouchPosRef.current.x;
        const deltaY = e.touches[0].clientY - lastTouchPosRef.current.y;

        // 水平拖拽 → 绕 Y 轴旋转
        solarRotYRef.current += deltaX * 0.005;
        // 垂直拖拽 → 绕 X 轴旋转
        solarRotXRef.current += deltaY * 0.005;

        lastTouchPosRef.current = { x: e.touches[0].clientX, y: e.touches[0].clientY };
      }
    } else if (currentView === 'spiral') {
      // 螺旋视图：单指拖拽旋转
      if (e.touches.length === 1 && isTouchDraggingRef.current && lastTouchPosRef.current) {
        e.preventDefault();
        const deltaX = e.touches[0].clientX - lastTouchPosRef.current.x;
        rotationRef.current += deltaX * 0.005;
        lastTouchPosRef.current = { x: e.touches[0].clientX, y: e.touches[0].clientY };
      }
    }
  };

  const handleTouchEnd = (e: React.TouchEvent) => {
    activeTouchCountRef.current = e.touches.length;

    // 如果还有手指在触摸，更新状态
    if (e.touches.length === 2) {
      // 从双指变为双指（可能是一个手指离开了又快速按下）
      const touch1 = e.touches[0];
      const touch2 = e.touches[1];
      const distance = Math.hypot(
        touch2.clientX - touch1.clientX,
        touch2.clientY - touch1.clientY
      );
      initialTouchDistanceRef.current = distance;
      initialZoomRef.current = zoomLevelRef.current;
      isTouchDraggingRef.current = false;
      lastTouchPosRef.current = null;
    } else if (e.touches.length === 1) {
      // 从双指变为单指
      initialTouchDistanceRef.current = null;
      isTouchDraggingRef.current = true;
      lastTouchPosRef.current = { x: e.touches[0].clientX, y: e.touches[0].clientY };
    } else if (e.touches.length === 0) {
      // 所有手指都离开了
      initialTouchDistanceRef.current = null;
      isTouchDraggingRef.current = false;
      isTouchingNodeRef.current = false;
      lastTouchPosRef.current = null;
    }
  };

  // 自定义滚动条样式
  const scrollbarStyles = `
    @keyframes twinkle {
      0%, 100% { opacity: 0.3; }
      50% { opacity: 1; }
    }
    
    .custom-scrollbar::-webkit-scrollbar {
      width: 4px;
    }
    .custom-scrollbar::-webkit-scrollbar-track {
      background: rgba(255, 255, 255, 0.05);
      border-radius: 2px;
    }
    .custom-scrollbar::-webkit-scrollbar-thumb {
      background: rgba(96, 165, 250, 0.4);
      border-radius: 2px;
    }
    .custom-scrollbar::-webkit-scrollbar-thumb:hover {
      background: rgba(96, 165, 250, 0.6);
    }

    /* 响应式设计 */
    @media (max-width: 768px) {
      .mobile-sm {
        font-size: 10px;
      }
      .mobile-xs {
        font-size: 9px;
      }
      .mobile-btn {
        width: 36px;
        height: 36px;
        font-size: 18px;
      }
      .mobile-modal {
        max-width: calc(100% - 24px);
        max-height: 60vh;
      }
    }

    @media (max-width: 480px) {
      .mobile-sm {
        font-size: 9px;
      }
      .mobile-xs {
        font-size: 8px;
      }
      .mobile-btn {
        width: 32px;
        height: 32px;
        font-size: 16px;
      }
      .mobile-modal {
        max-width: calc(100% - 16px);
        max-height: 70vh;
      }
    }

    @media (min-width: 1024px) {
      .desktop-lg {
        font-size: 18px;
      }
    }
  `;

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-screen bg-black text-white">
        <div className="text-center">
          <div className="text-2xl mb-4">加载中...</div>
        </div>
      </div>
    );
  }

  return (
    <>
      <style dangerouslySetInnerHTML={{ __html: scrollbarStyles }} />
      <div className="relative w-full h-screen overflow-hidden">
        {/* 深空纯色背景 */}
        <div 
          className="absolute inset-0"
          style={{
            background: 'radial-gradient(circle at 50% 50%, #1a1a2e 0%, #0f0f1a 50%, #050510 100%)'
          }}
        />
        {/* 遮罩层 */}
        <div className="absolute inset-0 bg-black/30"></div>
        {/* 校徽背景层 - 填充整个屏幕 */}
        <div 
          className="absolute inset-0 flex items-center justify-center pointer-events-none"
          style={{ opacity: 0.4 }}
        >
          <img 
            src="/college-logo.png" 
            alt="校徽" 
            className="w-full h-full object-contain"
          />
        </div>
      <canvas
        ref={canvasRef}
        className="absolute inset-0 touch-none"
        onMouseDown={handleMouseDown}
        onMouseMove={handleMouseMove}
        onMouseUp={handleMouseUp}
        onMouseLeave={handleCanvasMouseLeave}
        onWheel={handleWheel}
        onTouchStart={handleTouchStart}
        onTouchMove={handleTouchMove}
        onTouchEnd={handleTouchEnd}
        onClick={handleClick}
        onDoubleClick={handleDoubleClick}
        onContextMenu={(e) => e.preventDefault()}
      />

      {/* 标题栏 */}
      <div className="absolute top-0 left-0 right-0 p-2 md:p-3 bg-gradient-to-b from-black to-transparent z-10">
        <h1 className="text-center text-[12px] md:text-[15px] font-semibold text-blue-400 tracking-wider">
          成都理工大学专业沿革星系图
        </h1>
        <p className="text-center text-[9px] md:text-[10px] text-white/50 mt-1">
          1956 - {maxYear} {maxYear - 1956 + 1}年岁月长河
        </p>
        {yearStats && (
          <p className="text-center text-[9px] md:text-[10px] text-blue-300/80 mt-1">
            {yearStats.year}年 · {yearStats.deptCount}个学院 · {yearStats.majorCount}个专业
          </p>
        )}
      </div>

      {/* 缩放控制（只在太阳系视图中显示） */}
      {currentView === 'solar' && (
        <div className="absolute right-3 md:right-4 bottom-28 md:bottom-32 z-20 flex flex-col gap-2">
          {/* 缩放按钮 */}
          <div className="flex flex-col gap-2">
            <button
              onClick={zoomIn}
              className="w-8 h-8 md:w-10 md:h-10 rounded-full bg-blue-400/30 border border-blue-400/50 text-white text-lg md:text-xl flex items-center justify-center hover:bg-blue-400/40 transition-colors"
            >
              +
            </button>
            <button
              onClick={zoomOut}
              className="w-8 h-8 md:w-10 md:h-10 rounded-full bg-blue-400/30 border border-blue-400/50 text-white text-lg md:text-xl flex items-center justify-center hover:bg-blue-400/40 transition-colors"
            >
              −
            </button>
            <button
              onClick={resetView}
              className="w-8 h-8 md:w-10 md:h-10 rounded-full bg-purple-400/30 border border-purple-400/50 text-white text-[10px] md:text-xs flex items-center justify-center hover:bg-purple-400/40 transition-colors"
            >
              ↻
            </button>
          </div>
        </div>
      )}

      {/* 用户发送光球选择框 */}
      <div className="absolute right-3 md:right-4 top-16 md:top-20 z-20">
        <div className="flex flex-col items-end gap-2">
          <div className="relative w-48 md:w-56 major-input-container">
            <input
              type="text"
              value={userSelectedMajor}
              onChange={(e) => {
                setUserSelectedMajor(e.target.value);
                setPopoverOpen(true);
              }}
              onFocus={() => setPopoverOpen(true)}
              placeholder={currentView === 'solar' && selectedYear !== null ? `${selectedYear}年专业...` : '输入专业名称...'}
              className="w-full h-10 bg-black/60 backdrop-blur-sm border border-blue-400/50 text-white text-[12px] md:text-[13px] rounded-lg px-4 py-2.5 text-left hover:bg-black/70 focus:bg-black/70 focus:outline-none focus:border-blue-400/80 transition-colors placeholder-white/40 shadow-lg shadow-blue-500/20"
            />
            {popoverOpen && (
              <div className="absolute top-full right-0 mt-2 w-64 md:w-80 bg-black/90 backdrop-blur-sm border border-blue-400/60 rounded-lg shadow-xl shadow-blue-500/30 overflow-hidden z-50">
                <div className="max-h-80 overflow-y-auto p-1.5">
                  {selectableMajors
                    .filter(major =>
                      major.toLowerCase().includes(userSelectedMajor.toLowerCase())
                    )
                    .length === 0 ? (
                    <div className="text-[12px] text-white/50 py-8 text-center">
                      未找到匹配的专业
                    </div>
                  ) : (
                    selectableMajors
                      .filter(major =>
                        major.toLowerCase().includes(userSelectedMajor.toLowerCase())
                      )
                      .map((major) => (
                        <div
                          key={major}
                          onClick={() => {
                            setUserSelectedMajor(major);
                            setPopoverOpen(false);
                          }}
                          className="text-[12px] md:text-[13px] text-white hover:bg-blue-500/30 cursor-pointer px-4 py-2.5 rounded-md flex items-center"
                        >
                          {major}
                        </div>
                      ))
                  )}
                </div>
              </div>
            )}
          </div>
          <button
            onClick={sendLightBall}
            disabled={!userSelectedMajor}
            className="w-9 h-9 rounded-full bg-blue-500 hover:bg-blue-400 text-white flex items-center justify-center transition-all disabled:opacity-40 disabled:cursor-not-allowed hover:scale-110 active:scale-95 shadow-lg shadow-blue-500/50"
            title="发送光球"
          >
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <path d="M12 19V5M5 12l7-7 7 7"/>
            </svg>
          </button>
        </div>
      </div>

      {/* 提示文字 */}
      <div className="fixed bottom-4 md:bottom-6 left-1/2 -translate-x-1/2 z-10">
        <div className="text-[8px] md:text-[9px] text-white/35 text-center bg-black/30 px-2 md:px-3 py-1 md:py-1.5 rounded-full">
          {(() => {
            const isMobile = typeof window !== 'undefined' && window.innerWidth < 768;

            if (currentView === 'spiral') {
              return isMobile
                ? '单指拖拽旋转 · 单击显示年份 · 双击进入院系'
                : '拖拽旋转 · 单击显示年份 · 双击进入院系';
            } else {
              return isMobile
                ? '单指拖拽旋转 · 双指缩放 · 双击院系查看专业 · 双击空白返回'
                : '左键拖拽旋转学院 · 右键拖拽旋转视角 · 滚轮缩放 · 双击院系查看专业 · 双击空白返回';
            }
          })()}
        </div>
      </div>

      {/* 螺旋视图年份提示框 */}
      {currentView === 'spiral' && tooltip.visible && (
        <div
          className="fixed bg-[rgba(10,15,30,0.92)] border border-blue-400/40 rounded-lg p-2.5 md:p-3 pointer-events-none z-30 shadow-xl"
          style={{
            left: tooltip.x,
            top: tooltip.y,
            minWidth: '120px',
            maxWidth: '160px'
          }}
        >
          <div className="text-[14px] md:text-[16px] font-bold text-blue-400 mb-1">{tooltip.year}年</div>
          <div className="text-[10px] md:text-[11px] text-pink-300 font-medium mb-1">{tooltip.count}个专业</div>
          {tooltip.event && <div className="text-[8px] md:text-[9px] text-white/60 leading-relaxed">{tooltip.event}</div>}
        </div>
      )}

      {/* 学院模态框 */}
      {selectedCollege && (
        <div className="fixed left-1/2 -translate-x-1/2 bottom-4 md:bottom-5 bg-[rgba(8,12,25,0.98)] border border-blue-400/50 rounded-xl p-2.5 md:p-3.5 z-30 w-[calc(100%-16px)] md:w-[calc(100%-32px)] max-w-[340px] md:max-w-[360px] max-h-[55vh] md:max-h-[50vh] overflow-y-auto shadow-2xl shadow-black/50">
          <div className="flex justify-between items-center mb-2 pb-2 md:mb-2.5 md:pb-2.5 border-b border-white/20">
            <div className="text-[13px] md:text-[14px] font-bold flex-1 pr-2 md:pr-2.5 text-white drop-shadow-md">{selectedCollege.name}</div>
            <div className="text-[10px] md:text-[11px] text-blue-300 font-medium">{selectedCollege.majors.length} 个专业</div>
            <button
              onClick={() => setSelectedCollege(null)}
              className="w-5 h-5 md:w-6 md:h-6 rounded-full bg-white/20 hover:bg-white/30 text-white text-base cursor-pointer flex items-center justify-center ml-1.5 md:ml-2.5 transition-colors"
            >
              ×
            </button>
          </div>
          <div className="grid grid-cols-2 gap-1.5 md:gap-2">
            {selectedCollege.majors.map((major, index) => (
              <div
                key={index}
                onClick={() => setSelectedMajor(major)}
                className="p-2 md:p-2.5 bg-white/10 rounded-lg cursor-pointer transition-all border border-white/10 hover:bg-white/20 hover:border-blue-400/50"
              >
                <div className="text-[11px] md:text-[12px] font-medium leading-tight text-white drop-shadow-sm">{major.name}</div>
                <div className="text-[8px] md:text-[9px] text-blue-200/80 mt-1 font-medium">
                  {major.degree}{major.year ? ` · ${major.year}年` : ''}
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* 专业详情弹窗 */}
      {selectedMajor && (
        <div className="fixed left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 bg-[rgba(8,12,25,0.98)] border border-blue-400/50 rounded-xl p-3.5 md:p-5 z-40 w-[calc(100%-24px)] md:w-[calc(100%-40px)] max-w-[300px] md:max-w-[320px] shadow-2xl shadow-black/50">
          <div className="flex justify-between items-center mb-3 pb-2.5 md:mb-3.5 md:pb-3 border-b border-white/20">
            <div
              className="text-[13px] md:text-[15px] font-bold flex-1 text-white drop-shadow-md cursor-pointer hover:text-blue-300 transition-colors"
              onDoubleClick={() => setShowCollegeHistory(!showCollegeHistory)}
              title="双击查看专业沿革历史"
            >
              {selectedMajor.name}
            </div>
            <div className="flex items-center gap-1.5 md:gap-2 ml-2">
              <button
                onClick={() => setShowCollegeHistory(!showCollegeHistory)}
                className={`px-2 py-0.5 rounded text-[10px] md:text-[11px] font-medium transition-colors ${
                  showCollegeHistory
                    ? 'bg-blue-500/50 text-white'
                    : 'bg-white/10 text-white/80 hover:bg-white/20'
                }`}
                title="点击查看专业沿革"
              >
                沿革
              </button>
              <button
                onClick={() => {
                  setSelectedMajor(null);
                  setShowCollegeHistory(false);
                }}
                className="w-5 h-5 md:w-6 md:h-6 rounded-full bg-white/20 hover:bg-white/30 text-white text-base cursor-pointer flex items-center justify-center transition-colors"
              >
                ×
              </button>
            </div>
          </div>

          {!showCollegeHistory ? (
            <>
              <div className="flex justify-between items-center py-2 md:py-2.5 border-b border-white/15">
                <span className="text-blue-300/90 text-[11px] md:text-[12px] font-medium">专业代码</span>
                <span className="text-[11px] md:text-[12px] font-medium text-white drop-shadow-sm">{selectedMajor.code || '-'}</span>
              </div>
              <div className="flex justify-between items-center py-2 md:py-2.5 border-b border-white/15">
                <span className="text-blue-300/90 text-[11px] md:text-[12px] font-medium">学制</span>
                <span className="text-[11px] md:text-[12px] font-medium text-white drop-shadow-sm">{selectedMajor.degree || '-'}</span>
              </div>
              <div className="flex justify-between items-center py-2 md:py-2.5 border-b border-white/15">
                <span className="text-blue-300/90 text-[11px] md:text-[12px] font-medium">所属学院</span>
                <span className="text-[11px] md:text-[12px] font-medium text-white drop-shadow-sm">{selectedMajor.college || '-'}</span>
              </div>
              <div className="flex justify-between items-center py-2 md:py-2.5 border-b border-white/15">
                <span className="text-blue-300/90 text-[11px] md:text-[12px] font-medium">原所属部门</span>
                <span className="text-[11px] md:text-[12px] font-medium text-white drop-shadow-sm">{selectedMajor.original_dept || '-'}</span>
              </div>
              {selectedMajor.year && (
                <div className="flex justify-between items-center py-2 md:py-2.5 border-t border-white/15">
                  <span className="text-blue-300/90 text-[11px] md:text-[12px] font-medium">设立年份</span>
                  <span className="text-[11px] md:text-[12px] font-medium text-white drop-shadow-sm">{selectedMajor.year}</span>
                </div>
              )}
            </>
          ) : (
            <>
              {/* 显示专业沿革历史（箭头状时间线） */}
              <div className="text-[10px] md:text-[11px] text-blue-300/80 mb-2 md:mb-3 text-center">双击标题返回专业详情</div>
              <div className="max-h-[55vh] md:max-h-[60vh] overflow-y-auto pr-1 space-y-0 custom-scrollbar">
                {(() => {
                  const majorName = selectedMajor.name;
                  // 获取该专业的所有历史记录（按年份排序）
                  const majorHistory = rawApiData
                    .filter(item => item.major === majorName)
                    .sort((a, b) => a.year - b.year);

                  // 过滤出有变化的年份
                  const changedHistory = majorHistory.filter((item, index) => {
                    // 第一条记录总是显示（初始设立）
                    if (index === 0) return true;

                    // 比较与前一条记录是否有变化
                    const prevItem = majorHistory[index - 1];
                    const hasChanges =
                      item.department !== prevItem.department ||
                      item.description !== prevItem.description ||
                      item.category !== prevItem.category ||
                      item.level !== prevItem.level;

                    return hasChanges;
                  });

                  return changedHistory.length > 0 ? (
                    changedHistory.map((item, index) => (
                      <div key={item.id} className="relative flex items-start">
                        {/* 箭头线 */}
                        {index < changedHistory.length - 1 && (
                          <div className="absolute left-2.5 md:left-3 top-5 md:top-6 w-[2px] h-full bg-gradient-to-b from-blue-400/60 to-blue-400/20"></div>
                        )}
                        {/* 节点圆点 */}
                        <div className="relative z-10 flex-shrink-0 w-5 h-5 md:w-6 md:h-6 rounded-full bg-blue-500/30 border-2 border-blue-400 flex items-center justify-center">
                          <div className="w-1.5 h-1.5 md:w-2 md:h-2 rounded-full bg-blue-400"></div>
                        </div>
                        {/* 内容卡片 */}
                        <div className="ml-2.5 md:ml-3 mb-2 md:mb-3 flex-1">
                          <div className="bg-white/5 rounded-lg p-1.5 md:p-2 border border-white/10 hover:border-blue-400/30 transition-colors">
                            <div className="flex justify-between items-center">
                              <span className="text-[12px] md:text-[13px] font-bold text-blue-300">{item.year}年</span>
                              <span className="text-[10px] md:text-[11px] text-blue-200/80">{item.department}</span>
                            </div>
                          </div>
                        </div>
                      </div>
                    ))
                  ) : (
                    <div className="text-center text-[11px] md:text-[12px] text-white/60 py-3 md:py-4">暂无历史数据</div>
                  );
                })()}
              </div>
            </>
          )}
        </div>
      )}

      {/* 底部年份时间轴控件 */}
      {currentView === 'solar' && (
        <div className="fixed bottom-4 md:bottom-5 left-1/2 -translate-x-1/2 z-10 flex flex-col items-center gap-2">
          {/* 年份显示 */}
          <div className="bg-black/60 backdrop-blur-sm border border-blue-400/40 rounded-lg px-4 py-1.5">
            <span className="text-white text-sm font-medium">{selectedYear || 1956}年</span>
          </div>
          
          {/* 时间轴滑块 */}
          <div className="relative w-64 md:w-80 h-8 flex items-center">
            {/* 轨道背景 */}
            <div className="absolute left-0 right-0 h-1 bg-gradient-to-r from-blue-500/30 via-purple-500/30 to-blue-500/30 rounded-full" />
            
            {/* 已走过部分 */}
            <div 
              className="absolute left-0 h-1 bg-gradient-to-r from-blue-500 via-purple-500 to-blue-400 rounded-full"
              style={{ width: `${((selectedYear || 1956) - 1956) / (2025 - 1956) * 100}%` }}
            />
            
            {/* 可拖拽滑块 */}
            <input
              type="range"
              min="1956"
              max="2025"
              value={selectedYear || 1956}
              onInput={(e) => {
                const val = parseInt((e.target as HTMLInputElement).value);
                selectedYearRef.current = val;
                setSelectedYear(val);
              }}
              onChange={(e) => setSelectedYear(parseInt(e.target.value))}
              className="absolute w-full h-8 appearance-none bg-transparent cursor-pointer z-10
                [&::-webkit-slider-thumb]:appearance-none
                [&::-webkit-slider-thumb]:w-4
                [&::-webkit-slider-thumb]:h-4
                [&::-webkit-slider-thumb]:rounded-full
                [&::-webkit-slider-thumb]:bg-white
                [&::-webkit-slider-thumb]:shadow-lg
                [&::-webkit-slider-thumb]:shadow-blue-500/50
                [&::-webkit-slider-thumb]:cursor-grab
                [&::-webkit-slider-thumb]:active:cursor-grabbing
                [&::-webkit-slider-thumb]:border-2
                [&::-webkit-slider-thumb]:border-blue-400"
            />
            
            {/* 年份刻度 */}
            <div className="absolute -bottom-4 left-0 right-0 flex justify-between text-[9px] text-white/40">
              <span>1956</span>
              <span>1970</span>
              <span>1990</span>
              <span>2010</span>
              <span>2025</span>
            </div>
          </div>
          
          {/* 返回按钮 */}
          <button
            onClick={() => {
              setCurrentView('spiral');
              setYearStats(null);
              selectedYearRef.current = null;
              setSelectedYear(null);
            }}
            className="bg-blue-400/25 border border-blue-400/50 text-white px-4 py-1.5 rounded-full text-[11px] md:text-[12px] cursor-pointer active:scale-95 transition-transform"
          >
            返回螺旋塔
          </button>
        </div>
      )}

      {/* 年份点击菜单（大白兔菜单） */}
      {showYearMenu && selectedYear !== null && (
        <>
          {/* 遮罩层 */}
          <div 
            className="fixed inset-0 z-30"
            onClick={() => setShowYearMenu(false)}
          />
          {/* 菜单 */}
          <div 
            className="fixed z-40 bg-black/95 border border-blue-400/60 rounded-xl shadow-2xl shadow-blue-500/40 overflow-hidden"
            style={{ 
              left: Math.min(yearMenuPosition.x, window.innerWidth - 160),
              top: Math.min(yearMenuPosition.y, window.innerHeight - 100),
              minWidth: '120px'
            }}
          >
            <div className="p-2">
              <div className="text-[11px] text-blue-400/80 px-3 py-1 border-b border-blue-400/30">
                {selectedYear}年
              </div>
              <button
                onClick={() => {
                  // 查看大事记
                  const milestone = milestones.find(m => m.year === selectedYear);
                  if (milestone) {
                    setMilestoneModal({ visible: true, year: selectedYear, content: milestone.content });
                  } else {
                    setMilestoneModal({ visible: true, year: selectedYear, content: '暂无大事记' });
                  }
                  setShowYearMenu(false);
                }}
                className="w-full text-left px-3 py-2.5 text-[12px] text-white hover:bg-blue-500/30 rounded-lg transition-colors flex items-center gap-2"
              >
                <span className="w-5 h-5 rounded-full bg-blue-400/30 flex items-center justify-center text-blue-400 text-[10px]">记</span>
                大事记
              </button>
              <button
                onClick={() => {
                  // 查看专业
                  const dataItem = data.find(item => item.year === selectedYear);
                  if (selectedYear && dataItem) {
                    setYearStats({
                      year: selectedYear,
                      deptCount: dataItem.departmentCount,
                      majorCount: dataItem.majorCount
                    });
                    solarAutoRotationRef.current = rotationRef.current;
                    setCurrentView('solar');
                  }
                  setShowYearMenu(false);
                }}
                className="w-full text-left px-3 py-2.5 text-[12px] text-white hover:bg-blue-500/30 rounded-lg transition-colors flex items-center gap-2"
              >
                <span className="w-5 h-5 rounded-full bg-purple-400/30 flex items-center justify-center text-purple-400 text-[10px]">专</span>
                专业
              </button>
            </div>
          </div>
        </>
      )}

      {/* 大事记弹窗 */}
      {milestoneModal.visible && (
        <>
          <div 
            className="fixed inset-0 bg-black/70 z-50"
            onClick={() => setMilestoneModal({ visible: false, year: 0, content: '' })}
          />
          <div className="fixed top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 z-50 bg-black/95 border border-blue-400/60 rounded-2xl shadow-2xl shadow-blue-500/40 w-[90%] max-w-lg overflow-hidden">
            <div className="p-4 md:p-6">
              <div className="flex items-center justify-between mb-4">
                <h3 className="text-[14px] md:text-[16px] text-blue-400 font-semibold">
                  {milestoneModal.year}年大事记
                </h3>
                <button
                  onClick={() => setMilestoneModal({ visible: false, year: 0, content: '' })}
                  className="w-7 h-7 rounded-full bg-white/10 hover:bg-white/20 flex items-center justify-center text-white/70 hover:text-white transition-colors"
                >
                  ✕
                </button>
              </div>
              <div className="text-[12px] md:text-[13px] text-white/90 leading-relaxed max-h-[60vh] overflow-y-auto space-y-3">
                {milestoneModal.content.split('\n').filter(line => line.trim()).map((line, index) => (
                  <div key={index} className="flex gap-3">
                    <span className="text-blue-400/60 shrink-0">{index + 1}.</span>
                    <span className="text-white/90">{line.trim()}</span>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </>
      )}
      </div>
    </>
  );
}
