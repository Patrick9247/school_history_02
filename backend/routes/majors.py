"""
专业路由
"""
from fastapi import APIRouter, HTTPException, Query
from typing import List, Optional
from database import get_db_connection
from models import Major, MajorCreate, MajorUpdate, ApiResponse

router = APIRouter(prefix="/api/majors", tags=["专业"])

@router.get("", response_model=ApiResponse)
async def get_majors(
    year: Optional[int] = Query(None, description="按年份筛选"),
    college_id: Optional[int] = Query(None, description="按学院ID筛选"),
    search: Optional[str] = Query(None, description="搜索专业名称"),
    limit: Optional[int] = Query(500, description="返回数量限制"),
    offset: Optional[int] = Query(0, description="偏移量")
):
    """获取所有专业，支持筛选、分页"""
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # 首先获取总数
    count_query = """
        SELECT COUNT(*) as total
        FROM majors m
        LEFT JOIN colleges c ON m.college_id = c.id
        LEFT JOIN years y ON m.year_id = y.id
        WHERE 1=1
    """
    count_params = []
    
    if year is not None:
        count_query += " AND y.year = ?"
        count_params.append(year)
    
    if college_id is not None:
        count_query += " AND m.college_id = ?"
        count_params.append(college_id)
    
    if search:
        count_query += " AND m.name LIKE ?"
        count_params.append(f"%{search}%")
    
    cursor.execute(count_query, count_params)
    total = cursor.fetchone()["total"]
    
    # 获取数据
    query = """
        SELECT m.*, c.name as college_name, y.year
        FROM majors m
        LEFT JOIN colleges c ON m.college_id = c.id
        LEFT JOIN years y ON m.year_id = y.id
        WHERE 1=1
    """
    params = []
    
    if year is not None:
        query += " AND y.year = ?"
        params.append(year)
    
    if college_id is not None:
        query += " AND m.college_id = ?"
        params.append(college_id)
    
    if search:
        query += " AND m.name LIKE ?"
        params.append(f"%{search}%")
    
    query += " ORDER BY y.year DESC, m.name LIMIT ? OFFSET ?"
    params.extend([limit, offset])
    
    cursor.execute(query, params)
    rows = cursor.fetchall()
    conn.close()
    
    majors = [dict(row) for row in rows]
    return ApiResponse(success=True, data={
        "items": majors,
        "total": total,
        "limit": limit,
        "offset": offset
    })

@router.get("/{major_id}", response_model=ApiResponse)
async def get_major(major_id: int):
    """获取指定专业"""
    conn = get_db_connection()
    cursor = conn.cursor()
    
    cursor.execute("""
        SELECT m.*, c.name as college_name, y.year
        FROM majors m
        LEFT JOIN colleges c ON m.college_id = c.id
        LEFT JOIN years y ON m.year_id = y.id
        WHERE m.id = ?
    """, (major_id,))
    row = cursor.fetchone()
    conn.close()
    
    if not row:
        raise HTTPException(status_code=404, detail="专业不存在")
    
    return ApiResponse(success=True, data=dict(row))

@router.post("", response_model=ApiResponse)
async def create_major(major_data: MajorCreate):
    """创建专业"""
    conn = get_db_connection()
    cursor = conn.cursor()
    
    try:
        cursor.execute(
            """INSERT INTO majors 
               (year_id, college_id, name, code, category, description, level, department)
               VALUES (?, ?, ?, ?, ?, ?, ?, ?)""",
            (major_data.year_id, major_data.college_id, major_data.name,
             major_data.code, major_data.category, major_data.description,
             major_data.level, major_data.department)
        )
        conn.commit()
        major_id = cursor.lastrowid
        
        cursor.execute("""
            SELECT m.*, c.name as college_name, y.year
            FROM majors m
            LEFT JOIN colleges c ON m.college_id = c.id
            LEFT JOIN years y ON m.year_id = y.id
            WHERE m.id = ?
        """, (major_id,))
        result = cursor.fetchone()
        conn.close()
        
        return ApiResponse(success=True, message="专业创建成功", data=dict(result))
    except Exception as e:
        conn.close()
        raise HTTPException(status_code=400, detail=str(e))

@router.put("/{major_id}", response_model=ApiResponse)
async def update_major(major_id: int, major_data: MajorUpdate):
    """更新专业"""
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # 构建更新语句
    updates = []
    values = []
    for field in ["year_id", "college_id", "name", "code", "category", 
                  "description", "level", "department"]:
        value = getattr(major_data, field, None)
        if value is not None:
            updates.append(f"{field} = ?")
            values.append(value)
    
    if not updates:
        raise HTTPException(status_code=400, detail="没有需要更新的字段")
    
    values.append(major_id)
    query = f"UPDATE majors SET {', '.join(updates)} WHERE id = ?"
    
    cursor.execute(query, values)
    conn.commit()
    
    cursor.execute("""
        SELECT m.*, c.name as college_name, y.year
        FROM majors m
        LEFT JOIN colleges c ON m.college_id = c.id
        LEFT JOIN years y ON m.year_id = y.id
        WHERE m.id = ?
    """, (major_id,))
    result = cursor.fetchone()
    conn.close()
    
    if not result:
        raise HTTPException(status_code=404, detail="专业不存在")
    
    return ApiResponse(success=True, message="专业更新成功", data=dict(result))

@router.delete("/{major_id}", response_model=ApiResponse)
async def delete_major(major_id: int):
    """删除专业"""
    conn = get_db_connection()
    cursor = conn.cursor()
    
    cursor.execute("DELETE FROM majors WHERE id = ?", (major_id,))
    conn.commit()
    affected = cursor.rowcount
    conn.close()
    
    if affected == 0:
        raise HTTPException(status_code=404, detail="专业不存在")
    
    return ApiResponse(success=True, message="专业删除成功")

@router.post("/bulk", response_model=ApiResponse)
async def bulk_create_majors(majors: List[MajorCreate]):
    """批量创建专业"""
    conn = get_db_connection()
    cursor = conn.cursor()
    
    created = []
    errors = []
    
    for major_data in majors:
        try:
            cursor.execute(
                """INSERT INTO majors 
                   (year_id, college_id, name, code, category, description, level, department)
                   VALUES (?, ?, ?, ?, ?, ?, ?, ?)""",
                (major_data.year_id, major_data.college_id, major_data.name,
                 major_data.code, major_data.category, major_data.description,
                 major_data.level, major_data.department)
            )
            created.append(cursor.lastrowid)
        except Exception as e:
            errors.append({"name": major_data.name, "error": str(e)})
    
    conn.commit()
    conn.close()
    
    return ApiResponse(
        success=True,
        message=f"成功创建 {len(created)} 条记录",
        data={"created_count": len(created), "errors": errors}
    )
