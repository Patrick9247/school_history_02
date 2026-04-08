import { NextResponse } from 'next/server';
import { FetchClient, Config } from 'coze-coding-dev-sdk';

export async function GET() {
  const imageUrl = 'https://code.coze.cn/api/sandbox/coze_coding/file/proxy?expire_time=-1&file_path=assets%2F01%E6%A0%A0%E7%A4%BA%E6%A0%87%E5%87%86%E5%BD%A9%E8%89%B2%E5%9B%BE%E5%BD%A2.png&nonce=eefdcd9d-fc58-464e-922c-cb814c6693b8&project_id=7625930670103068735&sign=d19a30bf8ad1850f21577f4682c2b7b88341365ef8b67d250b540f7b4b0041bc';
  
  try {
    const config = new Config();
    const client = new FetchClient(config);
    
    const response = await client.fetch(imageUrl);
    
    if (response.status_code === 0) {
      const images = response.content.filter(item => item.type === 'image');
      if (images.length > 0 && images[0].image?.display_url) {
        return NextResponse.json({ url: images[0].image.display_url });
      }
    }
    
    return NextResponse.json({ error: 'Failed to fetch image' }, { status: 500 });
  } catch (error) {
    return NextResponse.json({ error: String(error) }, { status: 500 });
  }
}
