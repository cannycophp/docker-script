#!/bin/bash

#1 install docker
yum install epel-release -y
yum clean all
yum install docker-io -y
systemctl start docker

#然后加上docker加速
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["bqr1dr1n.mirror.aliyuncs.com"]
}
EOF

sudo systemctl daemon-reload
sudo systemctl restart docker

#2 install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#3 install docker redis
mkdir -p ~/redis ~/redis/data

touch Dockerfile
sudo tee Dockerfile <<-'EOF'
FROM redis:3.2
EOF

#4 创建并启动redis镜像
docker build  -t redis:3.2 .
docker run -p 6379:6379 -v $PWD/data:/data  -d redis:3.2 redis-server --appendonly yes

