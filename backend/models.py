"""
Pydantic 数据模型
"""
from pydantic import BaseModel
from typing import Optional, List
from datetime import datetime

# ============ 年份模型 ============
class YearBase(BaseModel):
    year: int
    event: Optional[str] = None
    dept_count: Optional[int] = 0
    major_count: Optional[int] = 0

class YearCreate(YearBase):
    pass

class YearUpdate(BaseModel):
    year: Optional[int] = None
    event: Optional[str] = None
    dept_count: Optional[int] = None
    major_count: Optional[int] = None

class Year(YearBase):
    id: int
    created_at: Optional[str] = None

    class Config:
        from_attributes = True

# ============ 学院模型 ============
class CollegeBase(BaseModel):
    name: str
    color: Optional[str] = None
    established_year: Optional[int] = None
    description: Optional[str] = None

class CollegeCreate(CollegeBase):
    pass

class CollegeUpdate(BaseModel):
    color: Optional[str] = None
    established_year: Optional[int] = None
    description: Optional[str] = None

class College(CollegeBase):
    id: int
    created_at: Optional[str] = None

    class Config:
        from_attributes = True

# ============ 专业模型 ============
class MajorBase(BaseModel):
    name: str
    code: Optional[str] = None
    category: Optional[str] = None
    description: Optional[str] = None
    level: Optional[str] = None
    department: Optional[str] = None

class MajorCreate(MajorBase):
    year_id: Optional[int] = None
    college_id: Optional[int] = None

class MajorUpdate(BaseModel):
    year_id: Optional[int] = None
    college_id: Optional[int] = None
    name: Optional[str] = None
    code: Optional[str] = None
    category: Optional[str] = None
    description: Optional[str] = None
    level: Optional[str] = None
    department: Optional[str] = None

class Major(MajorBase):
    id: int
    year_id: Optional[int] = None
    college_id: Optional[int] = None
    created_at: Optional[str] = None

    class Config:
        from_attributes = True

# ============ 响应模型 ============
class YearWithMajors(Year):
    majors: List[Major] = []

class CollegeWithMajors(College):
    majors: List[Major] = []

class YearStats(BaseModel):
    year: int
    total_majors: int
    total_colleges: int
    colleges: List[dict]

class ApiResponse(BaseModel):
    success: bool
    message: str = ""
    data: Optional[dict | list] = None
