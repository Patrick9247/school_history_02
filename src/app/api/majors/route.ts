/**
 * 专业 API 路由
 * 从 FastAPI 后端获取专业数据
 */
import { NextRequest, NextResponse } from 'next/server';

const FASTAPI_BASE_URL = process.env.FASTAPI_URL || 'http://localhost:8000';

async function fetchFromBackend(path: string, options?: RequestInit) {
  try {
    const response = await fetch(`${FASTAPI_BASE_URL}${path}`, {
      headers: { 'Content-Type': 'application/json' },
      cache: 'no-store', // 禁用缓存，确保实时获取最新数据
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

/**
 * GET /api/majors - 获取所有专业
 * GET /api/majors?year=2024 - 按年份筛选
 * GET /api/majors?college_id=1 - 按学院筛选
 * GET /api/majors?search=地质 - 搜索专业
 * GET /api/majors?limit=1000 - 指定返回数量（默认500）
 */
export async function GET(request: NextRequest) {
  const searchParams = request.nextUrl.searchParams;
  const year = searchParams.get('year');
  const college_id = searchParams.get('college_id');
  const search = searchParams.get('search');
  const limit = searchParams.get('limit') || '500';

  try {
    const queryParams = new URLSearchParams();
    if (year) queryParams.set('year', year);
    if (college_id) queryParams.set('college_id', college_id);
    if (search) queryParams.set('search', search);
    queryParams.set('limit', limit);
    
    const query = queryParams.toString();
    const path = `/api/majors?${query}`;
    
    const data = await fetchFromBackend(path);
    
    // 处理分页响应格式
    if (data.data && typeof data.data === 'object' && 'items' in data.data) {
      return NextResponse.json({
        success: data.success,
        data: data.data.items,
        total: data.data.total
      });
    }
    
    return NextResponse.json(data);
  } catch (error) {
    return NextResponse.json(
      { success: false, error: 'Failed to fetch majors data' },
      { status: 500 }
    );
  }
}

/**
 * GET /api/majors/[id] - 获取单个专业
 */
export async function GET_BY_ID(request: NextRequest, { params }: { params: { id: string } }) {
  try {
    const data = await fetchFromBackend(`/api/majors/${params.id}`);
    return NextResponse.json(data);
  } catch (error) {
    return NextResponse.json(
      { success: false, error: 'Failed to fetch major' },
      { status: 500 }
    );
  }
}

/**
 * POST /api/majors - 创建专业
 * POST /api/majors/bulk - 批量创建专业
 */
export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    
    // 检查是否为批量创建
    const isBulk = Array.isArray(body);
    const endpoint = isBulk ? '/api/majors/bulk' : '/api/majors';
    const method = 'POST';
    
    const response = await fetch(`${FASTAPI_BASE_URL}${endpoint}`, {
      method,
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(body)
    });
    
    const data = await response.json();
    return NextResponse.json(data, { status: response.status });
  } catch (error) {
    return NextResponse.json(
      { success: false, error: 'Failed to create major' },
      { status: 500 }
    );
  }
}

/**
 * PUT /api/majors - 更新专业
 */
export async function PUT(request: NextRequest) {
  try {
    const body = await request.json();
    const id = body.id;
    
    if (!id) {
      return NextResponse.json(
        { success: false, error: 'Major ID is required' },
        { status: 400 }
      );
    }
    
    const response = await fetch(`${FASTAPI_BASE_URL}/api/majors/${id}`, {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(body)
    });
    
    const data = await response.json();
    return NextResponse.json(data, { status: response.status });
  } catch (error) {
    return NextResponse.json(
      { success: false, error: 'Failed to update major' },
      { status: 500 }
    );
  }
}

/**
 * DELETE /api/majors?id=xxx - 删除专业
 */
export async function DELETE(request: NextRequest) {
  const searchParams = request.nextUrl.searchParams;
  const id = searchParams.get('id');

  try {
    if (!id) {
      return NextResponse.json(
        { success: false, error: 'Major ID is required' },
        { status: 400 }
      );
    }
    
    const response = await fetch(`${FASTAPI_BASE_URL}/api/majors/${id}`, {
      method: 'DELETE'
    });
    
    const data = await response.json();
    return NextResponse.json(data, { status: response.status });
  } catch (error) {
    return NextResponse.json(
      { success: false, error: 'Failed to delete major' },
      { status: 500 }
    );
  }
}
