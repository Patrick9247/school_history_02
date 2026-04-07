import type { Metadata } from 'next';
import { Inspector } from 'react-dev-inspector';
import './globals.css';

export const metadata: Metadata = {
  title: {
    default: '成都理工大学专业沿革星系图',
    template: '%s | 成都理工大学',
  },
  description:
    '成都理工大学专业沿革星系图 - 展示学校自1956年成立以来72年岁月长河中的专业发展历程。',
  keywords: [
    '成都理工大学',
    '专业沿革',
    '星系图',
    '历史数据',
    '学院发展',
    '专业演变',
  ],
  authors: [{ name: 'Coze Code Team', url: 'https://code.coze.cn' }],
  generator: 'Coze Code',
  // icons: {
  //   icon: '',
  // },
  openGraph: {
    title: '成都理工大学专业沿革星系图',
    description:
      '成都理工大学专业沿革星系图 - 展示学校自1956年成立以来72年岁月长河中的专业发展历程。',
    url: 'https://code.coze.cn',
    siteName: '成都理工大学',
    locale: 'zh_CN',
    type: 'website',
    // images: [
    //   {
    //     url: '',
    //     width: 1200,
    //     height: 630,
    //     alt: '扣子编程 - 你的 AI 工程师',
    //   },
    // ],
  },
  // twitter: {
  //   card: 'summary_large_image',
  //   title: 'Coze Code | Your AI Engineer is Here',
  //   description:
  //     'Build and deploy full-stack applications through AI conversation. No env setup, just flow.',
  //   // images: [''],
  // },
  robots: {
    index: true,
    follow: true,
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  const isDev = process.env.COZE_PROJECT_ENV === 'DEV';

  return (
    <html lang="en">
      <body className={`antialiased`}>
        {isDev && <Inspector />}
        {children}
      </body>
    </html>
  );
}
