import { NextRequest, NextResponse } from 'next/server';
import { FetchClient, Config, HeaderUtils } from 'coze-coding-dev-sdk';

export async function GET(request: NextRequest) {
  try {
    const customHeaders = HeaderUtils.extractForwardHeaders(request.headers);
    const config = new Config();
    const client = new FetchClient(config, customHeaders);

    // 读取Excel数据
    const excelUrl = 'https://coze-coding-project.tos.coze.site/create_attachment/2026-04-07/1875106596136839_d415ea5363de1120f04fea8a9049ff53_%E6%9C%AC%E7%A7%91%E4%B8%93%E4%B8%9A%E5%8F%91%E5%B1%95-%E5%AF%BC%E5%87%BA%E6%95%B0%E6%8D%AE%20(1).xlsx?sign=4897614799-d81d6c4e96-0-51628ee0bbf5968faf216990c523df2b8f9f776782b8cebcb0d9f3d9e9d55077';

    const response = await client.fetch(excelUrl);

    // 打印原始响应内容，用于调试
    console.log('Response status:', response.status_code);
    console.log('Response status_message:', response.status_message);
    console.log('Response title:', response.title);
    console.log('Response filetype:', response.filetype);
    console.log('Content length:', response.content.length);
    if (response.content.length > 0) {
      console.log('First content item:', JSON.stringify(response.content[0], null, 2));
    }

    // 如果获取失败，返回错误信息
    if (response.status_code !== 0) {
      return NextResponse.json({
        success: false,
        error: `Fetch failed with status ${response.status_code}: ${response.status_message}`,
        debug: {
          status_code: response.status_code,
          status_message: response.status_message,
          title: response.title,
          filetype: response.filetype,
        }
      }, { status: 500 });
    }

    // 提取文本内容（Excel数据会被解析为文本格式）
    const textContent = response.content
      .filter(item => item.type === 'text')
      .map(item => item.text)
      .join('\n');

    console.log('Text content preview:', textContent.substring(0, 500));

    // 解析Excel数据（假设是CSV格式的文本）
    const lines = textContent.split('\n').filter(line => line.trim());
    const headers = lines[0]?.split('\t') || [];
    const data = lines.slice(1).map(line => {
      const values = line.split('\t');
      const obj: Record<string, string> = {};
      headers.forEach((header, index) => {
        obj[header.trim()] = values[index]?.trim() || '';
      });
      return obj;
    });

    return NextResponse.json({
      success: true,
      title: response.title,
      headers,
      data,
    });
  } catch (error: unknown) {
    console.error('Error fetching Excel data:', error);
    return NextResponse.json(
      {
        success: false,
        error: error instanceof Error ? error.message : 'Failed to fetch Excel data',
      },
      { status: 500 }
    );
  }
}
