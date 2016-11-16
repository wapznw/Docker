FROM index.alauda.cn/library/ubuntu:14.04

MAINTAINER wdj wapznw@gmail.com

WORKDIR /workspace

ENV TZ "PRC"
RUN echo "Asia/Shanghai" | tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

ENV PATH /usr/local/lib/nodejs/bin:$PATH

ENV SVN_DOMAIN svn.vc.maosui.com

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak

COPY sources.list /etc/apt/sources.list

# 修改软件源
RUN apt-get update && apt-get install -y wget unzip subversion apache2 libapache2-svn subversion php5 php5-mcrypt php5-sqlite \
&& cd /etc/apache2/mods-enabled && ln -s ../mods-available/rewrite.load rewrite.load \
&& sed -i "s/Require all denied/Require all granted/" /etc/apache2/apache2.conf \
&& mkdir /data

COPY 000-svn.conf /etc/apache2/sites-enabled/
COPY dot.htaccess /workspace/
COPY usvn.zip /workspace/usvn.zip
COPY run.sh /run.sh

RUN chmod +x /run.sh

VOLUME /data
EXPOSE 80
ENTRYPOINT ["sh", "/run.sh"]

# docker build -t wdj/usvn .
# docker run --restart=always -d -v /workspace/ms/usvn:/data --dns 114.114.114.114 --name usvn -p 38080:80 wdj/usvn

