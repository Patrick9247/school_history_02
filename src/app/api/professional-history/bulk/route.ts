import { NextRequest, NextResponse } from 'next/server';
import { existsSync, readFileSync, writeFileSync, mkdirSync } from 'fs';
import { join } from 'path';

const DATA_DIR = join(process.cwd(), 'data');
const DATA_FILE = join(DATA_DIR, 'professional-history.json');

// 确保数据目录存在
if (!existsSync(DATA_DIR)) {
  mkdirSync(DATA_DIR, { recursive: true });
}

// 读取数据
function readData(): Array<{
  id: number;
  year: number;
  major: string;
  category?: string;
  description?: string;
  level?: string;
  department?: string;
  createdAt?: string;
  updatedAt?: string;
}> {
  if (!existsSync(DATA_FILE)) {
    return [];
  }
  try {
    const content = readFileSync(DATA_FILE, 'utf-8');
    return JSON.parse(content);
  } catch (error) {
    console.error('Error reading data file:', error);
    return [];
  }
}

// 写入数据
function writeData(data: unknown[]) {
  writeFileSync(DATA_FILE, JSON.stringify(data, null, 2), 'utf-8');
}

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const { data: newData } = body;

    if (!Array.isArray(newData)) {
      return NextResponse.json(
        {
          success: false,
          error: 'Data must be an array',
        },
        { status: 400 }
      );
    }

    const data = readData();
    const maxId = data.length > 0 ? Math.max(...data.map((item) => item.id)) : 0;

    const itemsWithId = newData.map((item, index) => ({
      id: maxId + index + 1,
      ...item,
      createdAt: new Date().toISOString(),
      updatedAt: new Date().toISOString(),
    }));

    const allData = [...data, ...itemsWithId];
    writeData(allData);

    return NextResponse.json({
      success: true,
      data: itemsWithId,
      count: itemsWithId.length,
    });
  } catch (error: unknown) {
    console.error('Error bulk importing data:', error);
    return NextResponse.json(
      {
        success: false,
        error: error instanceof Error ? error.message : 'Failed to import data',
      },
      { status: 500 }
    );
  }
}
