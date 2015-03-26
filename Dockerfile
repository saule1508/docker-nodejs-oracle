FROM centos
MAINTAINER ptim007@yahoo.com
RUN yum -y install gcc make gcc-c++ tar gzip wget libaio-devel unzip vi git && yum clean all
RUN cd /usr/src && wget http://nodejs.org/dist/v0.10.36/node-v0.10.36.tar.gz && tar xzf node-v0.10.36.tar.gz && rm node-v0.10.36.tar.gz
RUN cd /usr/src/node-v0.10.36 ; ./configure ; make ; make install
ADD oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm /opt/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
RUN rpm -i /opt/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm && rm /opt/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
ADD oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm /opt/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
RUN rpm -i /opt/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm && rm /opt/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
RUN cd /opt && git clone https://github.com/oracle/node-oracledb.git && cd node-oracledb && npm install -g
ADD sample /opt/
RUN cp /opt/sample ; npm install
ENV NODE_PATH /usr/local/lib/node_modules
