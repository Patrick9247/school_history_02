'use client';

import { useEffect } from 'react';
import { useRouter } from 'next/navigation';

export default function BackendHome() {
  const router = useRouter();

  useEffect(() => {
    router.replace('/backend/years');
  }, [router]);

  return (
    <div className="flex items-center justify-center min-h-[400px]">
      <div className="text-center">
        <div className="text-4xl mb-4">📊</div>
        <h2 className="text-xl font-semibold text-gray-700">数据管理中心</h2>
        <p className="text-gray-500 mt-2">正在跳转...</p>
      </div>
    </div>
  );
}
