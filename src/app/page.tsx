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
  const [collegesWithMajors, setCollegesWithMajors] = useState<College[]>([]);

  const canvasRef = useRef<HTMLCanvasElement>(null);
  const rotationRef = useRef(0);
  const solarRotXRef = useRef(0.5);
  const solarRotYRef = useRef(0);
  const isDraggingRef = useRef(false);
  const lastMousePosRef = useRef({ x: 0, y: 0 });
  const animationFrameRef = useRef<number | undefined>(undefined);
  const zoomLevelRef = useRef(1);
  const animationTimeRef = useRef(0);
  const majorRotationAnglesRef = useRef<number[]>([]);

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
    if (rect) {
      canvas.width = rect.width;
      canvas.height = rect.height;
    }

    const centerX = canvas.width / 2;
    const centerY = canvas.height / 2;
    const startYear = 1956;
    const endYear = Math.max(...data.map(d => d.year));
    const totalYears = endYear - startYear + 1;
    const rings = 6;
    const spiralHeight = 800;
    const baseRadius = Math.min(canvas.width, canvas.height) * 0.18;

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
      const x = lx * Math.cos(rotY) - lz * Math.sin(rotY);
      const z = lx * Math.sin(rotY) + lz * Math.cos(rotY);
      const y = ly;
      const y2 = y * Math.cos(rotX) - z * Math.sin(rotX);
      const z2 = y * Math.sin(rotX) + z * Math.cos(rotX);
      const perspective = 1200;
      const scale = perspective / (perspective + z2);
      return { x: centerX + x * scale, y: centerY + y2 * scale * 0.6, scale, z: z2 };
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
          } else if (node.year % 10 === 0) {
            ctx.font = `${9 * node.scale}px sans-serif`;
            ctx.fillStyle = `rgba(255, 255, 255, ${opacity * 0.85})`;
            ctx.textAlign = 'center';
            ctx.fillText(node.year.toString(), node.x, node.y - size - 5);
          }
        });
      } else {
        // 太阳系视图
        animationTimeRef.current += 0.016;

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
          const angle = (i / currentDepartments.length) * Math.PI * 2 - Math.PI / 2;
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

        // 绘制学院之间的轨道线连接
        const departments = renderObjects.filter(o => o.type === 'department');
        if (departments.length > 1) {
          ctx.beginPath();
          // 按索引排序以确保连接顺序正确
          departments.sort((a, b) => (a.index || 0) - (b.index || 0));

          departments.forEach((dept, i) => {
            if (i === 0) {
              ctx.moveTo(dept.x || 0, dept.y || 0);
            } else {
              ctx.lineTo(dept.x || 0, dept.y || 0);
            }
          });

          // 闭合路径连接最后一个到第一个
          ctx.lineTo(departments[0].x || 0, departments[0].y || 0);

          // 设置轨道线样式
          ctx.strokeStyle = 'rgba(96, 165, 250, 0.3)';
          ctx.lineWidth = 2;
          ctx.lineJoin = 'round';
          ctx.stroke();

          // 添加发光效果
          ctx.strokeStyle = 'rgba(96, 165, 250, 0.1)';
          ctx.lineWidth = 4;
          ctx.stroke();
        }

        // 绘制轨道环
        ctx.beginPath();
        ctx.ellipse(centerX, centerY, orbitRadiusX * 0.8, orbitRadiusY * 0.8, 0, 0, Math.PI * 2);
        ctx.strokeStyle = 'rgba(96, 165, 250, 0.1)';
        ctx.lineWidth = 1;
        ctx.stroke();

        // 绘制连接线
        const majors = renderObjects.filter(o => o.type === 'major');
        majors.forEach(major => {
          const parent = renderObjects.find(o => o.type === 'college' && o.index === major.parentIndex);
          if (parent) {
            const opacity = Math.max(0.2, Math.min(0.6, (1 - (major.z || 0) / 600) * 0.6));

            const gradient = ctx.createLinearGradient(parent.x || 0, parent.y || 0, major.x || 0, major.y || 0);
            gradient.addColorStop(0, major.color + Math.round(opacity * 255 * 0.8).toString(16).padStart(2, '0'));
            gradient.addColorStop(1, major.color + Math.round(opacity * 255 * 0.3).toString(16).padStart(2, '0'));

            ctx.beginPath();
            ctx.moveTo(parent.x || 0, parent.y || 0);
            ctx.lineTo(major.x || 0, major.y || 0);
            ctx.strokeStyle = gradient;
            ctx.lineWidth = 1.5;
            ctx.stroke();
          }
        });

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
      if (currentView === 'spiral') {
        rotationRef.current += deltaX * 0.005;
      } else {
        solarRotYRef.current += deltaX * 0.005;
      }
      lastMousePosRef.current = { x: e.clientX, y: e.clientY };
    } else if (currentView === 'spiral') {
      // 检测悬停节点
      const hoveredNode = data.find(item => {
        const centerX = canvas.width / 2;
        const centerY = canvas.height / 2;
        const baseRadius = Math.min(canvas.width, canvas.height) * 0.18;
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
        setTooltip({
          year: hoveredNode.year,
          count: hoveredNode.majorCount,
          event: keyEvent ? `${keyEvent.label} · ${keyEvent.desc}` : `${hoveredNode.departmentCount} 个院系 · ${hoveredNode.majorCount} 个专业`,
          x: e.clientX + 15,
          y: e.clientY + 15,
          visible: true
        });
      } else {
        setTooltip(prev => ({ ...prev, visible: false }));
      }
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
        const centerX = canvas.width / 2;
        const centerY = canvas.height / 2;
        const baseRadius = Math.min(canvas.width, canvas.height) * 0.18;
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
        const centerX = canvas.width / 2;
        const centerY = canvas.height / 2;
        const baseRadius = Math.min(canvas.width, canvas.height) * 0.18;
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
        setCurrentView('solar');
      }
    } else if (currentView === 'solar') {
      // 双击返回螺旋塔视图，清除选中年份
      setSelectedYear(null);
      setCurrentView('spiral');
    }
  };

  const zoomIn = () => {
    zoomLevelRef.current = Math.min(zoomLevelRef.current * 1.2, 2);
  };

  const zoomOut = () => {
    zoomLevelRef.current = Math.max(zoomLevelRef.current / 1.2, 0.5);
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
        onClick={handleClick}
        onDoubleClick={handleDoubleClick}
      />

      {/* 标题栏 */}
      <div className="absolute top-0 left-0 right-0 p-3 bg-gradient-to-b from-black to-transparent z-10">
        <h1 className="text-center text-[15px] font-semibold text-blue-400 tracking-wider">
          成都理工大学专业沿革螺旋塔
        </h1>
        <p className="text-center text-[10px] text-white/50 mt-1">
          1956 - {Math.max(...data.map(d => d.year))} {Math.max(...data.map(d => d.year)) - 1956 + 1}年岁月长河
        </p>
      </div>

      {/* Tooltip */}
      {tooltip.visible && (
        <div
          className="fixed z-20 bg-[rgba(10,15,30,0.92)] border border-blue-400/40 rounded-lg p-2.5 pointer-events-none max-w-[180px]"
          style={{ left: tooltip.x, top: tooltip.y }}
        >
          <div className="text-[16px] font-bold text-blue-400 mb-1">{tooltip.year}</div>
          <div className="text-[11px] text-pink-400 font-medium">{tooltip.count} 个专业</div>
          <div className="text-[9px] text-white/60 mt-1.5 leading-relaxed">{tooltip.event}</div>
        </div>
      )}

      {/* 缩放控制 */}
      {currentView === 'solar' && (
        <div className="absolute right-4 bottom-32 z-20 flex flex-col gap-2">
          <button
            onClick={zoomIn}
            className="w-10 h-10 rounded-full bg-blue-400/30 border border-blue-400/50 text-white text-xl flex items-center justify-center"
          >
            +
          </button>
          <button
            onClick={zoomOut}
            className="w-10 h-10 rounded-full bg-blue-400/30 border border-blue-400/50 text-white text-xl flex items-center justify-center"
          >
            −
          </button>
        </div>
      )}

      {/* 提示文字 */}
      <div className="fixed top-16 left-1/2 -translate-x-1/2 z-10">
        <div className="text-[9px] text-white/35 text-center bg-black/30 px-3 py-1.5 rounded-full">
          {currentView === 'spiral' ? '拖拽旋转 · 单击显示年份 · 双击进入院系' : '拖拽旋转 · 双指缩放 · 双击院系查看专业'}
        </div>
      </div>

      {/* 学院模态框 */}
      {selectedCollege && (
        <div className="fixed left-1/2 -translate-x-1/2 bottom-5 bg-[rgba(8,12,25,0.95)] border border-blue-400/50 rounded-xl p-3.5 z-30 w-[calc(100%-32px)] max-w-[360px] max-h-[50vh] overflow-y-auto">
          <div className="flex justify-between items-center mb-2.5 pb-2.5 border-b border-white/10">
            <div className="text-[14px] font-bold flex-1 pr-2.5">{selectedCollege.name}</div>
            <div className="text-[11px] text-white/50">{selectedCollege.majors.length} 个专业</div>
            <button
              onClick={() => setSelectedCollege(null)}
              className="w-6 h-6 rounded-full bg-white/10 border-none text-white text-base cursor-pointer flex items-center justify-center ml-2.5"
            >
              ×
            </button>
          </div>
          <div className="grid grid-cols-2 gap-2">
            {selectedCollege.majors.map((major, index) => (
              <div
                key={index}
                onClick={() => setSelectedMajor(major)}
                className="p-2.5 bg-white/6 rounded-lg cursor-pointer transition-all border border-transparent hover:bg-white/12 hover:border-blue-400/30"
              >
                <div className="text-[12px] font-medium leading-1.3">{major.name}</div>
                <div className="text-[9px] text-white/35 mt-0.75">{major.degree}</div>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* 专业详情弹窗 */}
      {selectedMajor && (
        <div className="fixed left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 bg-[rgba(8,12,25,0.95)] border border-blue-400/50 rounded-xl p-5 z-40 w-[calc(100%-40px)] max-w-[320px]">
          <div className="flex justify-between items-center mb-3.5 pb-3 border-b border-white/10">
            <div className="text-[15px] font-bold flex-1">{selectedMajor.name}</div>
            <button
              onClick={() => setSelectedMajor(null)}
              className="w-6 h-6 rounded-full bg-white/10 border-none text-white text-base cursor-pointer flex items-center justify-center ml-2.5"
            >
              ×
            </button>
          </div>
          <div className="flex justify-between items-center py-2 border-b border-white/6">
            <span className="text-white/50 text-[12px]">专业代码</span>
            <span className="text-[12px] font-medium">{selectedMajor.code || '-'}</span>
          </div>
          <div className="flex justify-between items-center py-2 border-b border-white/6">
            <span className="text-white/50 text-[12px]">学制</span>
            <span className="text-[12px] font-medium">{selectedMajor.degree}</span>
          </div>
          <div className="flex justify-between items-center py-2 border-b border-white/6">
            <span className="text-white/50 text-[12px]">所属学院</span>
            <span className="text-[12px] font-medium">{selectedMajor.college}</span>
          </div>
          <div className="flex justify-between items-center py-2">
            <span className="text-white/50 text-[12px]">所属部门</span>
            <span className="text-[12px] font-medium">{selectedMajor.original_dept}</span>
          </div>
        </div>
      )}

      {/* 返回按钮 */}
      {currentView === 'solar' && (
        <button
          onClick={() => {
            setCurrentView('spiral');
          }}
          className="fixed bottom-5 left-1/2 -translate-x-1/2 bg-blue-400/25 border border-blue-400/50 text-white px-7 py-2.5 rounded-full text-[12px] cursor-pointer z-10 active:scale-95 transition-transform"
        >
          返回螺旋塔
        </button>
      )}
    </div>
  );
}
