"""
数据迁移脚本
将 professional-history.json 数据迁移到 SQLite 数据库
"""
import json
import sys
import os

# 添加 backend 目录到路径
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from database import get_db_connection, init_db

def migrate_data():
    """迁移专业历史数据到 SQLite"""
    # 初始化数据库
    init_db()
    
    # 读取 JSON 数据
    json_path = os.path.join(os.path.dirname(os.path.dirname(__file__)), "data", "professional-history.json")
    
    if not os.path.exists(json_path):
        print(f"错误: 数据文件不存在 {json_path}")
        return False
    
    with open(json_path, "r", encoding="utf-8") as f:
        data = json.load(f)
    
    print(f"读取到 {len(data)} 条专业历史记录")
    
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # 用于去重的集合
    years_set = {}
    colleges_set = {}
    
    # 第一遍：提取所有年份和学院
    for item in data:
        year = item.get("year")
        college = item.get("category")
        
        if year and year not in years_set:
            years_set[year] = None
        
        if college and college not in colleges_set:
            colleges_set[college] = None
    
    # 插入年份
    print(f"插入 {len(years_set)} 个年份...")
    for year in sorted(years_set.keys()):
        cursor.execute(
            "INSERT OR IGNORE INTO years (year, event, dept_count, major_count) VALUES (?, ?, ?, ?)",
            (year, None, 0, 0)
        )
        cursor.execute("SELECT id FROM years WHERE year = ?", (year,))
        years_set[year] = cursor.fetchone()[0]
    
    # 插入学院
    print(f"插入 {len(colleges_set)} 个学院...")
    for college in sorted(colleges_set.keys()):
        cursor.execute(
            "INSERT OR IGNORE INTO colleges (name, color, established_year, description) VALUES (?, ?, ?, ?)",
            (college, None, None, None)
        )
        cursor.execute("SELECT id FROM colleges WHERE name = ?", (college,))
        colleges_set[college] = cursor.fetchone()[0]
    
    conn.commit()
    
    # 第二遍：插入专业数据
    print("插入专业数据...")
    majors_inserted = 0
    majors_skipped = 0
    
    for item in data:
        year = item.get("year")
        college = item.get("category")
        major = item.get("major")
        
        year_id = years_set.get(year)
        college_id = colleges_set.get(college)
        
        if not year_id or not college_id:
            majors_skipped += 1
            continue
        
        try:
            cursor.execute("""
                INSERT INTO majors 
                (year_id, college_id, name, category, description, level, department)
                VALUES (?, ?, ?, ?, ?, ?, ?)
            """, (
                year_id,
                college_id,
                major,
                college,
                item.get("description"),
                item.get("level"),
                item.get("department")
            ))
            majors_inserted += 1
        except Exception as e:
            print(f"插入专业失败: {major} - {e}")
            majors_skipped += 1
    
    conn.commit()
    
    # 更新年份统计
    print("更新年份统计...")
    cursor.execute("SELECT id, year FROM years")
    for row in cursor.fetchall():
        year_id, year = row
        cursor.execute("""
            SELECT COUNT(*) FROM majors WHERE year_id = ?
        """, (year_id,))
        major_count = cursor.fetchone()[0]
        
        cursor.execute("""
            SELECT COUNT(DISTINCT college_id) FROM majors WHERE year_id = ?
        """, (year_id,))
        dept_count = cursor.fetchone()[0]
        
        cursor.execute("""
            UPDATE years SET major_count = ?, dept_count = ? WHERE id = ?
        """, (major_count, dept_count, year_id))
    
    conn.commit()
    conn.close()
    
    print(f"\n迁移完成!")
    print(f"- 年份: {len(years_set)} 个")
    print(f"- 学院: {len(colleges_set)} 个")
    print(f"- 专业: {majors_inserted} 条 (跳过 {majors_skipped} 条)")
    
    return True

if __name__ == "__main__":
    migrate_data()
