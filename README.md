# docker-nodejs-oracle

A docker file for developping and deploying in nodejs with the oracle driver
You must manually download the following rpm from oracle technet

* oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
* oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm

build the image:
* clone the repository
* put the two rpm's mentionned above in the current directory
* run
 docker build -t testoraclenode .

run the image:
docker run -ti testoraclenode /bin/bash

once in the container, go to /opt/sample, edit the db configuration file config/dbconfig.js and type

node testdao.js
