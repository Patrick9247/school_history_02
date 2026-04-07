'use client';

import { useEffect, useState, useRef, useCallback } from 'react';
import { Button } from '@/components/ui/button';

interface Major {
  name: string;
  code: string;
  degree: string;
  college: string;
  original_college: string;
  original_dept: string;
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

// API 数据类型
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

export default function ProfessionalSpiralTower() {
  const [data, setData] = useState<YearData[]>([]);
  const [selectedCollege, setSelectedCollege] = useState<Department | null>(null);
  const [selectedMajor, setSelectedMajor] = useState<Major | null>(null);
  const [hoveredYear, setHoveredYear] = useState<number | null>(null);
  const [loading, setLoading] = useState(true);
  
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const rotationRef = useRef(0);
  const scaleRef = useRef(1);
  const isDraggingRef = useRef(false);
  const lastMousePosRef = useRef({ x: 0, y: 0 });
  const animationFrameRef = useRef<number | undefined>(undefined);

  // 获取数据
  const fetchData = useCallback(async () => {
    try {
      const response = await fetch('/api/professional-history');
      const result = await response.json();

      if (result.success && result.data) {
        // 转换数据格式
        const transformedData = transformData(result.data);
        setData(transformedData);
      }
    } catch (error) {
      console.error('Error fetching data:', error);
    } finally {
      setLoading(false);
    }
  }, []);

  // 转换数据格式以匹配螺旋塔的显示需求
  const transformData = (apiData: ApiDataItem[]): YearData[] => {
    // 按年份分组
    const yearMap = new Map<number, ApiDataItem[]>();
    
    apiData.forEach(item => {
      if (!yearMap.has(item.year)) {
        yearMap.set(item.year, []);
      }
      yearMap.get(item.year)?.push(item);
    });
    
    // 转换为YearData格式
    const result: YearData[] = [];
    yearMap.forEach((items, year) => {
      // 按部门/学院分组
      const deptMap = new Map<string, Major[]>();
      
      items.forEach(item => {
        const deptName = item.department || '其他';
        if (!deptMap.has(deptName)) {
          deptMap.set(deptName, []);
        }
        deptMap.get(deptName)?.push({
          name: item.major,
          code: '',
          degree: item.level || '本科',
          college: item.category || '',
          original_college: item.category || '',
          original_dept: deptName,
        });
      });
      
      const departments: Department[] = [];
      deptMap.forEach((majors, deptName) => {
        departments.push({
          name: deptName,
          college: items[0].category || '',
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
    
    // 按年份排序
    return result.sort((a, b) => a.year - b.year);
  };
  
  useEffect(() => {
    fetchData();
  }, [fetchData]);
  
  // Canvas绘制
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
    const baseRadius = Math.min(canvas.width, canvas.height) * 0.35;
    const heightPerLevel = (canvas.height * 0.6) / data.length;
    const rotationAngle = (Math.PI * 2) / data.length;
    
    const animate = () => {
      ctx.clearRect(0, 0, canvas.width, canvas.height);
      
      data.forEach((item, index) => {
        const level = index;
        const yPos = centerY - (level * heightPerLevel);
        const angle = rotationRef.current + (index * rotationAngle);
        const radius = baseRadius * (1 - index * 0.015);
        
        const xPos = centerX + Math.cos(angle) * radius;
        
        // 绘制连接线
        if (index > 0) {
          const prevAngle = rotationRef.current + ((index - 1) * rotationAngle);
          const prevRadius = baseRadius * (1 - (index - 1) * 0.015);
          const prevYPos = centerY - ((level - 1) * heightPerLevel);
          const prevXPos = centerX + Math.cos(prevAngle) * prevRadius;
          
          ctx.beginPath();
          ctx.moveTo(prevXPos, prevYPos);
          ctx.lineTo(xPos, yPos);
          ctx.strokeStyle = 'rgba(100, 116, 139, 0.3)';
          ctx.lineWidth = 2;
          ctx.stroke();
        }
        
        // 绘制节点
        const isHovered = hoveredYear === item.year;
        const size = isHovered ? 14 : 10;
        
        // 节点阴影
        ctx.beginPath();
        ctx.arc(xPos + 3, yPos + 3, size, 0, Math.PI * 2);
        ctx.fillStyle = 'rgba(0, 0, 0, 0.2)';
        ctx.fill();
        
        // 节点主体
        ctx.beginPath();
        ctx.arc(xPos, yPos, size, 0, Math.PI * 2);
        
        if (isHovered) {
          ctx.fillStyle = '#60a5fa';
        } else {
          ctx.fillStyle = '#3b82f6';
        }
        
        ctx.fill();
        
        // 节点边框
        ctx.strokeStyle = 'white';
        ctx.lineWidth = 2;
        ctx.stroke();
        
        // 年份标签
        ctx.font = 'bold 14px sans-serif';
        ctx.fillStyle = '#60a5fa';
        ctx.textAlign = 'center';
        ctx.fillText(item.year.toString(), xPos, yPos - size - 8);
        
        // 专业数量
        ctx.font = '11px sans-serif';
        ctx.fillStyle = '#f472b6';
        ctx.fillText(`${item.majorCount} 个专业`, xPos, yPos + size + 12);
      });
      
      // 自动旋转
      if (!isDraggingRef.current) {
        rotationRef.current += 0.002;
      }
      
      animationFrameRef.current = requestAnimationFrame(animate);
    };
    
    animate();
    
    return () => {
      if (animationFrameRef.current) {
        cancelAnimationFrame(animationFrameRef.current);
      }
    };
  }, [data, hoveredYear]);
  
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
    
    const centerX = canvas.width / 2;
    const centerY = canvas.height / 2;
    const baseRadius = Math.min(canvas.width, canvas.height) * 0.35;
    const heightPerLevel = (canvas.height * 0.6) / data.length;
    const rotationAngle = (Math.PI * 2) / data.length;
    
    if (isDraggingRef.current) {
      const deltaX = e.clientX - lastMousePosRef.current.x;
      rotationRef.current += deltaX * 0.01;
      lastMousePosRef.current = { x: e.clientX, y: e.clientY };
    } else {
      // 检测悬停
      let foundYear: number | null = null;
      
      data.forEach((item, index) => {
        const level = index;
        const yPos = centerY - (level * heightPerLevel);
        const angle = rotationRef.current + (index * rotationAngle);
        const radius = baseRadius * (1 - index * 0.015);
        const xPos = centerX + Math.cos(angle) * radius;
        
        const distance = Math.sqrt((x - xPos) ** 2 + (y - yPos) ** 2);
        
        if (distance < 15) {
          foundYear = item.year;
        }
      });
      
      setHoveredYear(foundYear);
    }
  };
  
  const handleMouseUp = () => {
    isDraggingRef.current = false;
  };
  
  const handleClick = () => {
    if (hoveredYear) {
      const yearData = data.find(d => d.year === hoveredYear);
      if (yearData && yearData.departments.length > 0) {
        setSelectedCollege(yearData.departments[0]);
      }
    }
  };
  
  const handleCloseCollegeModal = () => {
    setSelectedCollege(null);
  };
  
  const handleMajorClick = (major: Major) => {
    setSelectedMajor(major);
    setSelectedCollege(null);
  };
  
  const handleCloseMajorDetail = () => {
    setSelectedMajor(null);
  };
  
  const handleZoomIn = () => {
    scaleRef.current = Math.min(scaleRef.current + 0.1, 2);
  };
  
  const handleZoomOut = () => {
    scaleRef.current = Math.max(scaleRef.current - 0.1, 0.5);
  };
  
  return (
    <div className="min-h-screen bg-black text-white overflow-hidden font-sans relative">
      {/* 背景 */}
      <div className="fixed inset-0 bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 opacity-60 pointer-events-none" />
      
      {/* 头部 */}
      <div className="fixed top-0 left-0 right-0 p-3 bg-gradient-to-b from-black/85 to-transparent z-50 text-center">
        <h1 className="text-lg font-semibold text-blue-400 tracking-wider">成都理工大学专业沿革螺旋塔</h1>
        <p className="text-xs text-white/50 mt-1">1956 - 2025 七十年岁月长河</p>
      </div>
      
      {/* Canvas */}
      <canvas
        ref={canvasRef}
        className="fixed inset-0 w-full h-full cursor-grab active:cursor-grabbing"
        onMouseDown={handleMouseDown}
        onMouseMove={handleMouseMove}
        onMouseUp={handleMouseUp}
        onMouseLeave={handleMouseUp}
        onClick={handleClick}
      />
      
      {/* 提示 */}
      <div className="fixed bottom-8 left-1/2 -translate-x-1/2 z-40 text-center pointer-events-none">
        <p className="text-xs text-white/35 bg-black/30 px-3 py-1.5 rounded-full">
          拖拽旋转 · 单击显示年份 · 双击进入学院
        </p>
      </div>
      
      {/* 缩放控制 */}
      <div className="fixed right-4 bottom-24 z-40 flex flex-col gap-2">
        <Button
          onClick={handleZoomIn}
          variant="outline"
          size="icon"
          className="w-10 h-10 rounded-full bg-blue-500/30 border-blue-500/50 text-white hover:bg-blue-500/50"
        >
          <span className="text-xl">+</span>
        </Button>
        <Button
          onClick={handleZoomOut}
          variant="outline"
          size="icon"
          className="w-10 h-10 rounded-full bg-blue-500/30 border-blue-500/50 text-white hover:bg-blue-500/50"
        >
          <span className="text-xl">−</span>
        </Button>
      </div>
      
      {/* 学院模态框 */}
      {selectedCollege && (
        <>
          <div className="fixed inset-0 bg-black/40 z-50" onClick={handleCloseCollegeModal} />
          <div className="fixed left-1/2 -translate-x-1/2 bottom-5 z-60 w-[calc(100%-2rem)] max-w-[360px] max-h-[50vh] overflow-y-auto bg-slate-950 border border-blue-500/50 rounded-2xl p-4 shadow-2xl">
            <div className="flex items-center justify-between mb-3 pb-3 border-b border-white/10">
              <div className="flex-1 pr-3">
                <h3 className="text-sm font-bold">{selectedCollege.name}</h3>
                <p className="text-xs text-white/50">{selectedCollege.majorCount} 个专业</p>
              </div>
              <Button
                onClick={handleCloseCollegeModal}
                variant="ghost"
                size="icon"
                className="w-6 h-6 rounded-full bg-white/10 hover:bg-white/20 text-white"
              >
                ×
              </Button>
            </div>
            <div className="grid grid-cols-2 gap-2">
              {selectedCollege.majors.map((major, index) => (
                <div
                  key={index}
                  onClick={() => handleMajorClick(major)}
                  className="p-3 bg-white/6 rounded-xl cursor-pointer hover:bg-white/12 hover:border-blue-500/30 border border-transparent transition-all"
                >
                  <p className="text-xs font-medium leading-relaxed">{major.name}</p>
                  <p className="text-[9px] text-white/35 mt-1">{major.degree}</p>
                </div>
              ))}
            </div>
          </div>
        </>
      )}
      
      {/* 专业详情模态框 */}
      {selectedMajor && (
        <>
          <div className="fixed inset-0 bg-black/40 z-70" onClick={handleCloseMajorDetail} />
          <div className="fixed left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 z-80 w-[calc(100%-2.5rem)] max-w-[320px] bg-slate-950 border border-blue-500/50 rounded-2xl p-5 shadow-2xl">
            <div className="flex items-center justify-between mb-4 pb-4 border-b border-white/10">
              <h3 className="text-base font-bold flex-1">{selectedMajor.name}</h3>
              <Button
                onClick={handleCloseMajorDetail}
                variant="ghost"
                size="icon"
                className="w-6 h-6 rounded-full bg-white/10 hover:bg-white/20 text-white ml-2"
              >
                ×
              </Button>
            </div>
            <div className="space-y-0">
              <div className="flex justify-between items-center py-2.5 border-b border-white/6 last:border-0">
                <span className="text-xs text-white/50">专业代码</span>
                <span className="text-xs font-medium">{selectedMajor.code || '暂无'}</span>
              </div>
              <div className="flex justify-between items-center py-2.5 border-b border-white/6 last:border-0">
                <span className="text-xs text-white/50">学制</span>
                <span className="text-xs font-medium">{selectedMajor.degree}</span>
              </div>
              <div className="flex justify-between items-center py-2.5 border-b border-white/6 last:border-0">
                <span className="text-xs text-white/50">所属学院</span>
                <span className="text-xs font-medium">{selectedMajor.college}</span>
              </div>
            </div>
          </div>
        </>
      )}
      
      {/* 加载状态 */}
      {loading && (
        <div className="fixed inset-0 flex items-center justify-center bg-black z-30">
          <div className="text-center">
            <div className="w-12 h-12 border-4 border-blue-500 border-t-transparent rounded-full animate-spin mx-auto mb-4" />
            <p className="text-white/50">加载中...</p>
          </div>
        </div>
      )}
    </div>
  );
}
