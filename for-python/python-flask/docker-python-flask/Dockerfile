FROM docker-python-base:latest
LABEL author="lazyman"

#代码复制过来后的路径
RUN mkdir /code
WORKDIR /code

#安装需要的python库
RUN pip3 install flask
RUN pip3 install flask-sqlalchemy
RUN pip3 install flask_restful

#如果要安装tushare,则需要安装这些东西
RUN pip3 install bs4 requests pandas
RUN yum -y install gcc gcc-c++ kernel-devel
RUN yum -y install python-devel libxslt-devel libffi-devel openssl-devel
RUN yum -y install mysql-devel
RUN pip3 install matplotlib tushare sqlalchemy lxml MySQL-python
