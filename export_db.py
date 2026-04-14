#!/usr/bin/env python3
"""导出 SQLite 数据库为 SQL 文件"""
import sqlite3
import os
from datetime import datetime

db_path = 'data/school_history.db'
output_path = 'data/school_history.sql'

conn = sqlite3.connect(db_path)
cursor = conn.cursor()

# 获取所有表
cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
tables = cursor.fetchall()

with open(output_path, 'w', encoding='utf-8') as f:
    f.write('-- SQLite Database Dump\n')
    f.write(f'-- Database: {db_path}\n')
    f.write(f'-- Generated: {datetime.now()}\n\n')
    
    for table_name in tables:
        table = table_name[0]
        f.write(f'\n-- ============================================\n')
        f.write(f'-- Table: {table}\n')
        f.write(f'-- ============================================\n\n')
        
        # 获取表结构
        cursor.execute(f'PRAGMA table_info({table})')
        columns = cursor.fetchall()
        col_names = [col[1] for col in columns]
        
        # 删除表语句
        f.write(f'DROP TABLE IF EXISTS {table};\n\n')
        
        # 创建表
        cursor.execute(f'SELECT sql FROM sqlite_master WHERE type="table" AND name="{table}"')
        create_sql = cursor.fetchone()[0]
        f.write(create_sql + ';\n\n')
        
        # 插入数据
        cursor.execute(f'SELECT * FROM {table}')
        rows = cursor.fetchall()
        
        for row in rows:
            values = []
            for val in row:
                if val is None:
                    values.append('NULL')
                elif isinstance(val, str):
                    # 转义单引号
                    escaped = val.replace("'", "''")
                    values.append(f"'{escaped}'")
                else:
                    values.append(str(val))
            values_str = ', '.join(values)
            f.write(f'INSERT INTO {table} ({', '.join(col_names)}) VALUES ({values_str});\n')
        
        f.write(f'\n-- Total: {len(rows)} rows\n')

conn.close()

# 输出文件信息
size = os.path.getsize(output_path)
print(f'导出完成: {output_path}')
print(f'文件大小: {size:,} bytes ({size/1024:.1f} KB)')
