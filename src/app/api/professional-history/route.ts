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

export async function GET(request: NextRequest) {
  try {
    const { searchParams } = new URL(request.url);
    const year = searchParams.get('year');
    const category = searchParams.get('category');

    let data = readData();

    // 按年份排序
    data.sort((a, b) => b.year - a.year);

    // 过滤
    if (year) {
      data = data.filter((item) => item.year === parseInt(year));
    }

    if (category) {
      data = data.filter((item) => item.category === category);
    }

    return NextResponse.json({
      success: true,
      data,
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

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();

    const data = readData();
    const newId = data.length > 0 ? Math.max(...data.map((item) => item.id)) + 1 : 1;

    const newItem = {
      id: newId,
      ...body,
      createdAt: new Date().toISOString(),
      updatedAt: new Date().toISOString(),
    };

    data.push(newItem);
    writeData(data);

    return NextResponse.json({
      success: true,
      data: newItem,
    });
  } catch (error: unknown) {
    console.error('Error creating professional history:', error);
    return NextResponse.json(
      {
        success: false,
        error: error instanceof Error ? error.message : 'Failed to create data',
      },
      { status: 500 }
    );
  }
}
