FROM index.alauda.cn/library/ubuntu:14.04

WORKDIR /workspace

VOLUME ["/data/zabbix"]

RUN cd /workspace\
&& mv /etc/apt/sources.list /etc/apt/sources.list.bak\
&& echo "deb http://mirrors.ustc.edu.cn/ubuntu/ trusty main restricted universe multiverse\ndeb http://mirrors.ustc.edu.cn/ubuntu/ trusty-security main restricted universe multiverse\ndeb http://mirrors.ustc.edu.cn/ubuntu/ trusty-updates main restricted universe multiverse\ndeb http://mirrors.ustc.edu.cn/ubuntu/ trusty-proposed main restricted universe multiverse\ndeb http://mirrors.ustc.edu.cn/ubuntu/ trusty-backports main restricted universe multiverse\ndeb-src http://mirrors.ustc.edu.cn/ubuntu/ trusty main restricted universe multiverse\ndeb-src http://mirrors.ustc.edu.cn/ubuntu/ trusty-security main restricted universe multiverse\ndeb-src http://mirrors.ustc.edu.cn/ubuntu/ trusty-updates main restricted universe multiverse\ndeb-src http://mirrors.ustc.edu.cn/ubuntu/ trusty-proposed main restricted universe multiverse\ndeb-src http://mirrors.ustc.edu.cn/ubuntu/ trusty-backports main restricted universe multiverse" > /etc/apt/sources.list

RUN apt-get update && apt-get install -yqq wget\
&& wget http://repo.zabbix.com/zabbix/3.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.0-1+trusty_all.deb \
&& dpkg -i zabbix-release_3.0-1+trusty_all.deb\
&& apt-get update 

RUN export DEBIAN_FRONTEND=noninteractive \
&& apt-get install -yqq pwgen zabbix-server-mysql zabbix-frontend-php \
&& apt-get clean

COPY run.sh /run_zabbix.sh
RUN chmod +x /run_zabbix.sh

EXPOSE 80
EXPOSE 10050
EXPOSE 10051

CMD ["/run_zabbix.sh"]

# docker run -it --name zabbix-server -v /data/zabbix:/data/zabbix -p 18888:80 -p 10050:10050 -p 10051:10051 zabbix:3.0
# docker run -d --name zabbix-server -v /data/zabbix:/data/zabbix -p 18888:80 -p 10050:10050 -p 10051:10051 zabbix:3.0
