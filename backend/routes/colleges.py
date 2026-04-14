"""
学院路由
"""
from fastapi import APIRouter, HTTPException
from typing import List, Optional
from database import get_db_connection
from models import College, CollegeCreate, CollegeUpdate, ApiResponse

router = APIRouter(prefix="/api/colleges", tags=["学院"])

@router.get("", response_model=ApiResponse)
async def get_colleges():
    """获取所有学院"""
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM colleges ORDER BY name")
    rows = cursor.fetchall()
    conn.close()
    
    colleges = [dict(row) for row in rows]
    return ApiResponse(success=True, data=colleges)

@router.get("/{name}", response_model=ApiResponse)
async def get_college(name: str):
    """获取指定学院"""
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM colleges WHERE name = ?", (name,))
    row = cursor.fetchone()
    conn.close()
    
    if not row:
        raise HTTPException(status_code=404, detail="学院不存在")
    
    return ApiResponse(success=True, data=dict(row))

@router.post("", response_model=ApiResponse)
async def create_college(college_data: CollegeCreate):
    """创建学院"""
    conn = get_db_connection()
    cursor = conn.cursor()
    
    try:
        cursor.execute(
            "INSERT INTO colleges (name, color, established_year, description) VALUES (?, ?, ?, ?)",
            (college_data.name, college_data.color, college_data.established_year, college_data.description)
        )
        conn.commit()
        college_id = cursor.lastrowid
        
        cursor.execute("SELECT * FROM colleges WHERE id = ?", (college_id,))
        result = cursor.fetchone()
        conn.close()
        
        return ApiResponse(success=True, message="学院创建成功", data=dict(result))
    except Exception as e:
        conn.close()
        raise HTTPException(status_code=400, detail=str(e))

@router.put("/{name}", response_model=ApiResponse)
async def update_college(name: str, college_data: CollegeUpdate):
    """更新学院"""
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # 构建更新语句
    updates = []
    values = []
    if college_data.color is not None:
        updates.append("color = ?")
        values.append(college_data.color)
    if college_data.established_year is not None:
        updates.append("established_year = ?")
        values.append(college_data.established_year)
    if college_data.description is not None:
        updates.append("description = ?")
        values.append(college_data.description)
    
    if not updates:
        raise HTTPException(status_code=400, detail="没有需要更新的字段")
    
    values.append(name)
    query = f"UPDATE colleges SET {', '.join(updates)} WHERE name = ?"
    
    cursor.execute(query, values)
    conn.commit()
    
    cursor.execute("SELECT * FROM colleges WHERE name = ?", (name,))
    result = cursor.fetchone()
    conn.close()
    
    if not result:
        raise HTTPException(status_code=404, detail="学院不存在")
    
    return ApiResponse(success=True, message="学院更新成功", data=dict(result))

@router.delete("/{name}", response_model=ApiResponse)
async def delete_college(name: str):
    """删除学院"""
    conn = get_db_connection()
    cursor = conn.cursor()
    
    cursor.execute("DELETE FROM colleges WHERE name = ?", (name,))
    conn.commit()
    affected = cursor.rowcount
    conn.close()
    
    if affected == 0:
        raise HTTPException(status_code=404, detail="学院不存在")
    
    return ApiResponse(success=True, message="学院删除成功")

@router.get("/{name}/majors", response_model=ApiResponse)
async def get_college_majors(name: str):
    """获取指定学院的所有专业"""
    conn = get_db_connection()
    cursor = conn.cursor()
    
    cursor.execute("""
        SELECT m.*, y.year
        FROM majors m
        LEFT JOIN years y ON m.year_id = y.id
        WHERE m.college_id = (SELECT id FROM colleges WHERE name = ?)
        ORDER BY y.year DESC, m.name
    """, (name,))
    rows = cursor.fetchall()
    conn.close()
    
    majors = [dict(row) for row in rows]
    return ApiResponse(success=True, data=majors)

@router.get("/{name}/stats", response_model=ApiResponse)
async def get_college_stats(name: str):
    """获取学院统计数据"""
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # 获取学院基本信息
    cursor.execute("SELECT * FROM colleges WHERE name = ?", (name,))
    college = cursor.fetchone()
    if not college:
        conn.close()
        raise HTTPException(status_code=404, detail="学院不存在")
    
    # 获取该学院的专业数量
    cursor.execute("""
        SELECT COUNT(*) as total_majors
        FROM majors
        WHERE college_id = ?
    """, (college["id"],))
    major_count = cursor.fetchone()["total_majors"]
    
    # 获取该学院涉及的所有年份
    cursor.execute("""
        SELECT DISTINCT y.year, COUNT(m.id) as major_count
        FROM years y
        JOIN majors m ON m.year_id = y.id
        WHERE m.college_id = ?
        GROUP BY y.year
        ORDER BY y.year DESC
    """, (college["id"],))
    year_stats = [dict(row) for row in cursor.fetchall()]
    
    conn.close()
    
    return ApiResponse(success=True, data={
        "college": dict(college),
        "total_majors": major_count,
        "year_stats": year_stats
    })
