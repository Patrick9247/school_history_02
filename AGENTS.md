# 项目上下文

### 版本技术栈

- **Framework**: Next.js 16 (App Router)
- **Core**: React 19
- **Language**: TypeScript 5
- **UI 组件**: shadcn/ui (基于 Radix UI)
- **Styling**: Tailwind CSS 4

## 项目说明

成都理工大学专业发展可视化系统，展示 1956 年至今的本科专业设置历史变迁。

### 核心功能
- **螺旋塔视图**：按年份排列的专业节点，支持 3D 旋转、拖拽、缩放
- **太阳系视图**：按院系分组的专业展示，学院围绕中心呈轨道排列
- **视图切换**：一键切换螺旋塔/太阳系两种可视化模式
- **交互功能**：鼠标拖拽旋转、滚轮缩放、悬停高亮显示详情

### 数据来源
- API 接口：`/api/professional-history`
- 数据字段：year（年份）、major（专业）、category（学院）、department（院系）、level（层次）

## 目录结构

```
├── public/                 # 静态资源
├── scripts/                # 构建与启动脚本
│   ├── build.sh            # 构建脚本
│   ├── dev.sh              # 开发环境启动脚本
│   ├── prepare.sh          # 预处理脚本
│   └── start.sh            # 生产环境启动脚本
├── src/
│   ├── app/
│   │   ├── api/            # API 路由
│   │   │   ├── professional-history/  # 专业历史数据 API
│   │   │   ├── fetch-data/            # Excel 数据获取 API
│   │   │   └── fetch-reference/       # 参考文件获取 API
│   │   ├── page.tsx         # 主页面（螺旋塔 + 太阳系视图）
│   │   └── layout.tsx       # 布局
│   ├── components/ui/      # Shadcn UI 组件库
│   ├── hooks/              # 自定义 Hooks
│   ├── lib/                # 工具库
│   │   └── utils.ts        # 通用工具函数 (cn)
│   └── server.ts           # 自定义服务端入口
├── data/                   # 本地数据存储目录
│   └── professional-history.json  # 专业历史数据缓存
├── next.config.ts          # Next.js 配置
├── package.json            # 项目依赖管理
└── tsconfig.json           # TypeScript 配置
```

- 项目文件（如 app 目录、pages 目录、components 等）默认初始化到 `src/` 目录下。

## 包管理规范

**仅允许使用 pnpm** 作为包管理器，**严禁使用 npm 或 yarn**。
**常用命令**：
- 安装依赖：`pnpm add <package>`
- 安装开发依赖：`pnpm add -D <package>`
- 安装所有依赖：`pnpm install`
- 移除依赖：`pnpm remove <package>`

## 开发规范

- **项目理解加速**：初始可以依赖项目下`package.json`文件理解项目类型，如果没有或无法理解退化成阅读其他文件。
- **Hydration 错误预防**：严禁在 JSX 渲染逻辑中直接使用 typeof window、Date.now()、Math.random() 等动态数据。必须使用 'use client' 并配合 useEffect + useState 确保动态内容仅在客户端挂载后渲染；同时严禁非法 HTML 嵌套（如 <p> 嵌套 <div>）。

### 关键文件说明
- **src/app/page.tsx**：核心组件，包含螺旋塔和太阳系两种可视化视图的实现
  - `ProfessionalSpiralTower` 组件：主组件
  - 螺旋塔视图：3D 旋转螺旋结构，按年份显示专业节点
  - 太阳系视图：中心年份球，周围院系球围绕轨道排列
  - 使用 Canvas API 绘制 3D 效果
  - 支持 drag、zoom、hover 交互

### 构建与测试命令
- **依赖安装**：`pnpm install`
- **开发环境**：`coze dev`
- **代码检查**：`pnpm lint`、`pnpm ts-check`
- **构建**：`coze build`

### 常见问题
1. **Canvas 3D 效果不显示**：确保 `useEffect` 中正确设置了 canvas.width 和 canvas.height
2. **数据加载失败**：检查 `/api/professional-history` 接口返回格式
3. **视图切换卡顿**：检查 ref 数据是否正确更新，避免不必要的重渲染


## UI 设计与组件规范 (UI & Styling Standards)

- 模板默认预装核心组件库 `shadcn/ui`，位于`src/components/ui/`目录下
- Next.js 项目**必须默认**采用 shadcn/ui 组件、风格和规范，**除非用户指定用其他的组件和规范。**


