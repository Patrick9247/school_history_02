/**
 * 统一数据 API 路由
 * 从 FastAPI 后端获取年份、学院、专业数据
 */
import { NextRequest, NextResponse } from 'next/server';

const FASTAPI_BASE_URL = process.env.FASTAPI_URL || 'http://localhost:8000';

async function fetchFromBackend(path: string, options?: RequestInit) {
  try {
    const response = await fetch(`${FASTAPI_BASE_URL}${path}`, {
      headers: {
        'Content-Type': 'application/json',
      },
      // 禁用缓存，确保实时获取最新数据
      cache: 'no-store',
      ...options
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

// ============ 年份接口 ============

/**
 * GET /api/years - 获取所有年份
 * GET /api/years?year=2024 - 获取指定年份
 */
export async function GET(request: NextRequest) {
  const searchParams = request.nextUrl.searchParams;
  const year = searchParams.get('year');

  try {
    let data;
    
    if (year) {
      data = await fetchFromBackend(`/api/years/${year}`);
    } else {
      data = await fetchFromBackend('/api/years');
    }
    
    return NextResponse.json(data);
  } catch (error) {
    return NextResponse.json(
      { success: false, error: 'Failed to fetch years data' },
      { status: 500 }
    );
  }
}

/**
 * POST /api/years - 创建年份
 */
export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const response = await fetch(`${FASTAPI_BASE_URL}/api/years`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(body)
    });
    
    const data = await response.json();
    return NextResponse.json(data, { status: response.status });
  } catch (error) {
    return NextResponse.json(
      { success: false, error: 'Failed to create year' },
      { status: 500 }
    );
  }
}

/**
 * PUT /api/years - 更新年份
 * PUT /api/years?id=xxx - 更新指定年份
 */
export async function PUT(request: NextRequest) {
  try {
    const body = await request.json();
    const year = body.year;
    
    if (!year) {
      return NextResponse.json(
        { success: false, error: 'Year is required' },
        { status: 400 }
      );
    }
    
    const response = await fetch(`${FASTAPI_BASE_URL}/api/years/${year}`, {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(body)
    });
    
    const data = await response.json();
    return NextResponse.json(data, { status: response.status });
  } catch (error) {
    return NextResponse.json(
      { success: false, error: 'Failed to update year' },
      { status: 500 }
    );
  }
}

/**
 * DELETE /api/years - 删除年份
 * DELETE /api/years?year=xxx - 删除指定年份
 */
export async function DELETE(request: NextRequest) {
  const searchParams = request.nextUrl.searchParams;
  const year = searchParams.get('year');
  const path = searchParams.get('path'); // 支持 /api/years/{year}

  try {
    if (!year && !path) {
      return NextResponse.json(
        { success: false, error: 'Year is required' },
        { status: 400 }
      );
    }
    
    const targetPath = path || `/api/years/${year}`;
    const response = await fetch(`${FASTAPI_BASE_URL}${targetPath}`, {
      method: 'DELETE'
    });
    
    const data = await response.json();
    return NextResponse.json(data, { status: response.status });
  } catch (error) {
    return NextResponse.json(
      { success: false, error: 'Failed to delete year' },
      { status: 500 }
    );
  }
}
