FROM alpine:latest

RUN echo -e "http://mirrors.ustc.edu.cn/alpine/v3.3/main/\nhttp://dl-cdn.alpinelinux.org/alpine/v3.3/community" > /etc/apk/repositories \
&& apk update \
&& apk add php php-fpm php-pdo php-pdo_mysql php-iconv php-pdo_sqlite php-bz2 php-xmlrpc php-mcrypt php-memcache php-gd php-xml php-xcache php-xml php-mysql php-sqlite3 php-cli php-zip php-dom php-curl php-mysqli \
&& sed -i "s/127.0.0.1:9000/0.0.0.0:9000/" /etc/php/php-fpm.conf \
&& echo "max_execution_time=3000" >> /etc/php/php.ini \
&& rm -rf /var/cache/apk/*

EXPOSE 9000

CMD ["php-fpm", "-F"]

# docker run -it --rm -p 19000:9000 maosui/alpine-php-fpm 
# docker run -it --rm -p 19000:9000 -p 18080:80 maosui/alpine-php-fpm sh
