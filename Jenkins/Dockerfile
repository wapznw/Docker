FROM java:8-jdk

MAINTAINER wdj wapznw@gmail.com

# 设置时区
ENV TZ "PRC"
RUN echo "Asia/Shanghai" | tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get update && apt-get install -y git curl zip && rm -rf /var/lib/apt/lists/*

ENV JENKINS_HOME /var/jenkins_home
ENV JENKINS_SLAVE_AGENT_PORT 50000

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000


RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
&& curl -o /etc/apt/sources.list http://mirrors.163.com/.help/sources.list.jessie \
&& apt-get update && apt-get install -y lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6 \
&& apt-get autoremove -y && apt-get autoclean -y && apt-get clean -y \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
&& npm cache clean 
