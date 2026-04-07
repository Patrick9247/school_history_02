import { getSupabaseClient } from '@/storage/database/supabase-client';

// 导出 Supabase 客户端实例
export const client = getSupabaseClient();

// 兼容旧版函数名
export async function query(sql: string, params: any[] = []) {
  // 注意：在 Supabase SDK 中，我们不直接执行 SQL
  // 而是使用 SDK 提供的方法
  // 这里保留函数签名以兼容旧代码
  throw new Error('请使用 Supabase SDK 的 .select()、.insert()、.update()、.delete() 方法');
}

export async function exec_sql(sql: string, params: any[] = []) {
  throw new Error('请使用 Supabase SDK 的 .select()、.insert()、.update()、.delete() 方法');
}
