# argo (v26)

Argo / Xray 节点脚本，Python 版与 Node 版功能一致。

## 目录
- `python/` app.py + Dockerfile + requirements.txt
- `node/`   index.js + Dockerfile + package.json
- `.github/workflows/image-python.yml` 改动 python/ 时构建 python 镜像
- `.github/workflows/image-node.yml` 改动 node/ 时构建 node 镜像
- 两个都可手动触发，均为 amd64/arm64

## 镜像
- `ghcr.io/gxjxzhoo/python:latest` / `<Docker Hub 用户名>/python:latest`
- `ghcr.io/gxjxzhoo/node:latest`   / `<Docker Hub 用户名>/node:latest`
- Docker Hub 用户名由 DOCKERHUB_TOKEN 自动验证得出(候选: DOCKERHUB_USERNAME、gxjxzgx、仓库所有者)

## 工作流需要的 Secrets
- `PRIVATE_REPO_TOKEN`：读取私有仓库 gxjxzhoo/env-config 的 .env（里面的 DOCKERHUB_TOKEN 会自动加载）
- `DOCKERHUB_TOKEN`：可选，env-config 读不到时的备用

## 运行
```
docker run -d --name argo -p 3000:3000 \
  -e UUID=xxxx -e ARGO_DOMAIN=xx -e ARGO_AUTH=xx \
  -e HY2_PORT=0 -e REALITY_PORT=0 -e S5_PORT=0 \
  -e TG_CHAT_ID=xxx -e TG_BOT_TOKEN=xxx \
  ghcr.io/gxjxzhoo/python:latest
```
直连端口(HY2/Reality/S5)用固定端口时需同时 `-p` 映射，HY2 为 UDP。

## v26 变更
- 删除 WS_PORT、WS_TLS_PORT、REALITY_XHTTP_PORT、XHTTP_TLS_PORT、TLS_DOMAIN 及对应节点
- TG 变量改名为 TG_CHAT_ID、TG_BOT_TOKEN，脚本内不再写死，全部由环境变量提供
