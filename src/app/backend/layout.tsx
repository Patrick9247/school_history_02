'use client';

import { useState } from 'react';
import Link from 'next/link';
import { usePathname } from 'next/navigation';

interface NavItem {
  name: string;
  path: string;
  icon: string;
}

const navItems: NavItem[] = [
  { name: '年份管理', path: '/backend/years', icon: '📅' },
  { name: '学院管理', path: '/backend/colleges', icon: '🏛️' },
  { name: '专业管理', path: '/backend/majors', icon: '📚' },
];

export default function BackendLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const pathname = usePathname();

  return (
    <div className="min-h-screen bg-gray-100">
      {/* 顶部导航 */}
      <header className="bg-white shadow-sm border-b">
        <div className="max-w-7xl mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-4">
              <h1 className="text-2xl font-bold text-gray-800">📊 数据管理中心</h1>
              <span className="text-sm text-gray-500">成都理工大学专业沿革</span>
            </div>
            <div className="flex items-center gap-4">
              <Link
                href="/"
                className="text-sm text-blue-600 hover:text-blue-800 flex items-center gap-1"
              >
                ← 返回首页
              </Link>
            </div>
          </div>
        </div>
      </header>

      {/* 标签导航 */}
      <nav className="bg-white border-b">
        <div className="max-w-7xl mx-auto px-4">
          <div className="flex gap-1">
            {navItems.map((item) => (
              <Link
                key={item.path}
                href={item.path}
                className={`px-4 py-3 text-sm font-medium border-b-2 transition-colors ${
                  pathname === item.path
                    ? 'border-blue-500 text-blue-600'
                    : 'border-transparent text-gray-600 hover:text-gray-800 hover:border-gray-300'
                }`}
              >
                <span className="mr-2">{item.icon}</span>
                {item.name}
              </Link>
            ))}
          </div>
        </div>
      </nav>

      {/* 主内容区 */}
      <main className="max-w-7xl mx-auto px-4 py-6">
        {children}
      </main>
    </div>
  );
}
