# wdj/centos-cloud9
# centos 集成 nodejs+cloud9

FROM wdj/centos-node

MAINTAINER wdj wapznw@gmail.com

ENV TZ "PRC"
RUN echo "Asia/Shanghai" | tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

# 如果为安装GLIBC_2.14 需要编译安装 http://mirrors.ustc.edu.cn/gnu/libc/glibc-2.14.1.tar.gz
# RUN wget http://mirrors.ustc.edu.cn/gnu/libc/glibc-2.14.1.tar.gz \
# && tar -zxvf glibc-2.14.1.tar.gz && cd glibc-2.14.1 && mkdir build \
# && cd ./build && ../configure --prefix=/opt/glibc-2.14 && make -j4 && make install \
# && export LD_LIBRARY_PATH=/opt/glibc-2.14/lib:$LD_LIBRARY_PATH

RUN buildDeps="gcc gcc-c++ glibc-static wget" && softDeps="make git" \
&& yum install -y $buildDeps $softDeps \
&& wget http://mirrors.ustc.edu.cn/gnu/libc/glibc-2.14.1.tar.gz \
&& tar -zxvf glibc-2.14.1.tar.gz && cd glibc-2.14.1 && mkdir build \
&& cd ./build && ../configure --prefix=/opt/glibc-2.14 && make && make install \
&& LD_LIBRARY_PATH=/opt/glibc-2.14/lib:$LD_LIBRARY_PATH \
&& cd ../../ && rm -rf glibc-2.14.1 glibc-2.14.1.tar.gz \
&& wget http://mirrors.sohu.com/python/2.7.6/Python-2.7.6.tgz \
&& tar -zxvf Python-2.7.6.tgz && cd Python-2.7.6 \
&& ./configure --prefix=/usr/local/python27 && make && mv /usr/bin/python /usr/bin/python_old && make install \
&& ln -s /usr/local/python27/bin/python /usr/bin/python \
&& sed -i "s/python/python_old/g" /usr/bin/yum \
&& cd .. && rm -rf Python-2.7.6 && rm -rf Python-2.7.6.tgz \
&& npm install -g forever \
&& git clone https://git.oschina.net/wapznw/core.git /cloud9 && cd /cloud9 \
&& scripts/install-sdk.sh \
&& npm cache clean && yum remove -y $buildDeps && yum clean all

VOLUME /workspace
EXPOSE 8181
ENTRYPOINT ["forever", "/cloud9/server.js", "-w", "/workspace", "-l", "0.0.0.0"]

# yum install -y php php-fpm php-mysql php-pear php-pdo php-gd php-xml php-redis php-pecl-xdebug php-pecl-memcached php-pecl-memcache php-pecl-mongo php-pecl-http php-mcrypt php-mbstring
# node-v0.12.6-linux-x64.tar.gz

# RUN NODE_VERSION=0.12.6 && NODE_HOME=/usr/local/lib/nodejs \
# && wget http://npm.taobao.org/mirrors/node/latest/node-v$NODE_VERSION-linux-x64.tar.gz \
# && tar -zxvf node-v$NODE_VERSION-linux-x64.tar.gz \
# && mv node-v$NODE_VERSION-linux-x64 $NODE_HOME && rm -rf node-v$NODE_VERSION-linux-x64.tar.gz \
# && ln -s $NODE_HOME/bin/node /usr/bin/node && ln -s $NODE_HOME/bin/npm /usr/bin/npm \
# && echo -e "\nexport PATH=\$PATH:$NODE_HOME/bin\n" >> ~/.bash_profile  \
# && source ~/.bash_profile \
# && npm config set registry https://registry.npm.taobao.org

