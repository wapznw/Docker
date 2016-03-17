# wdj/centos-node
# centos 集成 nodejs

FROM wdj/centos-base

MAINTAINER wdj wapznw@gmail.com

ENV TZ "PRC"
RUN echo "Asia/Shanghai" | tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

ENV PATH /usr/local/lib/nodejs/bin:$PATH

RUN NODE_VERSION=5.8.0 && NODE_HOME=/usr/local/lib/nodejs \
&& yum install -y wget \
&& wget http://npm.taobao.org/mirrors/node/latest/node-v$NODE_VERSION-linux-x64.tar.gz \
&& tar -zxvf node-v$NODE_VERSION-linux-x64.tar.gz \
&& mv node-v$NODE_VERSION-linux-x64 $NODE_HOME && rm -rf node-v$NODE_VERSION-linux-x64.tar.gz \
&& npm config set registry https://registry.npm.taobao.org \
&& node -v && npm cache clean && yum remove -y wget && yum clean all
