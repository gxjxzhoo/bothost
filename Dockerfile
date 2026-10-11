FROM python:3.12-slim

WORKDIR /app

# 安装系统依赖（部分混淆代码可能用到）
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# 使用非 root 用户更安全（可选）
# RUN useradd -m appuser && chown -R appuser /app
# USER appuser

CMD ["python", "app.py"]
