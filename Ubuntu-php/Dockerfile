# nginx+php 环境

FROM index.alauda.cn/library/ubuntu:14.04

MAINTAINER wdj wapznw@gmail.com

ENV TZ "PRC"
RUN echo "Asia/Shanghai" | tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

RUN echo '#!/usr/bin/python3' > download_sources.py && echo "\nimport os,urllib.request,re\n\nurl = 'http://mirrors.163.com/.help/sources.list.trusty'\nfilename = '/etc/apt/sources.list'\ndata = urllib.request.urlopen(url).read()\nwith open(filename, 'wb') as f:\n    f.write(data)" >> download_sources.py \
&& chmod +x download_sources.py && ./download_sources.py && apt-get update \
&& apt-get install -y php5 php5-cli php5-fpm php5-mysql php5-mcrypt php5-gd php5-curl nginx \
&& echo "extension=mcrypt.so" > /etc/php5/cli/conf.d/20-mcrypt.ini \
&& echo "extension=mcrypt.so" > /etc/php5/fpm/conf.d/20-mcrypt.ini \
&& echo "\nenv[SERVER_ADMIN]=you@example.com" >> /etc/php5/fpm/pool.d/www.conf \
&& sed -i "s/index index.html index.htm/index index.html index.htm index.php/g" /etc/nginx/sites-enabled/default \
&& sed -i 's/location \/ {/location ~ \\.conf$ {/g' /etc/nginx/sites-enabled/default \
&& sed -i '28s/server_name localhost/server_name localhost;\n\tinclude \/usr\/share\/nginx\/html\/*_nginx.conf/g' /etc/nginx/sites-enabled/default \
&& sed -i '55s/#//g' /etc/nginx/sites-enabled/default \
&& sed -i '62s/#//g' /etc/nginx/sites-enabled/default \
&& sed -i '64,65s/#//g' /etc/nginx/sites-enabled/default \
&& rm -rf /usr/share/nginx/html/index.html && echo "<?php\nphpinfo();\n" > /usr/share/nginx/html/index.php \
&& echo '#!/bin/bash' > /run.sh && echo "\nservice php5-fpm start\nservice nginx start\nwhile true; do service nginx reload; sleep 1; done\n" > /run.sh && chmod +x /run.sh

VOLUME /usr/share/nginx/html
EXPOSE 80
ENTRYPOINT ["sh", "/run.sh"]

# docker run -d -t -i -v $(pwd):/usr/share/nginx/html -p 8989:80 wdj/php

