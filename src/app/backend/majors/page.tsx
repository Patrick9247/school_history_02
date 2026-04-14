'use client';

import { useState, useEffect, useCallback, useMemo } from 'react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select';
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
}

interface Year {
  id: number;
  year: number;
}

interface Major {
  id: number;
  year_id: number;
  college_id: number;
  name: string;
  code?: string;
  category?: string;
  description?: string;
  level?: string;
  department?: string;
  year?: number;
  college_name?: string;
}

export default function MajorsPage() {
  const [majors, setMajors] = useState<Major[]>([]);
  const [colleges, setColleges] = useState<College[]>([]);
  const [years, setYears] = useState<Year[]>([]);
  const [loading, setLoading] = useState(true);
  const [dialogOpen, setDialogOpen] = useState(false);
  const [editingMajor, setEditingMajor] = useState<Major | null>(null);
  const [searchTerm, setSearchTerm] = useState('');
  const [filterYear, setFilterYear] = useState<string>('all');
  const [filterCollege, setFilterCollege] = useState<string>('all');
  const [formData, setFormData] = useState({
    name: '',
    year_id: '',
    college_id: '',
    code: '',
    category: '',
    description: '',
    level: '',
    department: '',
  });

  // 分页状态
  const [currentPage, setCurrentPage] = useState(1);
  const pageSize = 20;

  // 计算分页数据
  const totalPages = Math.ceil(majors.length / pageSize);
  const paginatedMajors = useMemo(() => {
    const start = (currentPage - 1) * pageSize;
    return majors.slice(start, start + pageSize);
  }, [majors, currentPage, pageSize]);

  // 获取专业列表
  const fetchMajors = useCallback(async () => {
    try {
      const params = new URLSearchParams();
      if (searchTerm) params.set('search', searchTerm);
      if (filterYear && filterYear !== 'all') params.set('year', filterYear);
      if (filterCollege && filterCollege !== 'all') params.set('college_id', filterCollege);

      const query = params.toString();
      const url = query ? `/api/majors?${query}` : '/api/majors';
      const res = await fetch(url);
      const data = await res.json();
      if (data.success) {
        setMajors(data.data || []);
        setCurrentPage(1); // 重置到第一页
      }
    } catch (error) {
      toast.error('获取专业数据失败');
    } finally {
      setLoading(false);
    }
  }, [searchTerm, filterYear, filterCollege]);

  // 获取学院列表
  const fetchColleges = useCallback(async () => {
    try {
      const res = await fetch('/api/colleges');
      const data = await res.json();
      if (data.success) {
        setColleges(data.data || []);
      }
    } catch (error) {
      console.error('获取学院失败', error);
    }
  }, []);

  // 获取年份列表
  const fetchYears = useCallback(async () => {
    try {
      const res = await fetch('/api/years');
      const data = await res.json();
      if (data.success) {
        setYears(data.data || []);
      }
    } catch (error) {
      console.error('获取年份失败', error);
    }
  }, []);

  useEffect(() => {
    fetchColleges();
    fetchYears();
  }, [fetchColleges, fetchYears]);

  useEffect(() => {
    fetchMajors();
  }, [fetchMajors]);

  // 搜索处理
  const handleSearch = () => {
    fetchMajors();
  };

  // 打开创建对话框
  const openCreateDialog = () => {
    setEditingMajor(null);
    setFormData({
      name: '',
      year_id: '',
      college_id: '',
      code: '',
      category: '',
      description: '',
      level: '四年',
      department: '',
    });
    setDialogOpen(true);
  };

  // 打开编辑对话框
  const openEditDialog = (major: Major) => {
    setEditingMajor(major);
    setFormData({
      name: major.name,
      year_id: String(major.year_id),
      college_id: String(major.college_id),
      code: major.code || '',
      category: major.category || '',
      description: major.description || '',
      level: major.level || '四年',
      department: major.department || '',
    });
    setDialogOpen(true);
  };

  // 保存专业
  const handleSave = async () => {
    if (!formData.name.trim()) {
      toast.error('专业名称不能为空');
      return;
    }
    if (!formData.year_id) {
      toast.error('请选择年份');
      return;
    }
    if (!formData.college_id) {
      toast.error('请选择学院');
      return;
    }

    try {
      let res;
      if (editingMajor) {
        const payload = {
          id: editingMajor.id,
          name: formData.name.trim(),
          year_id: parseInt(formData.year_id),
          college_id: parseInt(formData.college_id),
          code: formData.code || null,
          category: colleges.find(c => c.id === parseInt(formData.college_id))?.name || null,
          description: formData.description || null,
          level: formData.level || null,
          department: formData.department || null,
        };
        res = await fetch('/api/majors', {
          method: 'PUT',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(payload),
        });
      } else {
        const payload = {
          name: formData.name.trim(),
          year_id: parseInt(formData.year_id),
          college_id: parseInt(formData.college_id),
          code: formData.code || null,
          category: colleges.find(c => c.id === parseInt(formData.college_id))?.name || null,
          description: formData.description || null,
          level: formData.level || null,
          department: formData.department || null,
        };
        res = await fetch('/api/majors', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(payload),
        });
      }

      const data = await res.json();
      if (data.success) {
        toast.success(editingMajor ? '专业更新成功' : '专业创建成功');
        setDialogOpen(false);
        fetchMajors();
      } else {
        toast.error(data.error || '操作失败');
      }
    } catch (error) {
      toast.error('操作失败');
    }
  };

  // 删除专业
  const handleDelete = async (major: Major) => {
    if (!confirm(`确定要删除 "${major.name}" 吗？`)) return;

    try {
      const res = await fetch(`/api/majors?id=${major.id}`, {
        method: 'DELETE',
      });
      const data = await res.json();
      if (data.success) {
        toast.success('删除成功');
        fetchMajors();
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
            <CardTitle className="text-sm font-medium text-gray-500">专业总数</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-3xl font-bold">{majors.length}</div>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm font-medium text-gray-500">涉及学院</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-3xl font-bold">{new Set(majors.map(m => m.college_id)).size}</div>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm font-medium text-gray-500">涉及年份</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-3xl font-bold">{new Set(majors.map(m => m.year)).size}</div>
          </CardContent>
        </Card>
      </div>

      {/* 筛选栏 */}
      <div className="bg-white rounded-lg shadow p-4">
        <div className="flex flex-wrap gap-4">
          <div className="flex-1 min-w-[200px]">
            <Input
              placeholder="搜索专业名称..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              onKeyDown={(e) => e.key === 'Enter' && handleSearch()}
            />
          </div>
          <Select value={filterYear} onValueChange={setFilterYear}>
            <SelectTrigger className="w-32">
              <SelectValue placeholder="选择年份" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="all">全部年份</SelectItem>
              {years.map((year) => (
                <SelectItem key={year.id} value={String(year.year)}>
                  {year.year}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>
          <Select value={filterCollege} onValueChange={setFilterCollege}>
            <SelectTrigger className="w-48">
              <SelectValue placeholder="选择学院" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="all">全部学院</SelectItem>
              {colleges.map((college) => (
                <SelectItem key={college.id} value={String(college.id)}>
                  {college.name}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>
          <Button onClick={handleSearch}>搜索</Button>
          <Button variant="outline" onClick={() => {
            setSearchTerm('');
            setFilterYear('all');
            setFilterCollege('all');
          }}>
            重置
          </Button>
          <Button onClick={openCreateDialog}>+ 添加专业</Button>
        </div>
      </div>

      {/* 数据表格 */}
      <div className="bg-white rounded-lg shadow overflow-hidden">
        <div className="overflow-x-auto">
          <Table>
            <TableHeader>
              <TableRow>
                <TableHead className="w-24">年份</TableHead>
                <TableHead>专业名称</TableHead>
                <TableHead>学院</TableHead>
                <TableHead className="w-20">学制</TableHead>
                <TableHead>系部</TableHead>
                <TableHead className="w-20 text-right">操作</TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {loading ? (
                <TableRow>
                  <TableCell colSpan={6} className="text-center py-8 text-gray-500">
                    加载中...
                  </TableCell>
                </TableRow>
              ) : majors.length === 0 ? (
                <TableRow>
                  <TableCell colSpan={6} className="text-center py-8 text-gray-500">
                    暂无数据
                  </TableCell>
                </TableRow>
              ) : (
                paginatedMajors.map((major) => (
                  <TableRow key={major.id}>
                    <TableCell>
                      <Badge variant="secondary">{major.year || '-'}</Badge>
                    </TableCell>
                    <TableCell className="font-medium">{major.name}</TableCell>
                    <TableCell className="text-gray-600 max-w-[200px] truncate">
                      {major.college_name || major.category || '-'}
                    </TableCell>
                    <TableCell className="text-gray-600">
                      {major.level || '-'}
                    </TableCell>
                    <TableCell className="text-gray-600 max-w-[200px] truncate">
                      {major.department || '-'}
                    </TableCell>
                    <TableCell className="text-right">
                      <div className="flex items-center justify-end gap-2">
                        <Button
                          variant="ghost"
                          size="sm"
                          onClick={() => openEditDialog(major)}
                        >
                          编辑
                        </Button>
                        <Button
                          variant="ghost"
                          size="sm"
                          className="text-red-600 hover:text-red-700"
                          onClick={() => handleDelete(major)}
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
        </div>

        {/* 分页 */}
        {totalPages > 1 && (
          <div className="px-4 py-3 border-t">
            <div className="flex items-center justify-between">
              <div className="text-sm text-gray-500">
                共 {majors.length} 条，第 {currentPage}/{totalPages} 页
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
        <DialogContent className="max-w-2xl">
          <DialogHeader>
            <DialogTitle>{editingMajor ? '编辑专业' : '添加专业'}</DialogTitle>
          </DialogHeader>
          <div className="space-y-4 py-4 max-h-[60vh] overflow-y-auto">
            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-2">
                <label className="text-sm font-medium">专业名称</label>
                <Input
                  value={formData.name}
                  onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                  placeholder="如：地质学"
                />
              </div>
              <div className="space-y-2">
                <label className="text-sm font-medium">专业代码</label>
                <Input
                  value={formData.code}
                  onChange={(e) => setFormData({ ...formData, code: e.target.value })}
                  placeholder="如：070901"
                />
              </div>
            </div>
            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-2">
                <label className="text-sm font-medium">年份</label>
                <Select value={formData.year_id} onValueChange={(v) => setFormData({ ...formData, year_id: v })}>
                  <SelectTrigger>
                    <SelectValue placeholder="选择年份" />
                  </SelectTrigger>
                  <SelectContent>
                    {years.map((year) => (
                      <SelectItem key={year.id} value={String(year.id)}>
                        {year.year}
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>
              </div>
              <div className="space-y-2">
                <label className="text-sm font-medium">学院</label>
                <Select value={formData.college_id} onValueChange={(v) => setFormData({ ...formData, college_id: v })}>
                  <SelectTrigger>
                    <SelectValue placeholder="选择学院" />
                  </SelectTrigger>
                  <SelectContent>
                    {colleges.map((college) => (
                      <SelectItem key={college.id} value={String(college.id)}>
                        {college.name}
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>
              </div>
            </div>
            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-2">
                <label className="text-sm font-medium">学制</label>
                <Select value={formData.level} onValueChange={(v) => setFormData({ ...formData, level: v })}>
                  <SelectTrigger>
                    <SelectValue placeholder="选择学制" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="四年">四年</SelectItem>
                    <SelectItem value="五年">五年</SelectItem>
                  </SelectContent>
                </Select>
              </div>
              <div className="space-y-2">
                <label className="text-sm font-medium">系部</label>
                <Input
                  value={formData.department}
                  onChange={(e) => setFormData({ ...formData, department: e.target.value })}
                  placeholder="如：地球科学系"
                />
              </div>
            </div>
            <div className="space-y-2">
              <label className="text-sm font-medium">描述</label>
              <Input
                value={formData.description}
                onChange={(e) => setFormData({ ...formData, description: e.target.value })}
                placeholder="专业描述（可选）"
              />
            </div>
          </div>
          <DialogFooter>
            <Button variant="outline" onClick={() => setDialogOpen(false)}>
              取消
            </Button>
            <Button onClick={handleSave}>{editingMajor ? '保存' : '创建'}</Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>
    </div>
  );
}
