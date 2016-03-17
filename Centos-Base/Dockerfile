# wdj/centos-base 
# centos 集成常用软件镜像

FROM index.alauda.cn/library/centos:6

MAINTAINER wdj wapznw@gmail.com

ENV TZ "PRC"
RUN echo "Asia/Shanghai" | tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

# 修改源
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup \
&& curl -o /etc/yum.repos.d/CentOS-Base.repo https://lug.ustc.edu.cn/wiki/_export/code/mirrors/help/centos?codeblock=2 \
&& curl -o /etc/yum.repos.d/epel.repo https://lug.ustc.edu.cn/wiki/_export/code/mirrors/help/epel?codeblock=0 \
&& curl -o /etc/yum.repos.d/epel-testing.repo https://lug.ustc.edu.cn/wiki/_export/code/mirrors/help/epel?codeblock=1 \
&& yum clean all
# && yum makecache && yum install -y wget

# 安装编译工具
# RUN yum install -y make gcc-c++ gcc glibc-static python git

