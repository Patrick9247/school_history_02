"""
FastAPI 主应用 - 成都理工大学专业沿革数据服务
"""
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from database import init_db
from routes import years_router, colleges_router, majors_router

# 创建 FastAPI 应用
app = FastAPI(
    title="成都理工大学专业沿革 API",
    description="提供年份、学院、专业数据的 CRUD 接口",
    version="1.0.0",
    docs_url="/docs",
    redoc_url="/redoc"
)

# 配置 CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # 生产环境应限制为具体域名
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# 注册路由
app.include_router(years_router)
app.include_router(colleges_router)
app.include_router(majors_router)

@app.on_event("startup")
async def startup_event():
    """应用启动时初始化数据库"""
    init_db()
    print("FastAPI 服务已启动，数据服务就绪！")

@app.get("/", tags=["健康检查"])
async def root():
    """根路径健康检查"""
    return {
        "status": "ok",
        "service": "成都理工大学专业沿革 API",
        "version": "1.0.0"
    }

@app.get("/api/health", tags=["健康检查"])
async def health_check():
    """健康检查接口"""
    return {"status": "healthy"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
