

FROM index.alauda.cn/library/ubuntu:14.10

MAINTAINER wdj wapznw@gmail.com

ENV TZ "PRC"
RUN echo "Asia/Shanghai" | tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

ENV PATH /usr/local/lib/nodejs/bin:$PATH

# 修改软件源
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
&& echo -e '#!/usr/bin/python3\n' > download_sources.py && echo -e "import os,urllib.request,re\n\nurl = 'http://mirrors.163.com/.help/sources.list.trusty'\nfilename = '/etc/apt/sources.list'\ndata = urllib.request.urlopen(url).read()\nwith open(filename, 'wb') as f:\n    f.write(data)" >> download_sources.py \
&& chmod +x download_sources.py && ./download_sources.py \
&& apt-get update && apt-get install -y wget

# http://mirrors.163.com/.help/sources.list.vivid

# && echo -e "deb http://mirrors.ustc.edu.cn/ubuntu/ trusty main restricted universe multiverse\ndeb http://mirrors.ustc.edu.cn/ubuntu/ trusty-security main restricted universe multiverse\ndeb http://mirrors.ustc.edu.cn/ubuntu/ trusty-updates main restricted universe multiverse\ndeb http://mirrors.ustc.edu.cn/ubuntu/ trusty-proposed main restricted universe multiverse\ndeb http://mirrors.ustc.edu.cn/ubuntu/ trusty-backports main restricted universe multiverse\ndeb-src http://mirrors.ustc.edu.cn/ubuntu/ trusty main restricted universe multiverse\ndeb-src http://mirrors.ustc.edu.cn/ubuntu/ trusty-security main restricted universe multiverse\ndeb-src http://mirrors.ustc.edu.cn/ubuntu/ trusty-updates main restricted universe multiverse\ndeb-src http://mirrors.ustc.edu.cn/ubuntu/ trusty-proposed main restricted universe multiverse\ndeb-src http://mirrors.ustc.edu.cn/ubuntu/ trusty-backports main restricted universe multiverse" > /etc/apt/sources.list \
# && echo -e "deb http://cn.archive.ubuntu.com/ubuntu/ trusty main restricted\ndeb-src http://cn.archive.ubuntu.com/ubuntu/ trusty main restricted\ndeb http://cn.archive.ubuntu.com/ubuntu/ trusty-updates main restricted\ndeb-src http://cn.archive.ubuntu.com/ubuntu/ trusty-updates main restricted\ndeb http://cn.archive.ubuntu.com/ubuntu/ trusty universe\ndeb-src http://cn.archive.ubuntu.com/ubuntu/ trusty universe\ndeb http://cn.archive.ubuntu.com/ubuntu/ trusty-updates universe\ndeb-src http://cn.archive.ubuntu.com/ubuntu/ trusty-updates universe\ndeb http://cn.archive.ubuntu.com/ubuntu/ trusty multiverse\ndeb-src http://cn.archive.ubuntu.com/ubuntu/ trusty multiverse\ndeb http://cn.archive.ubuntu.com/ubuntu/ trusty-updates multiverse\ndeb-src http://cn.archive.ubuntu.com/ubuntu/ trusty-updates multiverse\ndeb http://security.ubuntu.com/ubuntu trusty-security main restricted\ndeb-src http://security.ubuntu.com/ubuntu trusty-security main restricted\ndeb http://security.ubuntu.com/ubuntu trusty-security universe\ndeb-src http://security.ubuntu.com/ubuntu trusty-security universe\ndeb http://security.ubuntu.com/ubuntu trusty-security multiverse\ndeb-src http://security.ubuntu.com/ubuntu trusty-security multiverse\ndeb http://cn.archive.ubuntu.com/ubuntu/ trusty-backports main multiverse universe restricted" > /etc/apt/sources.list \

# 安装node.js
RUN NODE_VERSION=0.12.6 && NODE_HOME=/usr/local/lib/nodejs \
&& wget http://npm.taobao.org/mirrors/node/latest/node-v$NODE_VERSION-linux-x64.tar.gz \
&& tar -zxvf node-v$NODE_VERSION-linux-x64.tar.gz \
&& mv node-v$NODE_VERSION-linux-x64 $NODE_HOME && rm -rf node-v$NODE_VERSION-linux-x64.tar.gz \
&& npm config set registry https://registry.npm.taobao.org

# 安装cloud9
RUN buildDeps='make build-essential g++ gcc python2.7 python2.7-dev' && softDeps="git" \
 && apt-get update && apt-get upgrade -y \
 && apt-get install -y $buildDeps $softDeps --no-install-recommends \
 && ln -s /usr/bin/python2.7 /usr/bin/python \
 && npm install -g forever && npm cache clean \
 && git clone https://git.oschina.net/wapznw/core.git /cloud9 && cd /cloud9 \
 && scripts/install-sdk.sh \
 && apt-get purge -y --auto-remove $buildDeps \
 && apt-get autoremove -y && apt-get autoclean -y && apt-get clean -y \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 && npm cache clean
 
VOLUME /workspace
EXPOSE 8181 
ENTRYPOINT ["forever", "/cloud9/server.js", "-w", "/workspace", "-l", "0.0.0.0"]
