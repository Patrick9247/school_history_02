'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';

interface MajorData {
  id: number;
  year: number;
  major: string;
  category?: string;
  description?: string;
  level?: string;
  department?: string;
  code?: string;
  created_at?: string;
  updated_at?: string;
}

export default function MajorCodesPage() {
  const [majors, setMajors] = useState<MajorData[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [filterCategory, setFilterCategory] = useState('');
  const [searchMajor, setSearchMajor] = useState('');
  const [editingId, setEditingId] = useState<number | null>(null);
  const [editingCode, setEditingCode] = useState('');
  const [saving, setSaving] = useState(false);
  const [saveSuccess, setSaveSuccess] = useState<number | null>(null);

  // 获取专业列表
  const fetchMajors = async () => {
    try {
      setLoading(true);
      setError(null);

      const params = new URLSearchParams();
      if (filterCategory) params.append('category', filterCategory);
      if (searchMajor) params.append('major', searchMajor);

      const response = await fetch(`/api/professional-codes?${params.toString()}`);
      const result = await response.json();

      if (result.success) {
        setMajors(result.data);
      } else {
        setError(result.error || 'Failed to fetch data');
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to fetch data');
    } finally {
      setLoading(false);
    }
  };

  // 保存专业代码
  const handleSaveCode = async (id: number) => {
    try {
      setSaving(true);
      setError(null);

      const response = await fetch('/api/professional-codes', {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          id,
          code: editingCode.trim(),
        }),
      });

      const result = await response.json();

      if (result.success) {
        // 更新本地数据
        setMajors(majors.map(m => (m.id === id ? { ...m, code: editingCode.trim() } : m)));
        setEditingId(null);
        setEditingCode('');
        setSaveSuccess(id);

        setTimeout(() => setSaveSuccess(null), 2000);
      } else {
        setError(result.error || 'Failed to save code');
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to save code');
    } finally {
      setSaving(false);
    }
  };

  // 开始编辑
  const handleStartEdit = (id: number, currentCode?: string) => {
    setEditingId(id);
    setEditingCode(currentCode || '');
  };

  // 取消编辑
  const handleCancelEdit = () => {
    setEditingId(null);
    setEditingCode('');
  };

  // 获取所有学院（用于筛选）
  const categories = Array.from(new Set(majors.map(m => m.category).filter(Boolean)));

  useEffect(() => {
    fetchMajors();
  }, [filterCategory, searchMajor]);

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-900 flex items-center justify-center">
        <div className="text-white text-xl">加载中...</div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-900 text-gray-100">
      {/* 顶部导航 */}
      <div className="bg-gray-800 border-b border-gray-700 sticky top-0 z-10">
        <div className="max-w-7xl mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-4">
              <Link
                href="/"
                className="text-blue-400 hover:text-blue-300 transition-colors"
              >
                ← 返回首页
              </Link>
              <h1 className="text-2xl font-bold text-white">专业代码管理</h1>
            </div>
            <div className="text-sm text-gray-400">
              共 {majors.length} 个专业
            </div>
          </div>

          {/* 筛选栏 */}
          <div className="mt-4 flex gap-4 flex-wrap">
            <select
              value={filterCategory}
              onChange={(e) => setFilterCategory(e.target.value)}
              className="bg-gray-700 text-gray-100 px-4 py-2 rounded-lg border border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
              <option value="">全部学院</option>
              {categories.map((cat) => (
                <option key={cat} value={cat}>
                  {cat}
                </option>
              ))}
            </select>
            <input
              type="text"
              placeholder="搜索专业名称..."
              value={searchMajor}
              onChange={(e) => setSearchMajor(e.target.value)}
              className="flex-1 min-w-[200px] bg-gray-700 text-gray-100 px-4 py-2 rounded-lg border border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>
        </div>
      </div>

      {/* 错误提示 */}
      {error && (
        <div className="max-w-7xl mx-auto px-4 py-4">
          <div className="bg-red-900/50 border border-red-700 text-red-200 px-4 py-3 rounded-lg">
            {error}
          </div>
        </div>
      )}

      {/* 专业列表 */}
      <div className="max-w-7xl mx-auto px-4 py-6">
        <div className="bg-gray-800 rounded-lg border border-gray-700 overflow-hidden">
          <table className="w-full">
            <thead>
              <tr className="bg-gray-700/50 border-b border-gray-700">
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase tracking-wider">
                  ID
                </th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase tracking-wider">
                  年份
                </th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase tracking-wider">
                  专业名称
                </th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase tracking-wider">
                  学院
                </th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase tracking-wider">
                  专业代码
                </th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase tracking-wider">
                  学制
                </th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase tracking-wider">
                  操作
                </th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-700">
              {majors.map((major) => (
                <tr
                  key={major.id}
                  className="hover:bg-gray-700/30 transition-colors"
                >
                  <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-400">
                    {major.id}
                  </td>
                  <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-300">
                    {major.year}
                  </td>
                  <td className="px-6 py-4 text-sm text-white font-medium">
                    {major.major}
                  </td>
                  <td className="px-6 py-4 text-sm text-gray-400">
                    {major.category || '-'}
                  </td>
                  <td className="px-6 py-4 text-sm">
                    {editingId === major.id ? (
                      <div className="flex items-center gap-2">
                        <input
                          type="text"
                          value={editingCode}
                          onChange={(e) => setEditingCode(e.target.value)}
                          className="w-32 bg-gray-700 text-white px-3 py-1.5 rounded border border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500"
                          placeholder="输入专业代码"
                          autoFocus
                          onKeyDown={(e) => {
                            if (e.key === 'Enter') {
                              handleSaveCode(major.id);
                            } else if (e.key === 'Escape') {
                              handleCancelEdit();
                            }
                          }}
                        />
                      </div>
                    ) : (
                      <div className="flex items-center gap-2">
                        <span
                          className={
                            major.code
                              ? 'text-green-400 font-mono'
                              : 'text-gray-500'
                          }
                        >
                          {major.code || '未设置'}
                        </span>
                        {saveSuccess === major.id && (
                          <span className="text-green-500">✓</span>
                        )}
                      </div>
                    )}
                  </td>
                  <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-400">
                    {major.level || '-'}
                  </td>
                  <td className="px-6 py-4 whitespace-nowrap text-sm">
                    {editingId === major.id ? (
                      <div className="flex gap-2">
                        <button
                          onClick={() => handleSaveCode(major.id)}
                          disabled={saving}
                          className="px-3 py-1.5 bg-blue-600 hover:bg-blue-700 text-white text-xs rounded transition-colors disabled:opacity-50"
                        >
                          {saving ? '保存中...' : '保存'}
                        </button>
                        <button
                          onClick={handleCancelEdit}
                          className="px-3 py-1.5 bg-gray-600 hover:bg-gray-700 text-white text-xs rounded transition-colors"
                        >
                          取消
                        </button>
                      </div>
                    ) : (
                      <button
                        onClick={() => handleStartEdit(major.id, major.code)}
                        className="px-3 py-1.5 bg-gray-700 hover:bg-gray-600 text-white text-xs rounded transition-colors"
                      >
                        编辑
                      </button>
                    )}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>

          {majors.length === 0 && (
            <div className="px-6 py-12 text-center text-gray-500">
              暂无数据
            </div>
          )}
        </div>
      </div>

      {/* 使用说明 */}
      <div className="max-w-7xl mx-auto px-4 py-6">
        <div className="bg-gray-800 rounded-lg border border-gray-700 p-6">
          <h2 className="text-lg font-semibold text-white mb-3">使用说明</h2>
          <ul className="text-sm text-gray-400 space-y-2">
            <li>• 点击"编辑"按钮可以输入或修改专业代码</li>
            <li>• 专业代码通常为 6 位数字，例如：081401（土木工程）</li>
            <li>• 按回车键快速保存，按 Esc 键取消编辑</li>
            <li>• 可以按学院或专业名称进行筛选</li>
            <li>• 专业代码将在专业详情弹窗中显示</li>
          </ul>
        </div>
      </div>
    </div>
  );
}
