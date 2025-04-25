FROM debian:11-slim

WORKDIR /app

# 安装必要依赖
RUN apt-get update && \
    apt-get install -y wget tar && \
    rm -rf /var/lib/apt/lists/*

# 复制配置文件
COPY . .

# 下载并解压epusdt
RUN chmod +x epusdt

# 暴露端口
EXPOSE 8000

# 启动命令
CMD ["./epusdt", "http", "start"]