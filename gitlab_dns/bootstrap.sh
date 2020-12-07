#!/usr/bin/env bash
# 安装 docker-ce
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh --mirror Aliyun
sudo systemctl enable docker
sudo systemctl start docker
rm -rf get-docker.sh

# 启动 dns
sudo docker run -d --restart=always -p 53:53/tcp -p 53:53/udp --cap-add=NET_ADMIN --name dns-server andyshinn/dnsmasq