import type { NextConfig } from 'next';

const nextConfig: NextConfig = {
  // outputFileTracingRoot: path.resolve(__dirname, '../../'),  // Uncomment and add 'import path from "path"' if needed
  /* config options here */
  allowedDevOrigins: ['*.dev.coze.site'],
  images: {
    remotePatterns: [
      {
        protocol: 'https',
        hostname: '*',
        pathname: '/**',
      },
    ],
  },
  // 性能优化配置
  compress: true,
  // 优化 lucide-react 图标导入，按需加载单个图标
  modularizeImports: {
    'lucide-react': {
      transform: 'lucide-react/dist/esm/icons/{{name}}',
    },
  },
};

export default nextConfig;
