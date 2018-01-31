FROM docker-python-base:latest
LABEL author="lazyman"

#代码复制过来后的路径
RUN mkdir /code
WORKDIR /code

#安装需要的python库
RUN pip3 install flask
RUN pip3 install flask-sqlalchemy
RUN pip3 install flask_restful
