'use client';

import { useEffect, useState, useRef } from 'react';
import { Button } from '@/components/ui/button';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { ScrollArea } from '@/components/ui/scroll-area';
import { Badge } from '@/components/ui/badge';
import { Separator } from '@/components/ui/separator';
import { Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle } from '@/components/ui/dialog';
import { Textarea } from '@/components/ui/textarea';
import { Label } from '@/components/ui/label';
import { Loader2, Upload, Download, Trash2, RefreshCw } from 'lucide-react';

interface ProfessionalData {
  id: number;
  year: number;
  major: string;
  category?: string;
  description?: string;
  level?: string;
  department?: string;
}

interface ProfessionalDataInput {
  year: number;
  major: string;
  category?: string;
  description?: string;
  level?: string;
  department?: string;
}

export default function ProfessionalHistoryPage() {
  const [data, setData] = useState<ProfessionalData[]>([]);
  const [loading, setLoading] = useState(true);
  const [selectedItem, setSelectedItem] = useState<ProfessionalData | null>(null);
  const [importDialog, setImportDialog] = useState(false);
  const [importText, setImportText] = useState('');
  const [importLoading, setImportLoading] = useState(false);
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const [hoveredItem, setHoveredItem] = useState<number | null>(null);
  const rotationRef = useRef(0);

  // 获取数据
  const fetchData = async () => {
    try {
      setLoading(true);
      const response = await fetch('/api/professional-history');
      const result = await response.json();

      if (result.success) {
        setData(result.data);
      }
    } catch (error) {
      console.error('Error fetching data:', error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  // 3D螺旋塔渲染
  useEffect(() => {
    if (!canvasRef.current || data.length === 0) return;

    const canvas = canvasRef.current;
    const ctx = canvas.getContext('2d');
    if (!ctx) return;

    // 设置画布尺寸
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

      // 绘制螺旋塔
      data.forEach((item, index) => {
        const level = data.length - index;
        const yPos = centerY - (level * heightPerLevel);
        const angle = rotationRef.current + (index * rotationAngle);
        const radius = baseRadius * (1 - index * 0.015);

        const xPos = centerX + Math.cos(angle) * radius;

        // 绘制连接线
        if (index > 0) {
          const prevAngle = rotationRef.current + ((index - 1) * rotationAngle);
          const prevRadius = baseRadius * (1 - (index - 1) * 0.015);
          const prevYPos = centerY - ((level + 1) * heightPerLevel);
          const prevXPos = centerX + Math.cos(prevAngle) * prevRadius;

          ctx.beginPath();
          ctx.moveTo(prevXPos, prevYPos);
          ctx.lineTo(xPos, yPos);
          ctx.strokeStyle = 'rgba(100, 116, 139, 0.3)';
          ctx.lineWidth = 2;
          ctx.stroke();
        }

        // 绘制节点
        const isHovered = hoveredItem === item.id;
        const isSelected = selectedItem?.id === item.id;
        const size = isHovered || isSelected ? 12 : 8;

        // 节点阴影
        ctx.beginPath();
        ctx.arc(xPos + 3, yPos + 3, size, 0, Math.PI * 2);
        ctx.fillStyle = 'rgba(0, 0, 0, 0.2)';
        ctx.fill();

        // 节点主体
        ctx.beginPath();
        ctx.arc(xPos, yPos, size, 0, Math.PI * 2);

        if (isSelected) {
          ctx.fillStyle = '#3b82f6';
        } else if (isHovered) {
          ctx.fillStyle = '#60a5fa';
        } else {
          ctx.fillStyle = '#94a3b8';
        }

        ctx.fill();

        // 节点边框
        ctx.strokeStyle = 'white';
        ctx.lineWidth = 2;
        ctx.stroke();

        // 年份标签
        ctx.font = 'bold 12px sans-serif';
        ctx.fillStyle = isSelected ? '#3b82f6' : '#64748b';
        ctx.textAlign = 'center';
        ctx.fillText(item.year.toString(), xPos, yPos - size - 5);

        // 专业名称（如果被选中或悬停）
        if (isHovered || isSelected) {
          ctx.font = '11px sans-serif';
          ctx.fillStyle = '#1e293b';
          const maxWidth = 120;
          const words = item.major.split('');
          let line = '';
          let y = yPos + size + 15;

          for (let i = 0; i < words.length; i++) {
            const testLine = line + words[i];
            const metrics = ctx.measureText(testLine);

            if (metrics.width > maxWidth && i > 0) {
              ctx.fillText(line, xPos, y);
              line = words[i];
              y += 14;
            } else {
              line = testLine;
            }
          }

          ctx.fillText(line, xPos, y);
        }
      });

      // 自动旋转
      rotationRef.current += 0.002;

      requestAnimationFrame(animate);
    };

    animate();

    return () => {
      // 清理
    };
  }, [data, hoveredItem, selectedItem]);

  // 处理鼠标移动
  const handleMouseMove = (e: React.MouseEvent<HTMLCanvasElement>) => {
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

    let foundId: number | null = null;

    data.forEach((item, index) => {
      const level = data.length - index;
      const yPos = centerY - (level * heightPerLevel);
      const angle = rotationRef.current + (index * rotationAngle);
      const radius = baseRadius * (1 - index * 0.015);
      const xPos = centerX + Math.cos(angle) * radius;

      const distance = Math.sqrt((x - xPos) ** 2 + (y - yPos) ** 2);

      if (distance < 15) {
        foundId = item.id;
      }
    });

    setHoveredItem(foundId);
  };

  // 处理点击
  const handleClick = () => {
    if (hoveredItem) {
      const item = data.find((d) => d.id === hoveredItem);
      if (item) {
        setSelectedItem(item);
      }
    }
  };

  // 导入数据
  const handleImport = async () => {
    try {
      setImportLoading(true);

      const lines = importText.trim().split('\n');
      const parsedData: ProfessionalDataInput[] = [];

      // 假设第一行是标题，从第二行开始解析数据
      for (let i = 1; i < lines.length; i++) {
        const values = lines[i].split(',');
        if (values.length >= 2) {
          parsedData.push({
            year: parseInt(values[0].trim()) || 0,
            major: values[1].trim(),
            category: values[2]?.trim(),
            description: values[3]?.trim(),
            level: values[4]?.trim(),
            department: values[5]?.trim(),
          });
        }
      }

      const response = await fetch('/api/professional-history/bulk', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ data: parsedData }),
      });

      const result = await response.json();

      if (result.success) {
        alert(`成功导入 ${result.count} 条数据`);
        setImportDialog(false);
        setImportText('');
        fetchData();
      } else {
        alert('导入失败: ' + result.error);
      }
    } catch (error) {
      console.error('Error importing data:', error);
      alert('导入失败');
    } finally {
      setImportLoading(false);
    }
  };

  // 清空数据
  const handleClear = async () => {
    if (!confirm('确定要清空所有数据吗？')) return;

    try {
      const response = await fetch('/api/professional-history/clear', {
        method: 'DELETE',
      });

      const result = await response.json();

      if (result.success) {
        alert(`已删除 ${result.count} 条数据`);
        fetchData();
      }
    } catch (error) {
      console.error('Error clearing data:', error);
      alert('清空失败');
    }
  };

  // 导出数据
  const handleExport = () => {
    const csv =
      'ID,Year,Major,Category,Description,Level,Department\n' +
      data
        .map(
          (item) =>
            `${item.id},${item.year},${item.major},${item.category || ''},${item.description || ''},${item.level || ''},${item.department || ''}`
        )
        .join('\n');

    const blob = new Blob([csv], { type: 'text/csv' });
    const url = window.URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = 'professional-history.csv';
    a.click();
    window.URL.revokeObjectURL(url);
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100 dark:from-slate-900 dark:to-slate-800">
      <div className="container mx-auto p-6">
        {/* 头部 */}
        <div className="mb-8">
          <h1 className="text-4xl font-bold text-slate-900 dark:text-slate-50 mb-2">
            专业沿革螺旋塔
          </h1>
          <p className="text-slate-600 dark:text-slate-400">
            可视化展示专业发展历程与演变
          </p>
        </div>

        {/* 操作按钮 */}
        <div className="flex gap-3 mb-6">
          <Button onClick={fetchData} variant="outline" size="sm">
            <RefreshCw className="w-4 h-4 mr-2" />
            刷新
          </Button>
          <Button onClick={() => setImportDialog(true)} variant="outline" size="sm">
            <Upload className="w-4 h-4 mr-2" />
            导入数据
          </Button>
          <Button onClick={handleExport} variant="outline" size="sm">
            <Download className="w-4 h-4 mr-2" />
            导出数据
          </Button>
          <Button onClick={handleClear} variant="outline" size="sm" className="text-red-600">
            <Trash2 className="w-4 h-4 mr-2" />
            清空数据
          </Button>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
          {/* 螺旋塔可视化 */}
          <Card className="lg:col-span-2">
            <CardHeader>
              <CardTitle>3D 螺旋塔视图</CardTitle>
              <CardDescription>点击节点查看详细信息</CardDescription>
            </CardHeader>
            <CardContent>
              <div className="relative w-full h-[600px] bg-gradient-to-b from-slate-50 to-slate-100 dark:from-slate-800 dark:to-slate-900 rounded-lg overflow-hidden">
                {loading ? (
                  <div className="absolute inset-0 flex items-center justify-center">
                    <Loader2 className="w-8 h-8 animate-spin text-slate-400" />
                  </div>
                ) : data.length === 0 ? (
                  <div className="absolute inset-0 flex items-center justify-center text-slate-400">
                    <div className="text-center">
                      <p className="mb-2">暂无数据</p>
                      <Button onClick={() => setImportDialog(true)} size="sm">
                        导入数据
                      </Button>
                    </div>
                  </div>
                ) : (
                  <canvas
                    ref={canvasRef}
                    onMouseMove={handleMouseMove}
                    onClick={handleClick}
                    className="w-full h-full cursor-pointer"
                  />
                )}
              </div>
            </CardContent>
          </Card>

          {/* 详细信息面板 */}
          <Card>
            <CardHeader>
              <CardTitle>详细信息</CardTitle>
              <CardDescription>选中节点的详细内容</CardDescription>
            </CardHeader>
            <CardContent>
              <ScrollArea className="h-[600px] pr-4">
                {selectedItem ? (
                  <div className="space-y-4">
                    <div>
                      <Label className="text-sm font-medium text-slate-600">年份</Label>
                      <p className="text-2xl font-bold text-slate-900 dark:text-slate-50">
                        {selectedItem.year}
                      </p>
                    </div>

                    <Separator />

                    <div>
                      <Label className="text-sm font-medium text-slate-600">专业名称</Label>
                      <p className="text-lg font-semibold text-slate-900 dark:text-slate-50">
                        {selectedItem.major}
                      </p>
                    </div>

                    {selectedItem.category && (
                      <>
                        <Separator />
                        <div>
                          <Label className="text-sm font-medium text-slate-600">类别</Label>
                          <Badge variant="secondary">{selectedItem.category}</Badge>
                        </div>
                      </>
                    )}

                    {selectedItem.level && (
                      <>
                        <Separator />
                        <div>
                          <Label className="text-sm font-medium text-slate-600">层级</Label>
                          <Badge variant="outline">{selectedItem.level}</Badge>
                        </div>
                      </>
                    )}

                    {selectedItem.department && (
                      <>
                        <Separator />
                        <div>
                          <Label className="text-sm font-medium text-slate-600">部门/学院</Label>
                          <p className="text-slate-900 dark:text-slate-50">{selectedItem.department}</p>
                        </div>
                      </>
                    )}

                    {selectedItem.description && (
                      <>
                        <Separator />
                        <div>
                          <Label className="text-sm font-medium text-slate-600">描述</Label>
                          <p className="text-sm text-slate-700 dark:text-slate-300 leading-relaxed">
                            {selectedItem.description}
                          </p>
                        </div>
                      </>
                    )}
                  </div>
                ) : (
                  <div className="flex items-center justify-center h-full text-slate-400">
                    <p>点击螺旋塔节点查看详细信息</p>
                  </div>
                )}
              </ScrollArea>
            </CardContent>
          </Card>
        </div>

        {/* 数据列表 */}
        <Card className="mt-6">
          <CardHeader>
            <CardTitle>数据列表 ({data.length} 条)</CardTitle>
          </CardHeader>
          <CardContent>
            <ScrollArea className="h-[300px]">
              <div className="space-y-2">
                {data.map((item) => (
                  <div
                    key={item.id}
                    className={`p-4 rounded-lg border transition-colors cursor-pointer ${
                      selectedItem?.id === item.id
                        ? 'border-blue-500 bg-blue-50 dark:bg-blue-950'
                        : 'border-slate-200 hover:border-slate-300'
                    }`}
                    onClick={() => setSelectedItem(item)}
                  >
                    <div className="flex items-start justify-between">
                      <div className="flex-1">
                        <div className="flex items-center gap-2 mb-1">
                          <Badge variant="outline" className="text-xs">
                            {item.year}
                          </Badge>
                          <span className="font-semibold text-slate-900 dark:text-slate-50">
                            {item.major}
                          </span>
                        </div>
                        {item.category && (
                          <p className="text-sm text-slate-600 dark:text-slate-400">
                            {item.category}
                          </p>
                        )}
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </ScrollArea>
          </CardContent>
        </Card>
      </div>

      {/* 导入对话框 */}
      <Dialog open={importDialog} onOpenChange={setImportDialog}>
        <DialogContent className="max-w-2xl">
          <DialogHeader>
            <DialogTitle>导入数据</DialogTitle>
            <DialogDescription>
              请输入 CSV 格式数据（第一行为标题）：年份,专业名称,类别,描述,层级,部门
            </DialogDescription>
          </DialogHeader>
          <div className="space-y-4">
            <div>
              <Label htmlFor="import-text">数据内容</Label>
              <Textarea
                id="import-text"
                value={importText}
                onChange={(e) => setImportText(e.target.value)}
                placeholder="2020,计算机科学与技术,工学,计算机相关专业,本科,计算机学院&#10;2021,软件工程,工学,软件开发专业,本科,软件学院"
                rows={10}
                className="font-mono text-sm"
              />
            </div>
            <div className="flex justify-end gap-3">
              <Button variant="outline" onClick={() => setImportDialog(false)}>
                取消
              </Button>
              <Button onClick={handleImport} disabled={importLoading}>
                {importLoading ? (
                  <>
                    <Loader2 className="w-4 h-4 mr-2 animate-spin" />
                    导入中...
                  </>
                ) : (
                  <>
                    <Upload className="w-4 h-4 mr-2" />
                    导入
                  </>
                )}
              </Button>
            </div>
          </div>
        </DialogContent>
      </Dialog>
    </div>
  );
}
