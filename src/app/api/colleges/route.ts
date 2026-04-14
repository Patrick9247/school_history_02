/**
 * 学院 API 路由
 * 从 FastAPI 后端获取学院数据
 */
import { NextRequest, NextResponse } from 'next/server';

const FASTAPI_BASE_URL = process.env.FASTAPI_URL || 'http://localhost:8000';

async function fetchFromBackend(path: string) {
  try {
    const response = await fetch(`${FASTAPI_BASE_URL}${path}`, {
      headers: { 'Content-Type': 'application/json' },
      cache: 'no-store' // 禁用缓存，确保实时获取最新数据
    });
    
    if (!response.ok) {
      throw new Error(`Backend API error: ${response.status}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Error fetching from backend: ${path}`, error);
    throw error;
  }
}

/**
 * GET /api/colleges - 获取所有学院
 * GET /api/colleges?name=xxx - 获取指定学院
 * GET /api/colleges?name=xxx&majors=true - 获取学院及其专业
 * GET /api/colleges?name=xxx&stats=true - 获取学院统计
 */
export async function GET(request: NextRequest) {
  const searchParams = request.nextUrl.searchParams;
  const name = searchParams.get('name');
  const majors = searchParams.get('majors');
  const stats = searchParams.get('stats');

  try {
    let data;
    
    if (name) {
      // URL 编码学院名称
      const encodedName = encodeURIComponent(name);
      
      if (majors === 'true') {
        data = await fetchFromBackend(`/api/colleges/${encodedName}/majors`);
      } else if (stats === 'true') {
        data = await fetchFromBackend(`/api/colleges/${encodedName}/stats`);
      } else {
        data = await fetchFromBackend(`/api/colleges/${encodedName}`);
      }
    } else {
      data = await fetchFromBackend('/api/colleges');
    }
    
    return NextResponse.json(data);
  } catch (error) {
    return NextResponse.json(
      { success: false, error: 'Failed to fetch colleges data' },
      { status: 500 }
    );
  }
}

/**
 * POST /api/colleges - 创建学院
 */
export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const response = await fetch(`${FASTAPI_BASE_URL}/api/colleges`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(body)
    });
    
    const data = await response.json();
    return NextResponse.json(data, { status: response.status });
  } catch (error) {
    return NextResponse.json(
      { success: false, error: 'Failed to create college' },
      { status: 500 }
    );
  }
}

/**
 * PUT /api/colleges - 更新学院
 */
export async function PUT(request: NextRequest) {
  try {
    const body = await request.json();
    const name = body.name;
    
    if (!name) {
      return NextResponse.json(
        { success: false, error: 'College name is required' },
        { status: 400 }
      );
    }
    
    const encodedName = encodeURIComponent(name);
    const response = await fetch(`${FASTAPI_BASE_URL}/api/colleges/${encodedName}`, {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(body)
    });
    
    const data = await response.json();
    return NextResponse.json(data, { status: response.status });
  } catch (error) {
    return NextResponse.json(
      { success: false, error: 'Failed to update college' },
      { status: 500 }
    );
  }
}

/**
 * DELETE /api/colleges - 删除学院
 */
export async function DELETE(request: NextRequest) {
  const searchParams = request.nextUrl.searchParams;
  const name = searchParams.get('name');

  try {
    if (!name) {
      return NextResponse.json(
        { success: false, error: 'College name is required' },
        { status: 400 }
      );
    }
    
    const encodedName = encodeURIComponent(name);
    const response = await fetch(`${FASTAPI_BASE_URL}/api/colleges/${encodedName}`, {
      method: 'DELETE'
    });
    
    const data = await response.json();
    return NextResponse.json(data, { status: response.status });
  } catch (error) {
    return NextResponse.json(
      { success: false, error: 'Failed to delete college' },
      { status: 500 }
    );
  }
}
