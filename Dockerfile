FROM centos:7
MAINTAINER ptim007@yahoo.com
RUN yum -y install gcc make gcc-c++ tar gzip wget libaio-devel unzip vi git && yum clean all
RUN cd /opt && wget https://nodejs.org/download/release/v0.12.7/node-v0.12.7-linux-x64.tar.gz && tar xzf node-v0.12.7-linux-x64.tar.gz && rm node-v0.12.7-linux-x64.tar.gz
ADD oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm /opt/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
RUN rpm -i /opt/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm && rm /opt/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
ADD oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm /opt/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
RUN rpm -i /opt/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm && rm /opt/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
ENV PATH $PATH:/opt/node-v0.12.7-linux-x64/bin
RUN cd /opt && git clone https://github.com/oracle/node-oracledb.git && cd node-oracledb && npm install -g
ADD sample /opt/sample
RUN cd /opt/sample && npm install
ENV NODE_PATH /usr/local/lib/node_modules
