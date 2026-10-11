# bothost

## 运行方式

### Docker
```bash
docker build -t gxjxzgx/bothost:latest .
docker run -d --name bothost --restart unless-stopped gxjxzgx/bothost:latest
```

### 本地
```bash
pip install -r requirements.txt
python app.py
```
