import { NextRequest, NextResponse } from 'next/server';
import { readFileSync, existsSync } from 'fs';
import { join } from 'path';

// 导入数据库工具
import { exec_sql } from '@/lib/db';

// 创建一个 API 来执行数据导入
export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const { batchNumber } = body;

    if (!batchNumber) {
      return NextResponse.json(
        { success: false, error: 'Batch number is required' },
        { status: 400 }
      );
    }

    const sqlFilePath = join(process.cwd(), 'scripts', `import-part-${batchNumber}.sql`);

    if (!existsSync(sqlFilePath)) {
      return NextResponse.json(
        { success: false, error: `Batch file ${batchNumber} not found` },
        { status: 404 }
      );
    }

    const sqlContent = readFileSync(sqlFilePath, 'utf-8');

    // 执行 SQL
    const result = await exec_sql(sqlContent);

    return NextResponse.json({
      success: true,
      batchNumber,
      result,
    });
  } catch (error: unknown) {
    console.error('Error executing batch file:', error);
    return NextResponse.json(
      {
        success: false,
        error: error instanceof Error ? error.message : 'Failed to execute batch file',
      },
      { status: 500 }
    );
  }
}
