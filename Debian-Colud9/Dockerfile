

FROM index.alauda.cn/library/node:slim

MAINTAINER wdj wapznw@gmail.com

ENV TZ "PRC"
RUN echo "Asia/Shanghai" | tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

# 修改软件源
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
&& curl -o /etc/apt/sources.list http://mirrors.163.com/.help/sources.list.jessie \
&& apt-get update && apt-get install -y wget

# 安装cloud9
RUN npm config set registry https://registry.npm.taobao.org \
&& buildDeps='make build-essential g++ gcc python2.7' && softDeps="git" \
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
