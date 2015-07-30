# Originally forked from: git@github.com:gasi/docker-node-hello.git

FROM node:0.10

MAINTAINER Anna Doe <anna@example.com>

USER root

ENV AP /data/app
ENV SCPATH /etc/supervisor/conf.d

RUN apt-get -y update

# The daemons
RUN apt-get -y install supervisor
RUN mkdir -p /var/log/supervisor

# Supervisor Configuration
ADD node.conf $SCPATH/

ADD supervisord.conf $SCPATH/

# Application Code
ADD index.js $AP/

ADD package.json $AP/

RUN cd $AP; npm install

RUN npm install

CMD ["supervisord", "-n"]

