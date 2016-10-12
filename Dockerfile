FROM centos:7
MAINTAINER ptim007@yahoo.com
ENV NODE_VER=6.7.0
RUN yum -y install gcc make gcc-c++ tar gzip wget libaio-devel unzip vi git && yum clean all
RUN cd /opt && wget https://nodejs.org/dist/v${NODE_VER}/node-v${NODE_VER}-linux-x64.tar.xz \
    && tar xf node-v${NODE_VER}-linux-x64.tar.xz && rm node-v${NODE_VER}-linux-x64.tar.xz
ADD oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm /opt/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
RUN rpm -i /opt/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm && rm /opt/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
ADD oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm /opt/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
RUN rpm -i /opt/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm && rm /opt/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
ENV PATH $PATH:/opt/node-v${NODE_VER}-linux-x64/bin
ENV NODE_PATH /opt/node-v${NODE_VER}-linux-x64
ADD sample /opt/sample
RUN cd /opt/sample && npm install
ENV NODE_PATH /usr/local/lib/node_modules
