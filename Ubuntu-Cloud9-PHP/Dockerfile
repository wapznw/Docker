# wdj/cloud9
# docker build -t wdj/cloud9 .

FROM index.alauda.cn/wapznw/cloud9v3-docker:latest

MAINTAINER wdj wapznw@gmail.com

# 设置时区
ENV TZ "PRC"
RUN echo "Asia/Shanghai" | tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

# 安装 php 环境
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
&& curl -o /etc/apt/sources.list http://mirrors.163.com/.help/sources.list.jessie \
&& apt-get update && apt-get install -y php5 php5-cli php5-fpm php5-xdebug php5-mysql php5-mcrypt php5-gd php5-curl nginx \
&& echo "extension=mcrypt.so" > /etc/php5/cli/conf.d/20-mcrypt.ini \
&& echo "extension=mcrypt.so" > /etc/php5/fpm/conf.d/20-mcrypt.ini \
&& echo "\nenv[SERVER_ADMIN]=you@example.com" >> /etc/php5/fpm/pool.d/www.conf \
&& sed -i "30s/root \/var\/www\/html/root \/workspace;\n\tinclude \/workspace\/*_nginx.conf/g" /etc/nginx/sites-enabled/default \
&& sed -i 's/location \/ {/location ~ \\.conf$ {/g' /etc/nginx/sites-enabled/default \
&& sed -i '34s/index.html index.htm/index.html index.htm index.php/g' /etc/nginx/sites-enabled/default \
&& sed -i '46,47s/#//g' /etc/nginx/sites-enabled/default \
&& sed -i '52,53s/#//g' /etc/nginx/sites-enabled/default \
&& sed -i '58,60s/#//g' /etc/nginx/sites-enabled/default \
&& sed -i 's/listen 80 default_server/listen 8080 default_server/g' /etc/nginx/sites-enabled/default \
&& sed -i 's/listen \[::\]:80 default_server/listen \[::\]:8080 default_server/g' /etc/nginx/sites-enabled/default \
&& apt-get autoremove -y && apt-get autoclean -y && apt-get clean -y \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
&& npm cache clean \
&& echo '#!/bin/bash' > /run.sh && echo "\nservice php5-fpm start\nservice nginx start\nforever /cloud9/server.js -w /workspace -l 0.0.0.0 \$@" >> /run.sh && chmod +x /run.sh


ENTRYPOINT ["/run.sh"]

# docker run -d -v $(pwd):/workspace -p 7777:8181 -p 7778:8080 wdj/cloud9 --auth wdj:1234 
