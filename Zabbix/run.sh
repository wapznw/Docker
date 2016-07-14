#!/bin/bash

function zabbix_init(){

ZABBIX_PWD=$(pwgen -1)
echo -e "create database zabbix character set utf8 collate utf8_bin;\n\
grant all privileges on zabbix.* to zabbix@localhost identified by '${ZABBIX_PWD}'; \
" > /workspace/create_zabbix.sql \
&& cat /workspace/create_zabbix.sql | mysql -uroot \
&& zcat /usr/share/doc/zabbix-server-mysql/create.sql.gz | mysql -uroot zabbix \
&& sed -i "s/DBPassword=/\nDBPassword=${ZABBIX_PWD}/" /etc/zabbix/zabbix_server.conf \
&& sed -i "s/# php_value date.timezone Europe\/Riga/php_value date.timezone Asia\/Shanghai/" /etc/apache2/conf-enabled/zabbix.conf

MYSQL_ROOT_PWD=$(pwgen -1)
mysqladmin -uroot password '${MYSQL_ROOT_PWD}'

echo "" > .zabbix_init
echo -e "mysql root password: ${MYSQL_ROOT_PWD}\nzabbix db password: ${ZABBIX_PWD}\n";

}

if [ ! -d "/data/zabbix/datadir" ];then
mkdir -p /data/zabbix/datadir \
&& cp -r /var/lib/mysql/* /data/zabbix/datadir/ \
&& chown -R mysql:mysql /data/zabbix/datadir \
&& sed -i "s/\/var\/lib\/mysql/\/data\/zabbix\/datadir/" /etc/mysql/my.cnf
fi

service mysql start

if [ ! -f ".zabbix_init" ]; then
    zabbix_init;
fi

locale-gen zh_CN.UTF-8
sed -i "s/graphfont/FZFSJ/" include/defines.inc.php

service zabbix-server start
service apache2 start

while (true)
do
sleep 1
done
