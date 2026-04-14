"""
路由模块
"""
from .years import router as years_router
from .colleges import router as colleges_router
from .majors import router as majors_router

__all__ = ["years_router", "colleges_router", "majors_router"]
