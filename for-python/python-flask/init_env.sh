#!/bin/bash

#第一步还是关掉setenforce吧，这个问题再次搞了我二天
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config

yum update -y --skip-broken
yum install -y vim
#docker版本过低，添加新源的方法安装
#yum install -y docker 
#yum install epel-release -y
#yum clean all
#yum install docker-io -y
#systemctl start docker
#composer高版本的话还是会出现docker版本太低的问题，安装docker-ce版本
#https://docs.docker.com/install/linux/docker-ce/centos/#install-docker-ce-1
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum-config-manager --enable docker-ce-edge
sudo yum-config-manager --enable docker-ce-test
sudo yum-config-manager --disable docker-ce-edge
sudo yum install docker-ce

#然后加上docker加速,如果是google的服务器，感觉不用阿里云也可以
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["bqr1dr1n.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
#然后是docker-composer 同样的如果不是阿里云的服务器，可用原来的地址
#sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo curl -L https://get.daocloud.io/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
