# wdj/centos-base 
# centos 集成常用软件镜像

FROM index.alauda.cn/library/centos:centos6.7

MAINTAINER wdj wapznw@gmail.com

ENV TZ "PRC"
RUN echo "Asia/Shanghai" | tee /etc/timezone
# && dpkg-reconfigure --frontend noninteractive tzdata

# 修改源
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup \
&& curl -o /etc/yum.repos.d/CentOS-Base.repo https://lug.ustc.edu.cn/wiki/_export/code/mirrors/help/centos?codeblock=2 \
&& curl -o /etc/yum.repos.d/epel.repo https://lug.ustc.edu.cn/wiki/_export/code/mirrors/help/epel?codeblock=0 \
&& curl -o /etc/yum.repos.d/epel-testing.repo https://lug.ustc.edu.cn/wiki/_export/code/mirrors/help/epel?codeblock=1 \
&& yum clean all && yum makecache \
&& rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm \
&& rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6 \
&& yum install -y openssh openssh-clients openssh-server pwgen \
&& chkconfig --level 123456 sshd on && yum clean all

# 安装编译工具
# RUN yum install -y make gcc-c++ gcc glibc-static python git

EXPOSE 22
