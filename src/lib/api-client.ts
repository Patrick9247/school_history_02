/**
 * 数据获取工具
 * 封装对 FastAPI 后端的数据请求
 */

const API_BASE_URL = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:5000/api';

interface ApiResponse<T = unknown> {
  success: boolean;
  message?: string;
  data?: T;
  error?: string;
}

// ============ 年份相关 ============

export interface Year {
  id: number;
  year: number;
  event?: string;
  dept_count: number;
  major_count: number;
  created_at?: string;
}

export async function fetchYears(): Promise<Year[]> {
  const res = await fetch(`${API_BASE_URL}/years`);
  const data: ApiResponse<Year[]> = await res.json();
  return data.data || [];
}

export async function fetchYear(year: number): Promise<Year | null> {
  const res = await fetch(`${API_BASE_URL}/years?year=${year}`);
  const data: ApiResponse<Year> = await res.json();
  return data.data || null;
}

// ============ 学院相关 ============

export interface College {
  id: number;
  name: string;
  color?: string;
  established_year?: number;
  description?: string;
  created_at?: string;
}

export interface CollegeStats {
  college: College;
  total_majors: number;
  year_stats: Array<{
    year: number;
    major_count: number;
  }>;
}

export async function fetchColleges(): Promise<College[]> {
  const res = await fetch(`${API_BASE_URL}/colleges`);
  const data: ApiResponse<College[]> = await res.json();
  return data.data || [];
}

export async function fetchCollege(name: string): Promise<College | null> {
  const encodedName = encodeURIComponent(name);
  const res = await fetch(`${API_BASE_URL}/colleges?name=${encodedName}`);
  const response: ApiResponse<College> = await res.json();
  return response.data || null;
}

export async function fetchCollegeStats(name: string): Promise<CollegeStats | null> {
  const encodedName = encodeURIComponent(name);
  const res = await fetch(`${API_BASE_URL}/colleges?name=${encodedName}&stats=true`);
  const data: ApiResponse<CollegeStats> = await res.json();
  return data.data || null;
}

// ============ 专业相关 ============

export interface Major {
  id: number;
  year_id: number;
  college_id: number;
  name: string;
  code?: string;
  category?: string;
  description?: string;
  level?: string;
  department?: string;
  created_at?: string;
  year?: number;
  college_name?: string;
}

export interface MajorWithDetails extends Major {
  year: number;
  college_name: string;
}

export async function fetchMajors(params?: {
  year?: number;
  college_id?: number;
  search?: string;
}): Promise<MajorWithDetails[]> {
  const queryParams = new URLSearchParams();
  if (params?.year) queryParams.set('year', String(params.year));
  if (params?.college_id) queryParams.set('college_id', String(params.college_id));
  if (params?.search) queryParams.set('search', params.search);
  
  const query = queryParams.toString();
  const url = query ? `${API_BASE_URL}/majors?${query}` : `${API_BASE_URL}/majors`;
  
  const res = await fetch(url);
  const data: ApiResponse<MajorWithDetails[]> = await res.json();
  return data.data || [];
}

export async function fetchMajor(id: number): Promise<Major | null> {
  const res = await fetch(`${API_BASE_URL}/majors?id=${id}`);
  const response: ApiResponse<Major> = await res.json();
  return response.data || null;
}

// ============ 学院-专业关联 ============

export async function fetchCollegeMajors(collegeName: string): Promise<MajorWithDetails[]> {
  const encodedName = encodeURIComponent(collegeName);
  const res = await fetch(`${API_BASE_URL}/colleges?name=${encodedName}&majors=true`);
  const data: ApiResponse<MajorWithDetails[]> = await res.json();
  return data.data || [];
}

// ============ 年份-专业关联 ============

export async function fetchYearMajors(year: number): Promise<MajorWithDetails[]> {
  const res = await fetch(`${API_BASE_URL}/majors?year=${year}`);
  const data: ApiResponse<MajorWithDetails[]> = await res.json();
  return data.data || [];
}

// ============ 统计数据 ============

export interface YearStats {
  year: number;
  total_majors: number;
  total_colleges: number;
  colleges: Array<{
    name: string;
    color: string;
    major_count: number;
  }>;
}

export async function fetchYearStats(year: number): Promise<YearStats | null> {
  const years = await fetchYears();
  const yearData = years.find(y => y.year === year);
  
  if (!yearData) return null;
  
  const majors = await fetchYearMajors(year);
  
  // 按学院分组统计
  const collegeMap = new Map<string, { name: string; color: string; major_count: number }>();
  for (const major of majors) {
    const name = major.college_name || major.category || '未知学院';
    if (!collegeMap.has(name)) {
      collegeMap.set(name, { name, color: '#3b82f6', major_count: 0 });
    }
    collegeMap.get(name)!.major_count++;
  }
  
  return {
    year,
    total_majors: majors.length,
    total_colleges: collegeMap.size,
    colleges: Array.from(collegeMap.values())
  };
}

// ============ 创建/更新操作 ============

export async function createYear(data: Partial<Year>): Promise<Year | null> {
  const res = await fetch(`${API_BASE_URL}/years`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(data)
  });
  const response: ApiResponse<Year> = await res.json();
  return response.data || null;
}

export async function createCollege(data: Partial<College>): Promise<College | null> {
  const res = await fetch(`${API_BASE_URL}/colleges`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(data)
  });
  const response: ApiResponse<College> = await res.json();
  return response.data || null;
}

export async function createMajor(data: Partial<Major>): Promise<Major | null> {
  const res = await fetch(`${API_BASE_URL}/majors`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(data)
  });
  const response: ApiResponse<Major> = await res.json();
  return response.data || null;
}

export async function bulkCreateMajors(data: Partial<Major>[]): Promise<{ created_count: number } | null> {
  const res = await fetch(`${API_BASE_URL}/majors`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(data)
  });
  const response: ApiResponse<{ created_count: number; errors: unknown[] }> = await res.json();
  return response.data || null;
}
