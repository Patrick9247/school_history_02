"""
年份路由
"""
from fastapi import APIRouter, HTTPException
from typing import List, Optional
from database import get_db_connection
from models import Year, YearCreate, YearUpdate, ApiResponse

router = APIRouter(prefix="/api/years", tags=["年份"])

@router.get("", response_model=ApiResponse)
async def get_years():
    """获取所有年份"""
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM years ORDER BY year DESC")
    rows = cursor.fetchall()
    conn.close()
    
    years = [dict(row) for row in rows]
    return ApiResponse(success=True, data=years)

@router.get("/{year}", response_model=ApiResponse)
async def get_year(year: int):
    """获取指定年份"""
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM years WHERE year = ?", (year,))
    row = cursor.fetchone()
    conn.close()
    
    if not row:
        raise HTTPException(status_code=404, detail="年份不存在")
    
    return ApiResponse(success=True, data=dict(row))

@router.post("", response_model=ApiResponse)
async def create_year(year_data: YearCreate):
    """创建年份"""
    conn = get_db_connection()
    cursor = conn.cursor()
    
    try:
        cursor.execute(
            "INSERT INTO years (year, event, dept_count, major_count) VALUES (?, ?, ?, ?)",
            (year_data.year, year_data.event, year_data.dept_count, year_data.major_count)
        )
        conn.commit()
        year_id = cursor.lastrowid
        
        cursor.execute("SELECT * FROM years WHERE id = ?", (year_id,))
        result = cursor.fetchone()
        conn.close()
        
        return ApiResponse(success=True, message="年份创建成功", data=dict(result))
    except Exception as e:
        conn.close()
        raise HTTPException(status_code=400, detail=str(e))

@router.put("/{year}", response_model=ApiResponse)
async def update_year(year: int, year_data: YearUpdate):
    """更新年份"""
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # 构建更新语句
    updates = []
    values = []
    if year_data.event is not None:
        updates.append("event = ?")
        values.append(year_data.event)
    if year_data.dept_count is not None:
        updates.append("dept_count = ?")
        values.append(year_data.dept_count)
    if year_data.major_count is not None:
        updates.append("major_count = ?")
        values.append(year_data.major_count)
    
    if not updates:
        raise HTTPException(status_code=400, detail="没有需要更新的字段")
    
    values.append(year)
    query = f"UPDATE years SET {', '.join(updates)} WHERE year = ?"
    
    cursor.execute(query, values)
    conn.commit()
    
    cursor.execute("SELECT * FROM years WHERE year = ?", (year,))
    result = cursor.fetchone()
    conn.close()
    
    if not result:
        raise HTTPException(status_code=404, detail="年份不存在")
    
    return ApiResponse(success=True, message="年份更新成功", data=dict(result))

@router.delete("/{year}", response_model=ApiResponse)
async def delete_year(year: int):
    """删除年份"""
    conn = get_db_connection()
    cursor = conn.cursor()
    
    cursor.execute("DELETE FROM years WHERE year = ?", (year,))
    conn.commit()
    affected = cursor.rowcount
    conn.close()
    
    if affected == 0:
        raise HTTPException(status_code=404, detail="年份不存在")
    
    return ApiResponse(success=True, message="年份删除成功")

@router.get("/{year}/majors", response_model=ApiResponse)
async def get_year_majors(year: int):
    """获取指定年份的所有专业"""
    conn = get_db_connection()
    cursor = conn.cursor()
    
    cursor.execute("""
        SELECT m.*, c.name as college_name, c.color as college_color
        FROM majors m
        LEFT JOIN colleges c ON m.college_id = c.id
        WHERE m.year_id = (SELECT id FROM years WHERE year = ?)
    """, (year,))
    rows = cursor.fetchall()
    conn.close()
    
    majors = [dict(row) for row in rows]
    return ApiResponse(success=True, data=majors)
