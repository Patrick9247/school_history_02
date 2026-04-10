import { NextRequest, NextResponse } from 'next/server';

const COZE_API_URL = 'https://6w8mtcbd5j.coze.site/stream_run';
const COZE_TOKEN = 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjdlOTQ2MGFjLWM5NjYtNGE5Ny1iYTk1LTU2YjVmMzVhYTc4NSJ9.eyJpc3MiOiJodHRwczovL2FwaS5jb3plLmNuIiwiYXVkIjpbIlJYRnM3anoxakRnWGU1ckQ0U0xOWXIzSXFhaDZjSHBvIl0sImV4cCI6ODIxMDI2Njg3Njc5OSwiaWF0IjoxNzc1NzkwNjkzLCJzdWIiOiJzcGlmZmU6Ly9hcGkuY296ZS5jbi93b3JrbG9hZF9pZGVudGl0eS9pZDo3NTk5ODcyOTQ3NjYyMDk0MzYzIiwic3JjIjoiaW5ib3VuZF9hdXRoX2FjY2Vzc190b2tlbl9pZDo3NjI2OTYyOTUzNzY5NTgyNjI4In0.QCQ5y3BYT_PcdjjXQjtGWTIJpuw-3MLwspj1PMD85ON_E9jSIQdWGvvXgPdfLFDBr4QmtoCrlv1X0Usv8Mjdn_oLMCijxTfIZhJR8IZO9oLHeRt4VIbzqrcphSoxpT6VgCmRoarBSDzUXRyMlh57RWnr8rMBKNmGHI2erZtg-nxlu27p8clN9JSjKkhm3A6IlxM7WRr5fCrt0nX8GDnAR52Iv5Nqyv9ATBmJhbOgDf9wIrPPFzxc2diPlrRPZ4pOh7g-ixlTEuxaaL5KIDlYjPTg-cC-b4pQnA_F3wNVVZjUx3d5VsHtPESfcAvfwIpQHZo1icDMzprI-Ex9wumFVQ';

export async function POST(request: NextRequest) {
  try {
    const { query, conversation_id } = await request.json();
    
    if (!query) {
      return NextResponse.json({ error: 'Query is required' }, { status: 400 });
    }
    
    const response = await fetch(COZE_API_URL, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${COZE_TOKEN}`
      },
      body: JSON.stringify({
        conversation_id: conversation_id || 'conv_' + Date.now(),
        bot_id: '7625930670103068735',
        user_id: 'web_user',
        query: query,
        stream: false
      })
    });
    
    // 读取流式响应
    const reader = response.body?.getReader();
    const decoder = new TextDecoder();
    let fullResponse = '';
    
    if (reader) {
      while (true) {
        const { done, value } = await reader.read();
        if (done) break;
        
        const chunk = decoder.decode(value, { stream: true });
        const lines = chunk.split('\n');
        
        for (const line of lines) {
          if (line.startsWith('data: ')) {
            try {
              const data = JSON.parse(line.substring(6));
              if (data.content?.answer) {
                fullResponse += data.content.answer;
              }
            } catch (e) {
              // 忽略解析错误
            }
          }
        }
      }
    }
    
    if (!fullResponse) {
      return NextResponse.json({ answer: '抱歉，未收到有效回复' });
    }
    
    return NextResponse.json({ answer: fullResponse });
  } catch (error: any) {
    console.error('Coze API Error:', error);
    return NextResponse.json({ error: error?.message || 'API request failed' }, { status: 500 });
  }
}
