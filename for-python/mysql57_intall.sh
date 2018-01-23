#!/bin/bash

# 下载mysql源安装包
wget http://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm
#安装mysql源
yum localinstall mysql57-community-release-el7-8.noarch.rpm
#检查mysql源是否安装成功
yum repolist enabled | grep "mysql.*-community.*"
#安装MySQL
yum -y install mysql-community-server
#启动MySQL服务
systemctl start mysqld
#查看MySQL的启动状态
systemctl status mysqld
#开机启动
systemctl enable mysqld
systemctl daemon-reload
#修改root本地登录密码
temp_password=`grep 'temporary password' /var/log/mysqld.log | awk '{print $11}'`
echo $temp_password
mysql -uroot -hlocalhost -p$temp_password
ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass4!';
show variables like '%password%';
GRANT ALL PRIVILEGES ON *.* TO 'lijie'@'%' IDENTIFIED BY 'Lijie123!' WITH GRANT OPTION;
exit
sed -i '/\[mysqld\]/a character_set_server=utf8\ninit_connect="SET NAMES utf8"' /etc/my.cnf
systemctl restart mysqld
