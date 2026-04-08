# 项目上下文

### 版本技术栈

- **Framework**: Next.js 16 (App Router)
- **Core**: React 19
- **Language**: TypeScript 5
- **UI 组件**: shadcn/ui (基于 Radix UI)
- **Styling**: Tailwind CSS 4

## 目录结构

```
├── public/                 # 静态资源
├── scripts/                # 构建与启动脚本
│   ├── build.sh            # 构建脚本
│   ├── dev.sh              # 开发环境启动脚本
│   ├── prepare.sh          # 预处理脚本
│   └── start.sh            # 生产环境启动脚本
├── src/
│   ├── app/                # 页面路由与布局
│   ├── components/ui/      # Shadcn UI 组件库
│   ├── hooks/              # 自定义 Hooks
│   ├── lib/                # 工具库
│   │   └── utils.ts        # 通用工具函数 (cn)
│   └── server.ts           # 自定义服务端入口
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


## UI 设计与组件规范 (UI & Styling Standards)

- 模板默认预装核心组件库 `shadcn/ui`，位于`src/components/ui/`目录下
- Next.js 项目**必须默认**采用 shadcn/ui 组件、风格和规范，**除非用户指定用其他的组件和规范。**

## 项目特性

### 大学专业历史3D可视化系统

基于Canvas的3D可视化项目，展示大学专业历史发展，支持螺旋时间轴和太阳系两种视图。

#### 学院球体渲染（行星风格）
- 强对比基础渐变：从左上光源方向到右下阴影，对比强烈
- 多层表面纹理：
  - 主条纹带（水平环绕，带漩涡弯曲）
  - 细条纹（高纬度细节）
  - 漩涡斑块（模拟大红斑效果）
  - 云带（亮色横向条纹）
- 晨昏线阴影：背光面渐变效果
- 双层大气辉光：边缘蓝色发光
- 极地冰盖：北极和南极白色冰盖

#### 渲染参数（planetData）
- `swirlStrength`: 漩涡强度
- `turbulence`: 湍流强度
- `bandWidthVar`: 条纹宽度变化
- `bandColors`: 条纹颜色数组
- `bandCount`: 条纹数量

#### 球体类型
- 螺旋页面：专业球体（发光光球效果）
- 学院页面：学院球体（行星风格纹理）


