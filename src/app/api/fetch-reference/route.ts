import { NextRequest, NextResponse } from 'next/server';
import { FetchClient, Config, HeaderUtils } from 'coze-coding-dev-sdk';

export async function GET(request: NextRequest) {
  try {
    const customHeaders = HeaderUtils.extractForwardHeaders(request.headers);
    const config = new Config();
    const client = new FetchClient(config, customHeaders);

    // 读取参考文件
    const fileUrl = 'https://code.coze.cn/api/sandbox/coze_coding/file/proxy?expire_time=-1&file_path=assets%2Fcdut_spiral_tower_full_fix_source.txt&nonce=77cf192e-3dd2-4132-8403-87675fbf113a&project_id=7625930670103068735&sign=e517cf0c0ff640ffa3a876e1014f897b9ac5d59bf6d207292afe177577fef281';

    const response = await client.fetch(fileUrl);

    // 打印调试信息
    console.log('Fetch response status:', response.status_code);
    console.log('Fetch response content length:', response.content.length);
    console.log('Fetch response title:', response.title);

    // 提取文本内容
    const textContent = response.content
      .filter(item => item.type === 'text')
      .map(item => item.text)
      .join('\n');

    console.log('Text content length:', textContent.length);

    return NextResponse.json({
      success: true,
      content: textContent,
      title: response.title,
      status: response.status_code,
      contentLength: textContent.length,
    });
  } catch (error: unknown) {
    console.error('Error fetching reference file:', error);
    return NextResponse.json(
      {
        success: false,
        error: error instanceof Error ? error.message : 'Failed to fetch file',
      },
      { status: 500 }
    );
  }
}
