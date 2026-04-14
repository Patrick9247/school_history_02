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

interface Year {
  id: number;
  year: number;
  event?: string;
  dept_count: number;
  major_count: number;
}

export default function YearsPage() {
  const [years, setYears] = useState<Year[]>([]);
  const [loading, setLoading] = useState(true);
  const [dialogOpen, setDialogOpen] = useState(false);
  const [editingYear, setEditingYear] = useState<Year | null>(null);
  const [formData, setFormData] = useState({
    year: '',
    event: '',
    dept_count: '',
    major_count: '',
  });

  // 分页状态
  const [currentPage, setCurrentPage] = useState(1);
  const pageSize = 10;

  // 计算分页数据
  const totalPages = Math.ceil(years.length / pageSize);
  const paginatedYears = useMemo(() => {
    const start = (currentPage - 1) * pageSize;
    return years.slice(start, start + pageSize);
  }, [years, currentPage, pageSize]);

  // 获取年份列表
  const fetchYears = useCallback(async () => {
    try {
      const res = await fetch('/api/years');
      const data = await res.json();
      if (data.success) {
        setYears(data.data || []);
        setCurrentPage(1); // 重置到第一页
      }
    } catch (error) {
      toast.error('获取年份数据失败');
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    fetchYears();
  }, [fetchYears]);

  // 打开创建对话框
  const openCreateDialog = () => {
    setEditingYear(null);
    setFormData({ year: '', event: '', dept_count: '', major_count: '' });
    setDialogOpen(true);
  };

  // 打开编辑对话框
  const openEditDialog = (year: Year) => {
    setEditingYear(year);
    setFormData({
      year: String(year.year),
      event: year.event || '',
      dept_count: String(year.dept_count),
      major_count: String(year.major_count),
    });
    setDialogOpen(true);
  };

  // 保存年份
  const handleSave = async () => {
    try {
      const payload = {
        year: parseInt(formData.year),
        event: formData.event || null,
        dept_count: parseInt(formData.dept_count) || 0,
        major_count: parseInt(formData.major_count) || 0,
      };

      const res = await fetch('/api/years', {
        method: editingYear ? 'PUT' : 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          ...payload,
          id: editingYear?.id,
        }),
      });

      const data = await res.json();
      if (data.success) {
        toast.success(editingYear ? '年份更新成功' : '年份创建成功');
        setDialogOpen(false);
        fetchYears();
      } else {
        toast.error(data.error || '操作失败');
      }
    } catch (error) {
      toast.error('操作失败');
    }
  };

  // 删除年份
  const handleDelete = async (year: Year) => {
    if (!confirm(`确定要删除 ${year.year} 年吗？`)) return;

    try {
      const res = await fetch(`/api/years/${year.year}`, {
        method: 'DELETE',
      });
      const data = await res.json();
      if (data.success) {
        toast.success('删除成功');
        fetchYears();
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
      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm font-medium text-gray-500">年份总数</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-3xl font-bold">{years.length}</div>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm font-medium text-gray-500">最早年份</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-3xl font-bold">{years.length > 0 ? years[years.length - 1].year : '-'}</div>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm font-medium text-gray-500">最新年份</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-3xl font-bold">{years.length > 0 ? years[0].year : '-'}</div>
          </CardContent>
        </Card>
      </div>

      {/* 操作栏 */}
      <div className="flex items-center justify-between">
        <h2 className="text-xl font-semibold">年份列表</h2>
        <Button onClick={openCreateDialog}>+ 添加年份</Button>
      </div>

      {/* 数据表格 */}
      <div className="bg-white rounded-lg shadow">
        <Table>
          <TableHeader>
            <TableRow>
              <TableHead className="w-24">年份</TableHead>
              <TableHead>事件描述</TableHead>
              <TableHead className="text-center">院系数量</TableHead>
              <TableHead className="text-center">专业数量</TableHead>
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
            ) : years.length === 0 ? (
              <TableRow>
                <TableCell colSpan={5} className="text-center py-8 text-gray-500">
                  暂无数据
                </TableCell>
              </TableRow>
            ) : (
              paginatedYears.map((year) => (
                <TableRow key={year.id}>
                  <TableCell className="font-medium">{year.year}</TableCell>
                  <TableCell className="text-gray-600">
                    {year.event || <span className="text-gray-400">-</span>}
                  </TableCell>
                  <TableCell className="text-center">
                    <Badge variant="secondary">{year.dept_count}</Badge>
                  </TableCell>
                  <TableCell className="text-center">
                    <Badge variant="outline">{year.major_count}</Badge>
                  </TableCell>
                  <TableCell className="text-right">
                    <div className="flex items-center justify-end gap-2">
                      <Button
                        variant="ghost"
                        size="sm"
                        onClick={() => openEditDialog(year)}
                      >
                        编辑
                      </Button>
                      <Button
                        variant="ghost"
                        size="sm"
                        className="text-red-600 hover:text-red-700"
                        onClick={() => handleDelete(year)}
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
                共 {years.length} 条，第 {currentPage}/{totalPages} 页
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
        <DialogContent>
          <DialogHeader>
            <DialogTitle>{editingYear ? '编辑年份' : '添加年份'}</DialogTitle>
          </DialogHeader>
          <div className="space-y-4 py-4">
            <div className="space-y-2">
              <label className="text-sm font-medium">年份</label>
              <Input
                type="number"
                value={formData.year}
                onChange={(e) => setFormData({ ...formData, year: e.target.value })}
                placeholder="如：2025"
                disabled={!!editingYear}
              />
            </div>
            <div className="space-y-2">
              <label className="text-sm font-medium">事件描述</label>
              <Input
                value={formData.event}
                onChange={(e) => setFormData({ ...formData, event: e.target.value })}
                placeholder="如：学校更名"
              />
            </div>
            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-2">
                <label className="text-sm font-medium">院系数量</label>
                <Input
                  type="number"
                  value={formData.dept_count}
                  onChange={(e) => setFormData({ ...formData, dept_count: e.target.value })}
                  placeholder="0"
                />
              </div>
              <div className="space-y-2">
                <label className="text-sm font-medium">专业数量</label>
                <Input
                  type="number"
                  value={formData.major_count}
                  onChange={(e) => setFormData({ ...formData, major_count: e.target.value })}
                  placeholder="0"
                />
              </div>
            </div>
          </div>
          <DialogFooter>
            <Button variant="outline" onClick={() => setDialogOpen(false)}>
              取消
            </Button>
            <Button onClick={handleSave}>{editingYear ? '保存' : '创建'}</Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>
    </div>
  );
}
