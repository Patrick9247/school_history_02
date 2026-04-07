import { NextRequest, NextResponse } from 'next/server';
import { readFileSync } from 'fs';
import { join } from 'path';

// 直接执行 SQL 文件导入
export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const { sqlFile } = body;

    if (!sqlFile) {
      return NextResponse.json(
        { success: false, error: 'SQL file path is required' },
        { status: 400 }
      );
    }

    // 读取 SQL 文件
    const sqlFilePath = join(process.cwd(), sqlFile);
    const sqlContent = readFileSync(sqlFilePath, 'utf-8');

    // 返回 SQL 内容供前端执行
    return NextResponse.json({
      success: true,
      sql: sqlContent,
    });
  } catch (error: unknown) {
    console.error('Error reading SQL file:', error);
    return NextResponse.json(
      {
        success: false,
        error: error instanceof Error ? error.message : 'Failed to read SQL file',
      },
      { status: 500 }
    );
  }
}
