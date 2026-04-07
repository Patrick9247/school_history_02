import { NextRequest, NextResponse } from 'next/server';
import { getSupabaseClient } from '@/storage/database/supabase-client';

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

// 获取所有专业及其代码
export async function GET(request: NextRequest) {
  try {
    const client = getSupabaseClient();
    const { searchParams } = new URL(request.url);
    const category = searchParams.get('category');
    const major = searchParams.get('major');

    let query = client.from('professional_history').select('*');

    if (category) {
      query = query.eq('category', category);
    }

    if (major) {
      query = query.ilike('major', `%${major}%`);
    }

    query = query.order('year', { ascending: false }).order('major', { ascending: true });

    const { data, error } = await query;

    if (error) {
      throw new Error(`查询失败: ${error.message}`);
    }

    return NextResponse.json({
      success: true,
      data: data || [],
    });
  } catch (error: unknown) {
    console.error('Error fetching professional codes:', error);
    return NextResponse.json(
      {
        success: false,
        error: error instanceof Error ? error.message : 'Failed to fetch data',
      },
      { status: 500 }
    );
  }
}

// 更新专业代码
export async function PUT(request: NextRequest) {
  try {
    const client = getSupabaseClient();
    const body = await request.json();
    const { id, code } = body;

    if (!id || code === undefined) {
      return NextResponse.json(
        {
          success: false,
          error: 'Missing required fields: id or code',
        },
        { status: 400 }
      );
    }

    const { data, error } = await client
      .from('professional_history')
      .update({ code, updated_at: new Date().toISOString() })
      .eq('id', id)
      .select();

    if (error) {
      throw new Error(`更新失败: ${error.message}`);
    }

    if (!data || data.length === 0) {
      return NextResponse.json(
        {
          success: false,
          error: 'Record not found',
        },
        { status: 404 }
      );
    }

    return NextResponse.json({
      success: true,
      data: data[0],
    });
  } catch (error: unknown) {
    console.error('Error updating professional code:', error);
    return NextResponse.json(
      {
        success: false,
        error: error instanceof Error ? error.message : 'Failed to update code',
      },
      { status: 500 }
    );
  }
}

// 批量更新专业代码
export async function POST(request: NextRequest) {
  try {
    const client = getSupabaseClient();
    const body = await request.json();
    const { codes } = body;

    if (!Array.isArray(codes) || codes.length === 0) {
      return NextResponse.json(
        {
          success: false,
          error: 'Invalid data: codes must be a non-empty array',
        },
        { status: 400 }
      );
    }

    const results = [];

    for (const item of codes) {
      const { id, code } = item;
      if (!id || code === undefined) {
        continue;
      }

      const { data, error } = await client
        .from('professional_history')
        .update({ code, updated_at: new Date().toISOString() })
        .eq('id', id)
        .select();

      if (error) {
        console.error(`Failed to update record ${id}:`, error);
      } else if (data && data.length > 0) {
        results.push(data[0]);
      }
    }

    return NextResponse.json({
      success: true,
      data: results,
    });
  } catch (error: unknown) {
    console.error('Error batch updating professional codes:', error);
    return NextResponse.json(
      {
        success: false,
        error: error instanceof Error ? error.message : 'Failed to batch update codes',
      },
      { status: 500 }
    );
  }
}
