#!/bin/bash

#本身有phthon2，然后安装一个python3，然后用env切换
#然后安装bs4 requests pandas matlime什么的

#1安装python3
yum update -y
yum install -y zlib zlib-devel
#wget https://www.python.org/ftp/python/3.6.4/Python-3.6.4.tgz
#tar -zxvf Python-3.6.4.tgz
#cd Python-3.6.4
#./configure
#make
#make install
pip install virtualenv
virtualenv -p /usr/bin/python py27env
virtualenv -p /usr/local/bin/python3 py36env
#切换到py27env然后安装bs4 requests pandas matplotlib
source py27env/bin/activate
pip install bs4 requests pandas
yum -y install gcc gcc-c++ kernel-devel
yum -y install python-devel libxslt-devel libffi-devel openssl-devel
pip install matplotlib tushare
