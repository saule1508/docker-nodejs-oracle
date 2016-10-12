# docker-nodejs-oracle

A docker file for developping and deploying in nodejs with the oracle driver

You must manually download the following rpm from oracle technet and install them in the same directory as the Dockerfile

* oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
* oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm

to build the image:
* clone the repository
* put the two rpm's mentionned above in the current directory
* run the docker build command

```
 docker build -t nodejs:6.7.0 .
```
to run the image:
```
docker run -ti nodejs:6.7.0 /bin/bash
```
once in the container, go to directory /opt/sample, edit the db configuration file config/dbconfig.js and type
```
node testdao.js
```
In a typical development environment, you would have your sources code on your windows host and then share the sources via a docker host volume

```
docker run -ti -v c:\data\git\myprojects:/sources nodejs /bin/bash
```

then cd in /sources, do the npm install and start node.
