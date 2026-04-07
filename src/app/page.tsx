'use client';

import { useEffect, useState, useRef, useCallback, useMemo } from 'react';

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

interface DepartmentNode {
  name: string;
  color: string;
  majors: Major[];
  college: string; // 归属学院
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
}

export default function ProfessionalSpiralTower() {
  const [data, setData] = useState<YearData[]>([]);
  const [loading, setLoading] = useState(true);
  const [currentView, setCurrentView] = useState<'spiral' | 'solar'>('spiral');
  const [selectedYear, setSelectedYear] = useState<number | null>(null);
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

  const canvasRef = useRef<HTMLCanvasElement>(null);
  const rotationRef = useRef(0);
  const solarRotXRef = useRef(0.5);
  const solarRotYRef = useRef(0);
  const solarAutoRotationRef = useRef(0); // 学院球自动旋转角度
  const isDraggingRef = useRef(false);
  const isHoveringCollegeRef = useRef(false); // 鼠标是否悬停在学院球上
  const lastMousePosRef = useRef({ x: 0, y: 0 });
  const animationFrameRef = useRef<number | undefined>(undefined);
  const zoomLevelRef = useRef(1);
  const animationTimeRef = useRef(0);
  const majorRotationAnglesRef = useRef<number[]>([]);
  const renderObjectsRef = useRef<RenderObject[]>([]); // 保存太阳系视图的渲染对象

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
      });
    });

    // 生成院系节点，使用 HSL 颜色
    const departments: DepartmentNode[] = Array.from(deptMap.entries()).map(([deptName, data], index) => {
      const hue = (index * 137.5) % 360; // 黄金角度分布
      return {
        name: deptName,
        color: `hsl(${hue}, 70%, 55%)`,
        majors: data.majors,
        college: data.college
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

  // 获取当前视图使用的院系数据
  const currentDepartments = useMemo(() => {
    if (currentView === 'solar' && selectedYear !== null) {
      return getDepartmentsByYear(selectedYear);
    }
    return [];
  }, [currentView, selectedYear, getDepartmentsByYear]);

  const transformData = (apiData: ApiDataItem[]): YearData[] => {
    const yearMap = new Map<number, ApiDataItem[]>();

    apiData.forEach(item => {
      if (!yearMap.has(item.year)) {
        yearMap.set(item.year, []);
      }
      yearMap.get(item.year)?.push(item);
    });

    const result: YearData[] = [];
    yearMap.forEach((items, year) => {
      const deptMap = new Map<string, Major[]>();

      items.forEach(item => {
        // 使用 category（学院）而不是 department 来统计院系
        const deptName = item.category || '其他';
        if (!deptMap.has(deptName)) {
          deptMap.set(deptName, []);
        }
        deptMap.get(deptName)?.push({
          name: item.major,
          code: '',
          degree: item.level || '本科',
          college: item.category || '',
          original_college: item.category || '',
          original_dept: item.department || '',
        });
      });

      const departments: Department[] = [];
      deptMap.forEach((majors, deptName) => {
        departments.push({
          name: deptName,
          college: deptName, // 学院名称
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

  useEffect(() => {
    fetchData();
  }, [fetchData]);

  // Canvas 绘制
  useEffect(() => {
    if (!canvasRef.current || data.length === 0) return;

    const canvas = canvasRef.current;
    const ctx = canvas.getContext('2d');
    if (!ctx) return;

    const rect = canvas.parentElement?.getBoundingClientRect();
    if (!rect) return;

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
    const endYear = Math.max(...data.map(d => d.year));
    const totalYears = endYear - startYear + 1;
    const rings = 6;
    const spiralHeight = 800;
    const baseRadius = Math.min(rect.width, rect.height) * 0.18;

    // 生成螺旋节点
    const spiralNodes = data.map((item, index) => {
      const year = item.year;
      const progress = index / totalYears;
      const angle = progress * rings * Math.PI * 2;
      return {
        localX: Math.cos(angle) * baseRadius,
        localY: (1 - progress) * spiralHeight - spiralHeight / 2,
        localZ: Math.sin(angle) * baseRadius,
        year: item.year,
        count: item.majorCount,
        size: 12,
        specialColor: (() => {
          const specialColors: Record<number, string> = {
            1956: '#FF6B6B',
            1958: '#FFA500',
            1965: '#9370DB',
            1993: '#FFA500',
            2001: '#FFD700',
            2017: '#00FF7F',
            2025: '#00CED1'
          };
          return specialColors[year] || null;
        })()
      };
    });

    // 3D 投影函数
    const project3D = (lx: number, ly: number, lz: number, rotX: number, rotY: number) => {
      // 绕 Y 轴旋转
      let x = lx * Math.cos(rotY) - lz * Math.sin(rotY);
      let z = lx * Math.sin(rotY) + lz * Math.cos(rotY);
      let y = ly;

      // 绕 X 轴旋转
      let y2 = y * Math.cos(rotX) - z * Math.sin(rotX);
      let z2 = y * Math.sin(rotX) + z * Math.cos(rotX);

      const perspective = 1200;
      // 防止除以零或负数
      const z2Clamped = Math.max(-perspective + 10, z2);
      const scale = perspective / (perspective + z2Clamped);
      return { x: centerX + x * scale, y: centerY + y2 * scale * 0.6, scale: Math.max(0.1, scale), z: z2 };
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
    const drawSphere = (x: number, y: number, radius: number, color: string, opacity: number, glow?: boolean) => {
      // 防止无效值
      if (!isFinite(x) || !isFinite(y) || !isFinite(radius) || radius <= 0) {
        return;
      }

      if (glow) {
        const glowGradient = ctx.createRadialGradient(x, y, radius * 0.5, x, y, radius * 2);
        glowGradient.addColorStop(0, addAlpha(color, 0.25));
        glowGradient.addColorStop(1, addAlpha(color, 0));
        ctx.beginPath();
        ctx.arc(x, y, radius * 2, 0, Math.PI * 2);
        ctx.fillStyle = glowGradient;
        ctx.globalAlpha = opacity * 0.5;
        ctx.fill();
        ctx.globalAlpha = 1;
      }

      const gradient = ctx.createRadialGradient(
        x - radius * 0.3, y - radius * 0.3, radius * 0.1,
        x, y, radius
      );
      gradient.addColorStop(0, '#ffffff');
      gradient.addColorStop(0.2, color);
      gradient.addColorStop(0.8, color);
      gradient.addColorStop(1, adjustBrightness(color, -20));

      ctx.beginPath();
      ctx.arc(x, y, radius, 0, Math.PI * 2);
      ctx.fillStyle = gradient;
      ctx.globalAlpha = opacity;
      ctx.fill();
      ctx.globalAlpha = 1;

      ctx.beginPath();
      ctx.arc(x, y, radius, 0, Math.PI * 2);
      ctx.strokeStyle = adjustBrightness(color, -20);
      ctx.lineWidth = 1;
      ctx.globalAlpha = opacity * 0.8;
      ctx.stroke();
      ctx.globalAlpha = 1;
    };

    const animate = () => {
      ctx.clearRect(0, 0, canvas.width, canvas.height);

      // 更新动画时间
      animationTimeRef.current += 0.016;

      if (currentView === 'spiral') {
        // 更新旋转
        if (!isDraggingRef.current) {
          rotationRef.current += 0.002;
        }

        // 投影节点
        const projectedNodes = spiralNodes.map(node => {
          const proj = project3D(node.localX, node.localY, node.localZ, 0, rotationRef.current);
          return { ...node, x: proj.x, y: proj.y, scale: proj.scale, z: proj.z };
        });

        // 绘制连接线
        ctx.beginPath();
        const pathPoints = [];
        for (let i = 0; i <= totalYears; i += 0.2) {
          const progress = i / totalYears;
          const angle = progress * rings * Math.PI * 2;
          const proj = project3D(
            Math.cos(angle) * baseRadius,
            (1 - progress) * spiralHeight - spiralHeight / 2,
            Math.sin(angle) * baseRadius, 0, rotationRef.current
          );
          pathPoints.push(proj);
        }

        for (let i = 1; i < pathPoints.length; i++) {
          const avgZ = (pathPoints[i - 1].z + pathPoints[i].z) / 2;
          const opacity = Math.max(0.15, Math.min(0.5, (1 - avgZ / 600) * 0.5));

          ctx.beginPath();
          ctx.strokeStyle = `rgba(96, 165, 250, ${opacity})`;
          ctx.lineWidth = 2.5 * Math.min(pathPoints[i - 1].scale, pathPoints[i].scale);
          ctx.moveTo(pathPoints[i - 1].x, pathPoints[i - 1].y);
          ctx.lineTo(pathPoints[i].x, pathPoints[i].y);
          ctx.stroke();
        }

        // 绘制节点
        const sortedNodes = [...projectedNodes].sort((a, b) => b.z - a.z);

        sortedNodes.forEach(node => {
          const size = node.size * node.scale;
          const opacity = Math.max(0.5, Math.min(1, (1 - node.z / 600)));
          let color: string;
          if (node.specialColor) {
            color = node.specialColor;
          } else {
            const hue = 200 + ((node.year - startYear) / totalYears) * 60;
            color = `hsl(${hue}, 70%, 60%)`;
          }

          const shouldGlow = node.specialColor && [1956, 2001, 2017, 2025].includes(node.year);
          drawSphere(node.x, node.y, size, color, opacity, shouldGlow || undefined);

          const keyEvent = keyEvents.find(e => e.year === node.year);
          // 当是关键事件或鼠标悬停在该年份时，显示详细信息
          if (keyEvent) {
            ctx.font = `bold ${9 * node.scale}px sans-serif`;
            ctx.fillStyle = '#fff';
            ctx.textAlign = 'center';
            ctx.textBaseline = 'middle';
            ctx.fillText(node.year.toString(), node.x, node.y);

            ctx.font = `${8 * node.scale}px sans-serif`;
            ctx.fillStyle = `rgba(255,255,255,${opacity * 0.95})`;
            ctx.textAlign = 'left';
            ctx.fillText(keyEvent.label, node.x + size + 4, node.y - 6);
            ctx.font = `${7 * node.scale}px sans-serif`;
            ctx.fillStyle = `rgba(255,255,255,${opacity * 0.7})`;
            ctx.fillText(keyEvent.desc, node.x + size + 4, node.y + 6);
          } else if (node.year % 10 === 0 || hoveredYear === node.year) {
            // 每10年或鼠标悬停时显示年份
            ctx.font = `${9 * node.scale}px sans-serif`;
            ctx.fillStyle = `rgba(255, 255, 255, ${opacity * 0.85})`;
            ctx.textAlign = 'center';
            ctx.fillText(node.year.toString(), node.x, node.y - size - 5);
          }
        });
      } else {
        // 太阳系视图

        // 自动旋转学院球（如果没有拖动且没有悬停在学院球上）
        if (!isDraggingRef.current && !isHoveringCollegeRef.current) {
          solarAutoRotationRef.current += 0.003;
        }

        const orbitRadiusY = Math.min(canvas.width, canvas.height) * 0.35 * zoomLevelRef.current;
        const orbitRadiusX = Math.min(canvas.width, canvas.height) * 0.22 * zoomLevelRef.current;

        const renderObjects: RenderObject[] = [];

        // 中心太阳
        const pulseScale = 1 + Math.sin(animationTimeRef.current * 2) * 0.05;
        renderObjects.push({
          type: 'sun',
          lx: 0, ly: 0, lz: 0,
          radius: 20 * pulseScale,
          color: '#3b82f6'
        });

        // 院系（原所在院系）
        currentDepartments.forEach((dept: DepartmentNode, i: number) => {
          const angle = (i / currentDepartments.length) * Math.PI * 2 - Math.PI / 2 + solarAutoRotationRef.current;
          const lx = Math.cos(angle) * orbitRadiusX;
          const ly = Math.sin(angle) * orbitRadiusY;
          const lz = 0;

          renderObjects.push({
            type: 'department',
            index: i,
            lx, ly, lz,
            radius: 14,
            color: dept.color,
            name: dept.name,
            collegeName: dept.college
          });

          // 专业
          if (dept.majors && dept.majors.length > 0) {
            if (majorRotationAnglesRef.current[i] === undefined) {
              majorRotationAnglesRef.current[i] = Math.random() * Math.PI * 2;
            }

            majorRotationAnglesRef.current[i] += 0.008 + i * 0.001;

            const majorOrbitRadius = 50 * zoomLevelRef.current;
            dept.majors.forEach((major: Major, j: number) => {
              const majorAngle = majorRotationAnglesRef.current[i] + (j / dept.majors.length) * Math.PI * 2;

              const mlx = lx + Math.cos(majorAngle) * majorOrbitRadius;
              const mly = ly + Math.sin(majorAngle) * majorOrbitRadius * 0.4;
              const mlz = Math.sin(majorAngle * 2) * 20 + Math.cos(animationTimeRef.current * 3 + j) * 10;

              renderObjects.push({
                type: 'major',
                parentIndex: i,
                lx: mlx, ly: mly, lz: mlz,
                radius: 4,
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
          const proj = project3D(obj.lx, obj.ly, obj.lz, solarRotXRef.current, solarRotYRef.current);
          obj.x = proj.x; obj.y = proj.y; obj.scale = proj.scale; obj.z = proj.z;
        });

        renderObjects.sort((a, b) => (b.z || 0) - (a.z || 0));

        // 保存渲染对象到 ref，用于点击检测
        renderObjectsRef.current = renderObjects;

        // 绘制学院轨道线（椭圆）
        ctx.beginPath();
        for (let angle = 0; angle <= Math.PI * 2; angle += 0.02) {
          const lx = Math.cos(angle) * orbitRadiusX;
          const ly = Math.sin(angle) * orbitRadiusY;
          const proj = project3D(lx, ly, 0, solarRotXRef.current, solarRotYRef.current);
          if (angle === 0) {
            ctx.moveTo(proj.x, proj.y);
          } else {
            ctx.lineTo(proj.x, proj.y);
          }
        }
        ctx.closePath();
        ctx.strokeStyle = 'rgba(96, 165, 250, 0.3)';
        ctx.lineWidth = 4;
        ctx.stroke();

        // 绘制球体
        renderObjects.forEach(obj => {
          const opacity = Math.max(0.6, Math.min(1, (1 - (obj.z || 0) / 600)));

          if (obj.type === 'major') {
            const tailLength = 3;
            for (let t = tailLength; t >= 0; t--) {
              const trailOpacity = opacity * (1 - t / tailLength) * 0.5;
              drawSphere((obj.x || 0) - t * 2, obj.y || 0, obj.radius * (1 - t / tailLength), obj.color, trailOpacity, false);
            }
            drawSphere(obj.x || 0, obj.y || 0, obj.radius, obj.color, opacity, false);
          } else if (obj.type === 'sun') {
            drawSphere(obj.x || 0, obj.y || 0, obj.radius, obj.color, opacity, true);

            // 在太阳球上绘制年份
            if (selectedYear) {
              ctx.font = `bold ${14 * (obj.scale || 1)}px sans-serif`;
              ctx.fillStyle = `rgba(255, 255, 255, ${opacity})`;
              ctx.textAlign = 'center';
              ctx.textBaseline = 'middle';
              ctx.fillText(selectedYear.toString(), obj.x || 0, obj.y || 0);

              ctx.font = `${10 * (obj.scale || 1)}px sans-serif`;
              ctx.fillStyle = `rgba(255, 255, 255, ${opacity * 0.8})`;
              ctx.textBaseline = 'middle';
              ctx.fillText('年', obj.x || 0, (obj.y || 0) + 15 * (obj.scale || 1));
            }
          } else if (obj.type === 'college' || obj.type === 'department') {
            drawSphere(obj.x || 0, obj.y || 0, obj.radius, obj.color, opacity, true);

            ctx.font = `${9 * (obj.scale || 1)}px sans-serif`;
            ctx.fillStyle = `rgba(255, 255, 255, ${opacity * 0.9})`;
            ctx.textAlign = 'center';
            // 对于院系，显示完整的名称（包括"系"或"学院"）
            const displayName = obj.type === 'department' ? obj.name : obj.name?.split('（')[0];
            ctx.fillText(displayName || '', obj.x || 0, (obj.y || 0) + obj.radius + 12);
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
  }, [data, currentView, currentDepartments, keyEvents]);

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
      // 检测悬停节点
      const hoveredNode = data.find(item => {
        const centerX = rect.width / 2;
        const centerY = rect.height / 2;
        const baseRadius = Math.min(rect.width, rect.height) * 0.18;
        const totalYears = Math.max(...data.map(d => d.year)) - 1956 + 1;
        const rings = 6;
        const spiralHeight = 800;
        const progress = data.indexOf(item) / totalYears;
        const angle = progress * rings * Math.PI * 2 + rotationRef.current;
        const proj = {
          x: centerX + (Math.cos(angle) * baseRadius),
          y: centerY + ((1 - progress) * spiralHeight - spiralHeight / 2) * 0.6
        };
        const distance = Math.sqrt((x - proj.x) ** 2 + (y - proj.y) ** 2);
        return distance < 20;
      });

      if (hoveredNode) {
        const keyEvent = keyEvents.find(e => e.year === hoveredNode.year);
        setHoveredYear(hoveredNode.year);
        setTooltip({
          year: hoveredNode.year,
          count: hoveredNode.majorCount,
          event: keyEvent ? `${keyEvent.label} · ${keyEvent.desc}` : `${hoveredNode.departmentCount} 个院系 · ${hoveredNode.majorCount} 个专业`,
          x: e.clientX + 15,
          y: e.clientY + 15,
          visible: true
        });
        // 更新年份统计信息
        setYearStats({
          year: hoveredNode.year,
          deptCount: hoveredNode.departmentCount,
          majorCount: hoveredNode.majorCount
        });
      } else {
        setHoveredYear(null);
        setTooltip(prev => ({ ...prev, visible: false }));
        setYearStats(null);
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
  };

  const handleClick = (e: React.MouseEvent) => {
    if (!canvasRef.current || data.length === 0) return;

    const canvas = canvasRef.current;
    const rect = canvas.getBoundingClientRect();
    const x = e.clientX - rect.left;
    const y = e.clientY - rect.top;

    // 检测点击节点 - 仅用于显示 tooltip
    if (currentView === 'spiral') {
      const clickedNode = data.find(item => {
        const centerX = rect.width / 2;
        const centerY = rect.height / 2;
        const baseRadius = Math.min(rect.width, rect.height) * 0.18;
        const totalYears = Math.max(...data.map(d => d.year)) - 1956 + 1;
        const rings = 6;
        const spiralHeight = 800;
        const progress = data.indexOf(item) / totalYears;
        const angle = progress * rings * Math.PI * 2 + rotationRef.current;
        const proj = {
          x: centerX + (Math.cos(angle) * baseRadius),
          y: centerY + ((1 - progress) * spiralHeight - spiralHeight / 2) * 0.6
        };
        const distance = Math.sqrt((x - proj.x) ** 2 + (y - proj.y) ** 2);
        return distance < 20;
      });

      if (clickedNode) {
        // 显示 tooltip（暂时不实现，参考文件中是悬停显示）
        // 这里可以添加点击显示 tooltip 的逻辑
      }
    }
  };

  const handleDoubleClick = (e: React.MouseEvent) => {
    if (!canvasRef.current || data.length === 0) return;

    const canvas = canvasRef.current;
    const rect = canvas.getBoundingClientRect();
    const x = e.clientX - rect.left;
    const y = e.clientY - rect.top;

    if (currentView === 'spiral') {
      // 双击年份节点进入太阳系视图
      const clickedNode = data.find(item => {
        const centerX = rect.width / 2;
        const centerY = rect.height / 2;
        const baseRadius = Math.min(rect.width, rect.height) * 0.18;
        const totalYears = Math.max(...data.map(d => d.year)) - 1956 + 1;
        const rings = 6;
        const spiralHeight = 800;
        const progress = data.indexOf(item) / totalYears;
        const angle = progress * rings * Math.PI * 2 + rotationRef.current;
        const proj = {
          x: centerX + (Math.cos(angle) * baseRadius),
          y: centerY + ((1 - progress) * spiralHeight - spiralHeight / 2) * 0.6
        };
        const distance = Math.sqrt((x - proj.x) ** 2 + (y - proj.y) ** 2);
        return distance < 20;
      });

      if (clickedNode) {
        setSelectedYear(clickedNode.year); // 设置选中年份
        // 设置学院球初始旋转角度，与螺旋塔的当前旋转角度保持一致
        solarAutoRotationRef.current = rotationRef.current;
        setCurrentView('solar');
        // 更新年份统计信息
        setYearStats({
          year: clickedNode.year,
          deptCount: clickedNode.departmentCount,
          majorCount: clickedNode.majorCount
        });
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
          const deptNode = currentDepartments.find(d => d.name === clickedObject.name);
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

  // 鼠标滚轮缩放
  const handleWheel = (e: React.WheelEvent) => {
    if (currentView === 'solar') {
      e.preventDefault();
      const delta = e.deltaY > 0 ? 0.9 : 1.1;
      zoomLevelRef.current = Math.max(0.5, Math.min(2, zoomLevelRef.current * delta));
    }
  };

  // 触摸事件处理（用于双指缩放）
  const initialTouchDistanceRef = useRef<number | null>(null);
  const initialZoomRef = useRef<number>(1);

  const handleTouchStart = (e: React.TouchEvent) => {
    if (currentView === 'solar' && e.touches.length === 2) {
      const touch1 = e.touches[0];
      const touch2 = e.touches[1];
      const distance = Math.hypot(
        touch2.clientX - touch1.clientX,
        touch2.clientY - touch1.clientY
      );
      initialTouchDistanceRef.current = distance;
      initialZoomRef.current = zoomLevelRef.current;
    }
  };

  const handleTouchMove = (e: React.TouchEvent) => {
    if (currentView === 'solar' && e.touches.length === 2 && initialTouchDistanceRef.current !== null) {
      e.preventDefault();
      const touch1 = e.touches[0];
      const touch2 = e.touches[1];
      const distance = Math.hypot(
        touch2.clientX - touch1.clientX,
        touch2.clientY - touch1.clientY
      );
      const ratio = distance / initialTouchDistanceRef.current;
      zoomLevelRef.current = Math.max(0.5, Math.min(2, initialZoomRef.current * ratio));
    }
  };

  const handleTouchEnd = () => {
    initialTouchDistanceRef.current = null;
  };

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
    <div className="relative w-full h-screen overflow-hidden bg-cover bg-center bg-no-repeat" style={{ backgroundImage: 'url(/background.jpg)' }}>
      {/* 半透明遮罩层，确保内容清晰可见 */}
      <div className="absolute inset-0 bg-black/60"></div>
      <canvas
        ref={canvasRef}
        className="absolute inset-0"
        onMouseDown={handleMouseDown}
        onMouseMove={handleMouseMove}
        onMouseUp={handleMouseUp}
        onMouseLeave={handleMouseUp}
        onWheel={handleWheel}
        onTouchStart={handleTouchStart}
        onTouchMove={handleTouchMove}
        onTouchEnd={handleTouchEnd}
        onClick={handleClick}
        onDoubleClick={handleDoubleClick}
        onContextMenu={(e) => e.preventDefault()}
      />

      {/* 标题栏 */}
      <div className="absolute top-0 left-0 right-0 p-3 bg-gradient-to-b from-black to-transparent z-10">
        <h1 className="text-center text-[15px] font-semibold text-blue-400 tracking-wider">
          成都理工大学专业沿革星系图
        </h1>
        <p className="text-center text-[10px] text-white/50 mt-1">
          1956 - {Math.max(...data.map(d => d.year))} {Math.max(...data.map(d => d.year)) - 1956 + 1}年岁月长河
        </p>
        {yearStats && (
          <p className="text-center text-[10px] text-blue-300/80 mt-1">
            {yearStats.year}年 · {yearStats.deptCount}个学院 · {yearStats.majorCount}个专业
          </p>
        )}
      </div>

      {/* 缩放控制 */}
      {currentView === 'solar' && (
        <div className="absolute right-4 bottom-32 z-20 flex flex-col gap-2">
          <button
            onClick={zoomIn}
            className="w-10 h-10 rounded-full bg-blue-400/30 border border-blue-400/50 text-white text-xl flex items-center justify-center hover:bg-blue-400/40 transition-colors"
          >
            +
          </button>
          <button
            onClick={zoomOut}
            className="w-10 h-10 rounded-full bg-blue-400/30 border border-blue-400/50 text-white text-xl flex items-center justify-center hover:bg-blue-400/40 transition-colors"
          >
            −
          </button>
          <button
            onClick={resetView}
            className="w-10 h-10 rounded-full bg-purple-400/30 border border-purple-400/50 text-white text-xs flex items-center justify-center hover:bg-purple-400/40 transition-colors"
          >
            ↻
          </button>
        </div>
      )}

      {/* 提示文字 */}
      <div className="fixed top-16 left-1/2 -translate-x-1/2 z-10">
        <div className="text-[9px] text-white/35 text-center bg-black/30 px-3 py-1.5 rounded-full">
          {currentView === 'spiral' ? '拖拽旋转 · 单击显示年份 · 双击进入院系' : '左键拖拽旋转学院 · 右键拖拽旋转视角 · 滚轮缩放 · 双击院系查看专业 · 双击空白返回'}
        </div>
      </div>

      {/* 学院模态框 */}
      {selectedCollege && (
        <div className="fixed left-1/2 -translate-x-1/2 bottom-5 bg-[rgba(8,12,25,0.98)] border border-blue-400/50 rounded-xl p-3.5 z-30 w-[calc(100%-32px)] max-w-[360px] max-h-[50vh] overflow-y-auto shadow-2xl shadow-black/50">
          <div className="flex justify-between items-center mb-2.5 pb-2.5 border-b border-white/20">
            <div className="text-[14px] font-bold flex-1 pr-2.5 text-white drop-shadow-md">{selectedCollege.name}</div>
            <div className="text-[11px] text-blue-300 font-medium">{selectedCollege.majors.length} 个专业</div>
            <button
              onClick={() => setSelectedCollege(null)}
              className="w-6 h-6 rounded-full bg-white/20 hover:bg-white/30 text-white text-base cursor-pointer flex items-center justify-center ml-2.5 transition-colors"
            >
              ×
            </button>
          </div>
          <div className="grid grid-cols-2 gap-2">
            {selectedCollege.majors.map((major, index) => (
              <div
                key={index}
                onClick={() => setSelectedMajor(major)}
                className="p-2.5 bg-white/10 rounded-lg cursor-pointer transition-all border border-white/10 hover:bg-white/20 hover:border-blue-400/50"
              >
                <div className="text-[12px] font-medium leading-tight text-white drop-shadow-sm">{major.name}</div>
                <div className="text-[9px] text-blue-200/80 mt-1 font-medium">{major.degree}</div>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* 专业详情弹窗 */}
      {selectedMajor && (
        <div className="fixed left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 bg-[rgba(8,12,25,0.98)] border border-blue-400/50 rounded-xl p-5 z-40 w-[calc(100%-40px)] max-w-[320px] shadow-2xl shadow-black/50">
          <div className="flex justify-between items-center mb-3.5 pb-3 border-b border-white/20">
            <div
              className="text-[15px] font-bold flex-1 text-white drop-shadow-md cursor-pointer hover:text-blue-300 transition-colors"
              onDoubleClick={() => setShowCollegeHistory(!showCollegeHistory)}
              title="双击查看专业沿革历史"
            >
              {selectedMajor.name}
            </div>
            <button
              onClick={() => {
                setSelectedMajor(null);
                setShowCollegeHistory(false);
              }}
              className="w-6 h-6 rounded-full bg-white/20 hover:bg-white/30 text-white text-base cursor-pointer flex items-center justify-center ml-2.5 transition-colors"
            >
              ×
            </button>
          </div>

          {!showCollegeHistory ? (
            <>
              <div className="flex justify-between items-center py-2.5 border-b border-white/15">
                <span className="text-blue-300/90 text-[12px] font-medium">专业代码</span>
                <span className="text-[12px] font-medium text-white drop-shadow-sm">{selectedMajor.code || '-'}</span>
              </div>
              <div className="flex justify-between items-center py-2.5 border-b border-white/15">
                <span className="text-blue-300/90 text-[12px] font-medium">学制</span>
                <span className="text-[12px] font-medium text-white drop-shadow-sm">{selectedMajor.degree || '-'}</span>
              </div>
              <div className="flex justify-between items-center py-2.5 border-b border-white/15">
                <span className="text-blue-300/90 text-[12px] font-medium">所属学院</span>
                <span className="text-[12px] font-medium text-white drop-shadow-sm">{selectedMajor.college || '-'}</span>
              </div>
              <div className="flex justify-between items-center py-2.5 border-b border-white/15">
                <span className="text-blue-300/90 text-[12px] font-medium">原所属部门</span>
                <span className="text-[12px] font-medium text-white drop-shadow-sm">{selectedMajor.original_dept || '-'}</span>
              </div>
              {selectedMajor.year && (
                <div className="flex justify-between items-center py-2.5 border-t border-white/15">
                  <span className="text-blue-300/90 text-[12px] font-medium">设立年份</span>
                  <span className="text-[12px] font-medium text-white drop-shadow-sm">{selectedMajor.year}</span>
                </div>
              )}
            </>
          ) : (
            // 显示专业沿革历史（箭头状时间线）
            <div className="space-y-0">
              <div className="text-[11px] text-blue-300/80 mb-3 text-center">双击标题返回专业详情</div>
              {(() => {
                const majorName = selectedMajor.name;
                // 获取该专业的所有历史记录（按年份排序）
                const majorHistory = rawApiData
                  .filter(item => item.major === majorName)
                  .sort((a, b) => a.year - b.year);

                return majorHistory.length > 0 ? (
                  majorHistory.map((item, index) => (
                    <div key={item.id} className="relative flex items-start">
                      {/* 箭头线 */}
                      {index < majorHistory.length - 1 && (
                        <div className="absolute left-3 top-6 w-[2px] h-full bg-gradient-to-b from-blue-400/60 to-blue-400/20"></div>
                      )}
                      {/* 节点圆点 */}
                      <div className="relative z-10 flex-shrink-0 w-6 h-6 rounded-full bg-blue-500/30 border-2 border-blue-400 flex items-center justify-center">
                        <div className="w-2 h-2 rounded-full bg-blue-400"></div>
                      </div>
                      {/* 内容卡片 */}
                      <div className="ml-3 mb-4 flex-1 bg-white/5 rounded-lg p-2.5 border border-white/10 hover:border-blue-400/30 transition-colors">
                        <div className="flex justify-between items-center mb-1">
                          <span className="text-[13px] font-bold text-blue-300">{item.year}年</span>
                          <span className="text-[10px] text-blue-200/70">{item.department}</span>
                        </div>
                        <div className="text-[11px] text-white/90 font-medium mb-1">{item.major}</div>
                        {item.description && (
                          <div className="text-[10px] text-white/60">{item.description}</div>
                        )}
                      </div>
                    </div>
                  ))
                ) : (
                  <div className="text-center text-[12px] text-white/60 py-4">暂无历史数据</div>
                );
              })()}
            </div>
          )}
        </div>
      )}

      {/* 返回按钮 */}
      {currentView === 'solar' && (
        <button
          onClick={() => {
            setCurrentView('spiral');
            setYearStats(null);
            setSelectedYear(null);
          }}
          className="fixed bottom-5 left-1/2 -translate-x-1/2 bg-blue-400/25 border border-blue-400/50 text-white px-7 py-2.5 rounded-full text-[12px] cursor-pointer z-10 active:scale-95 transition-transform"
        >
          返回螺旋塔
        </button>
      )}
    </div>
  );
}
