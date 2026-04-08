'use client';

import { useState, useEffect, useRef, useCallback } from 'react';

interface LoadingScreenProps {
  onLoaded: () => void;
  minDisplayTime?: number; // 最小显示时间，避免闪烁
}

export default function LoadingScreen({ onLoaded, minDisplayTime = 1500 }: LoadingScreenProps) {
  const [progress, setProgress] = useState(0);
  const [fadeOut, setFadeOut] = useState(false);
  const [isCompleted, setIsCompleted] = useState(false);
  const startTimeRef = useRef<number>(Date.now());
  const hasTriggeredRef = useRef(false);

  // 处理加载完成的回调
  const handleComplete = useCallback(() => {
    if (hasTriggeredRef.current) return;
    hasTriggeredRef.current = true;
    
    setFadeOut(true);
    setTimeout(() => {
      setIsCompleted(true);
      onLoaded();
    }, 500);
  }, [onLoaded]);

  useEffect(() => {
    const startTime = startTimeRef.current;
    
    // 模拟加载进度
    const interval = setInterval(() => {
      setProgress(prev => {
        // 进度增长递减，接近100%时放慢
        const increment = prev < 80 ? 8 : prev < 95 ? 3 : 1;
        const newProgress = Math.min(prev + increment, 100);
        return newProgress;
      });
    }, 100);

    // 检查是否应该完成加载
    const checkLoaded = setInterval(() => {
      const elapsed = Date.now() - startTime;
      // 至少显示 minDisplayTime ms，或者进度接近100%
      if (elapsed >= minDisplayTime || progress >= 99) {
        handleComplete();
      }
    }, 50);

    return () => {
      clearInterval(interval);
      clearInterval(checkLoaded);
    };
  }, [minDisplayTime, progress, handleComplete]);

  // 如果已完成，直接返回 null
  if (isCompleted) {
    return null;
  }

  return (
    <div 
      className={`fixed inset-0 z-[100] flex flex-col items-center justify-center transition-opacity duration-500 ${
        fadeOut ? 'opacity-0' : 'opacity-100'
      }`}
      style={{
        background: 'radial-gradient(circle at 50% 50%, #1a1a2e 0%, #0f0f1a 50%, #050510 100%)'
      }}
    >
      {/* 背景星星 */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none">
        {Array.from({ length: 50 }).map((_, i) => (
          <div
            key={i}
            className="absolute rounded-full bg-white animate-pulse"
            style={{
              width: `${i % 5 === 0 ? 2 : 1}px`,
              height: `${i % 5 === 0 ? 2 : 1}px`,
              left: `${((i * 12345) % 100)}%`,
              top: `${((i * 54321) % 100)}%`,
              opacity: 0.3 + (i % 30) / 100,
              animationDuration: `${1.5 + (i % 20) / 10}s`,
              animationDelay: `${(i % 20) / 10}s`,
              animationIterationCount: 'infinite'
            }}
          />
        ))}
      </div>

      {/* 标题 */}
      <h1 
        className="text-xl md:text-2xl font-semibold text-blue-400 tracking-wider mb-8"
        style={{ textShadow: '0 0 20px rgba(96, 165, 250, 0.5)' }}
      >
        成都理工大学专业沿革星系图
      </h1>

      {/* 进度条容器 */}
      <div className="relative w-64 md:w-80">
        {/* 背景轨道 */}
        <div 
          className="absolute inset-0 rounded-full"
          style={{
            background: 'rgba(30, 30, 50, 0.8)',
            boxShadow: 'inset 0 0 10px rgba(0, 0, 0, 0.5)'
          }}
        />
        
        {/* 进度条 */}
        <div 
          className="absolute inset-0 rounded-full transition-all duration-300"
          style={{
            width: `${progress}%`,
            background: 'linear-gradient(90deg, #3b82f6 0%, #8b5cf6 50%, #06b6d4 100%)',
            boxShadow: '0 0 15px rgba(59, 130, 246, 0.6), 0 0 30px rgba(139, 92, 246, 0.4)'
          }}
        />

        {/* 进度文字 */}
        <div className="relative flex items-center justify-center h-3 md:h-4">
          <span className="text-xs md:text-sm text-white/90 font-medium">
            {Math.round(progress)}%
          </span>
        </div>
      </div>

      {/* 加载提示 */}
      <p className="mt-4 text-xs md:text-sm text-white/50">
        正在加载星图数据...
      </p>
    </div>
  );
}
