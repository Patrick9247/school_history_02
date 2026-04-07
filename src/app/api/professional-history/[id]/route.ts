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

export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id: idParam } = await params;
    const id = parseInt(idParam);

    if (isNaN(id)) {
      return NextResponse.json(
        {
          success: false,
          error: 'Invalid ID',
        },
        { status: 400 }
      );
    }

    const data = readData();
    const index = data.findIndex((item) => item.id === id);

    if (index === -1) {
      return NextResponse.json(
        {
          success: false,
          error: 'Record not found',
        },
        { status: 404 }
      );
    }

    const deletedItem = data.splice(index, 1)[0];
    writeData(data);

    return NextResponse.json({
      success: true,
      data: deletedItem,
    });
  } catch (error: unknown) {
    console.error('Error deleting professional history:', error);
    return NextResponse.json(
      {
        success: false,
        error: error instanceof Error ? error.message : 'Failed to delete data',
      },
      { status: 500 }
    );
  }
}
