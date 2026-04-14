'use client';

import { useState, useEffect, useCallback, useMemo } from 'react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table';
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogFooter,
} from '@/components/ui/dialog';
import { Badge } from '@/components/ui/badge';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { toast } from 'sonner';
import {
  Pagination,
  PaginationContent,
  PaginationItem,
  PaginationLink,
  PaginationPrevious,
  PaginationNext,
} from '@/components/ui/pagination';

interface College {
  id: number;
  name: string;
  color?: string;
  established_year?: number;
  description?: string;
}

const COLOR_OPTIONS = [
  { name: '蓝色', value: '#3b82f6' },
  { name: '绿色', value: '#10b981' },
  { name: '橙色', value: '#f59e0b' },
  { name: '红色', value: '#ef4444' },
  { name: '紫色', value: '#8b5cf6' },
  { name: '粉色', value: '#ec4899' },
  { name: '青色', value: '#06b6d4' },
  { name: '靛蓝', value: '#6366f1' },
];

export default function CollegesPage() {
  const [colleges, setColleges] = useState<College[]>([]);
  const [loading, setLoading] = useState(true);
  const [dialogOpen, setDialogOpen] = useState(false);
  const [editingCollege, setEditingCollege] = useState<College | null>(null);
  const [formData, setFormData] = useState({
    name: '',
    color: '#3b82f6',
    established_year: '',
    description: '',
  });

  // 分页状态
  const [currentPage, setCurrentPage] = useState(1);
  const pageSize = 10;

  // 计算分页数据
  const totalPages = Math.ceil(colleges.length / pageSize);
  const paginatedColleges = useMemo(() => {
    const start = (currentPage - 1) * pageSize;
    return colleges.slice(start, start + pageSize);
  }, [colleges, currentPage, pageSize]);

  // 获取学院列表
  const fetchColleges = useCallback(async () => {
    try {
      const res = await fetch('/api/colleges');
      const data = await res.json();
      if (data.success) {
        setColleges(data.data || []);
        setCurrentPage(1); // 重置到第一页
      }
    } catch (error) {
      toast.error('获取学院数据失败');
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    fetchColleges();
  }, [fetchColleges]);

  // 打开创建对话框
  const openCreateDialog = () => {
    setEditingCollege(null);
    setFormData({ name: '', color: '#3b82f6', established_year: '', description: '' });
    setDialogOpen(true);
  };

  // 打开编辑对话框
  const openEditDialog = (college: College) => {
    setEditingCollege(college);
    setFormData({
      name: college.name,
      color: college.color || '#3b82f6',
      established_year: college.established_year ? String(college.established_year) : '',
      description: college.description || '',
    });
    setDialogOpen(true);
  };

  // 保存学院
  const handleSave = async () => {
    if (!formData.name.trim()) {
      toast.error('学院名称不能为空');
      return;
    }

    try {
      const payload = {
        name: formData.name.trim(),
        color: formData.color,
        established_year: formData.established_year ? parseInt(formData.established_year) : null,
        description: formData.description || null,
      };

      const url = editingCollege
        ? `/api/colleges?name=${encodeURIComponent(editingCollege.name)}`
        : '/api/colleges';

      const res = await fetch(url, {
        method: editingCollege ? 'PUT' : 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload),
      });

      const data = await res.json();
      if (data.success) {
        toast.success(editingCollege ? '学院更新成功' : '学院创建成功');
        setDialogOpen(false);
        fetchColleges();
      } else {
        toast.error(data.error || '操作失败');
      }
    } catch (error) {
      toast.error('操作失败');
    }
  };

  // 删除学院
  const handleDelete = async (college: College) => {
    if (!confirm(`确定要删除 "${college.name}" 吗？`)) return;

    try {
      const res = await fetch(`/api/colleges?name=${encodeURIComponent(college.name)}`, {
        method: 'DELETE',
      });
      const data = await res.json();
      if (data.success) {
        toast.success('删除成功');
        fetchColleges();
      } else {
        toast.error(data.error || '删除失败');
      }
    } catch (error) {
      toast.error('删除失败');
    }
  };

  return (
    <div className="space-y-6">
      {/* 统计卡片 */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm font-medium text-gray-500">学院总数</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-3xl font-bold">{colleges.length}</div>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm font-medium text-gray-500">学院列表</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="flex flex-wrap gap-1">
              {colleges.slice(0, 8).map((college) => (
                <span
                  key={college.id}
                  className="px-2 py-1 text-xs rounded"
                  style={{ backgroundColor: (college.color || '#3b82f6') + '20', color: college.color || '#3b82f6' }}
                >
                  {college.name.substring(0, 4)}
                </span>
              ))}
              {colleges.length > 8 && (
                <span className="px-2 py-1 text-xs text-gray-500">+{colleges.length - 8} more</span>
              )}
            </div>
          </CardContent>
        </Card>
      </div>

      {/* 操作栏 */}
      <div className="flex items-center justify-between">
        <h2 className="text-xl font-semibold">学院列表</h2>
        <Button onClick={openCreateDialog}>+ 添加学院</Button>
      </div>

      {/* 数据表格 */}
      <div className="bg-white rounded-lg shadow overflow-hidden">
        <Table>
          <TableHeader>
            <TableRow>
              <TableHead className="w-16">颜色</TableHead>
              <TableHead>学院名称</TableHead>
              <TableHead className="w-28">成立年份</TableHead>
              <TableHead>描述</TableHead>
              <TableHead className="text-right">操作</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {loading ? (
              <TableRow>
                <TableCell colSpan={5} className="text-center py-8 text-gray-500">
                  加载中...
                </TableCell>
              </TableRow>
            ) : colleges.length === 0 ? (
              <TableRow>
                <TableCell colSpan={5} className="text-center py-8 text-gray-500">
                  暂无数据
                </TableCell>
              </TableRow>
            ) : (
              paginatedColleges.map((college) => (
                <TableRow key={college.id}>
                  <TableCell>
                    <div
                      className="w-6 h-6 rounded-full border"
                      style={{ backgroundColor: college.color || '#3b82f6' }}
                    />
                  </TableCell>
                  <TableCell className="font-medium">{college.name}</TableCell>
                  <TableCell className="text-gray-600">
                    {college.established_year || <span className="text-gray-400">-</span>}
                  </TableCell>
                  <TableCell className="text-gray-600 max-w-xs truncate">
                    {college.description || <span className="text-gray-400">-</span>}
                  </TableCell>
                  <TableCell className="text-right">
                    <div className="flex items-center justify-end gap-2">
                      <Button
                        variant="ghost"
                        size="sm"
                        onClick={() => openEditDialog(college)}
                      >
                        编辑
                      </Button>
                      <Button
                        variant="ghost"
                        size="sm"
                        className="text-red-600 hover:text-red-700"
                        onClick={() => handleDelete(college)}
                      >
                        删除
                      </Button>
                    </div>
                  </TableCell>
                </TableRow>
              ))
            )}
          </TableBody>
        </Table>

        {/* 分页 */}
        {totalPages > 1 && (
          <div className="px-4 py-3 border-t">
            <div className="flex items-center justify-between">
              <div className="text-sm text-gray-500">
                共 {colleges.length} 条，第 {currentPage}/{totalPages} 页
              </div>
              <Pagination>
                <PaginationContent>
                  <PaginationItem>
                    <PaginationPrevious
                      onClick={() => setCurrentPage(p => Math.max(1, p - 1))}
                      className={currentPage === 1 ? 'pointer-events-none opacity-50' : 'cursor-pointer'}
                    />
                  </PaginationItem>
                  {Array.from({ length: totalPages }, (_, i) => i + 1).map(page => (
                    <PaginationItem key={page}>
                      <PaginationLink
                        isActive={currentPage === page}
                        onClick={() => setCurrentPage(page)}
                        className="cursor-pointer"
                      >
                        {page}
                      </PaginationLink>
                    </PaginationItem>
                  ))}
                  <PaginationItem>
                    <PaginationNext
                      onClick={() => setCurrentPage(p => Math.min(totalPages, p + 1))}
                      className={currentPage === totalPages ? 'pointer-events-none opacity-50' : 'cursor-pointer'}
                    />
                  </PaginationItem>
                </PaginationContent>
              </Pagination>
            </div>
          </div>
        )}
      </div>

      {/* 创建/编辑对话框 */}
      <Dialog open={dialogOpen} onOpenChange={setDialogOpen}>
        <DialogContent className="max-w-lg">
          <DialogHeader>
            <DialogTitle>{editingCollege ? '编辑学院' : '添加学院'}</DialogTitle>
          </DialogHeader>
          <div className="space-y-4 py-4">
            <div className="space-y-2">
              <label className="text-sm font-medium">学院名称</label>
              <Input
                value={formData.name}
                onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                placeholder="如：地球与行星科学学院"
                disabled={!!editingCollege}
              />
            </div>
            <div className="space-y-2">
              <label className="text-sm font-medium">代表颜色</label>
              <div className="flex flex-wrap gap-2">
                {COLOR_OPTIONS.map((color) => (
                  <button
                    key={color.value}
                    type="button"
                    className={`w-8 h-8 rounded-full border-2 transition-transform ${
                      formData.color === color.value
                        ? 'scale-110 border-gray-800'
                        : 'border-transparent hover:scale-105'
                    }`}
                    style={{ backgroundColor: color.value }}
                    onClick={() => setFormData({ ...formData, color: color.value })}
                    title={color.name}
                  />
                ))}
              </div>
            </div>
            <div className="space-y-2">
              <label className="text-sm font-medium">成立年份</label>
              <Input
                type="number"
                value={formData.established_year}
                onChange={(e) => setFormData({ ...formData, established_year: e.target.value })}
                placeholder="如：1956"
              />
            </div>
            <div className="space-y-2">
              <label className="text-sm font-medium">描述</label>
              <Input
                value={formData.description}
                onChange={(e) => setFormData({ ...formData, description: e.target.value })}
                placeholder="学院描述（可选）"
              />
            </div>
          </div>
          <DialogFooter>
            <Button variant="outline" onClick={() => setDialogOpen(false)}>
              取消
            </Button>
            <Button onClick={handleSave}>{editingCollege ? '保存' : '创建'}</Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>
    </div>
  );
}
