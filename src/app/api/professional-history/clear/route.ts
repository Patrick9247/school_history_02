import { NextResponse } from 'next/server';
import { existsSync, readFileSync, writeFileSync, mkdirSync } from 'fs';
import { join } from 'path';

const DATA_DIR = join(process.cwd(), 'data');
const DATA_FILE = join(DATA_DIR, 'professional-history.json');

// 确保数据目录存在
if (!existsSync(DATA_DIR)) {
  mkdirSync(DATA_DIR, { recursive: true });
}

// 读取数据
function readData() {
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

export async function DELETE() {
  try {
    const data = readData();
    const count = data.length;

    writeData([]);

    return NextResponse.json({
      success: true,
      message: `Deleted ${count} records`,
      count,
    });
  } catch (error: unknown) {
    console.error('Error clearing all data:', error);
    return NextResponse.json(
      {
        success: false,
        error: error instanceof Error ? error.message : 'Failed to clear data',
      },
      { status: 500 }
    );
  }
}
