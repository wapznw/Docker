#!/bin/sh
sed -i "s/svn\.vc\.maosui\.com/$SVN_DOMAIN/" /etc/apache2/sites-enabled/000-svn.conf
if [ ! -d "/data/usvn" ];then
    cd /data/ && cp /workspace/usvn.zip ./
    unzip usvn.zip >> /dev/null
    mv usvn-1.0.7/ usvn && rm -rf usvn.zip
    mkdir usvn/files
    chmod -R 777 usvn/config usvn/public usvn/files
fi

if [ ! -f "/data/usvn/public/.htaccess" ];then
    cp /workspace/dot.htaccess /data/usvn/public/.htaccess
    chmod 777 /data/usvn/public/.htaccess
fi

if [ ! -d "/data/usvn/files" ];then
    mkdir /data/usvn/files
    chmod 777 /data/usvn/files
fi

chown -R www-data:www-data /data/usvn/files

/usr/sbin/apache2ctl start

while true
do
    sleep 10
done

