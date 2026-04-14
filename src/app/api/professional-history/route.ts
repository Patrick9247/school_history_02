import { NextRequest, NextResponse } from 'next/server';

// FastAPI 后端地址
const FASTAPI_BASE_URL = process.env.FASTAPI_URL || 'http://localhost:8000';

export async function GET(request: NextRequest) {
  try {
    const { searchParams } = new URL(request.url);
    const year = searchParams.get('year');
    const category = searchParams.get('category');

    // 构建查询参数 - 获取更多数据以展示完整星系
    const queryParams = new URLSearchParams();
    queryParams.set('limit', '7000'); // 获取全部数据
    if (year) queryParams.set('year', year);

    const url = `/api/majors?${queryParams.toString()}`;

    // 从 FastAPI 后端获取数据
    const response = await fetch(`${FASTAPI_BASE_URL}${url}`, {
      headers: { 'Content-Type': 'application/json' },
      signal: AbortSignal.timeout(30000), // 30秒超时
    });

    if (!response.ok) {
      throw new Error(`Backend API error: ${response.status}`);
    }

    const result = await response.json();

    if (!result.success) {
      throw new Error(result.error || 'Failed to fetch data from backend');
    }

    // 处理分页响应格式
    let data = result.data?.items || result.data || [];

    // 按年份排序
    data.sort((a: { year?: number }, b: { year?: number }) => (b.year || 0) - (a.year || 0));

    // 过滤
    if (year) {
      data = data.filter((item: { year?: number }) => item.year === parseInt(year));
    }

    if (category) {
      data = data.filter((item: { category?: string; college_name?: string }) => 
        item.category === category || item.college_name === category
      );
    }

    // 转换数据格式以兼容前端
    const transformedData = data.map((item: { 
      id: number; 
      name: string; 
      year?: number; 
      category?: string;
      college_name?: string;
      description?: string; 
      level?: string; 
      department?: string;
    }) => ({
      id: item.id,
      major: item.name,
      year: item.year,
      category: item.category || item.college_name,
      description: item.description,
      level: item.level,
      department: item.department,
    }));

    return NextResponse.json({
      success: true,
      data: transformedData,
    });
  } catch (error: unknown) {
    console.error('Error fetching professional history:', error);
    return NextResponse.json(
      {
        success: false,
        error: error instanceof Error ? error.message : 'Failed to fetch data',
      },
      { status: 500 }
    );
  }
}
