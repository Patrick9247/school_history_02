"""
SQLite 数据库模块
"""
import sqlite3
import os
from pathlib import Path

# 数据库文件路径 - 使用绝对路径
import os
# 获取项目根目录 (backend/ -> project root)
BACKEND_DIR = Path(__file__).parent.resolve()
PROJECT_ROOT = BACKEND_DIR.parent  # backend -> school_history_02
DATA_DIR = PROJECT_ROOT / "data"
DATA_DIR.mkdir(parents=True, exist_ok=True)
DB_PATH = DATA_DIR / "school_history.db"

print(f"Database path: {DB_PATH}")  # 调试输出

def get_db_connection():
    """获取数据库连接"""
    DB_PATH.parent.mkdir(parents=True, exist_ok=True)
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn

def init_db():
    """初始化数据库表"""
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # 创建年份表
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS years (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            year INTEGER UNIQUE NOT NULL,
            event TEXT,
            dept_count INTEGER DEFAULT 0,
            major_count INTEGER DEFAULT 0
        )
    """)
    
    # 创建学院表
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS colleges (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT UNIQUE NOT NULL,
            color TEXT,
            established_year INTEGER,
            description TEXT
        )
    """)
    
    # 创建专业表
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS majors (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            year_id INTEGER,
            college_id INTEGER,
            name TEXT NOT NULL,
            code TEXT,
            category TEXT,
            description TEXT,
            level TEXT,
            department TEXT,
            created_at TEXT DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY (year_id) REFERENCES years(id),
            FOREIGN KEY (college_id) REFERENCES colleges(id)
        )
    """)
    
    # 创建索引
    cursor.execute("CREATE INDEX IF NOT EXISTS idx_majors_year ON majors(year_id)")
    cursor.execute("CREATE INDEX IF NOT EXISTS idx_majors_college ON majors(college_id)")
    
    conn.commit()
    conn.close()
    print(f"数据库初始化完成: {DB_PATH}")

if __name__ == "__main__":
    init_db()
