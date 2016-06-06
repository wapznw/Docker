FROM maosui/alpine-php-fpm:latest

RUN apk add --no-cache apache2 php-apache2 apache2-ldap apache2-icons apache2-error apache2-utils \
&& echo "ServerName 0.0.0.0:80" >> /etc/apache2/httpd.conf \
&& mkdir -p /run/apache2 \
&& echo -e "<?php\nphpinfo();" > /var/www/localhost/htdocs/index.php \
&& rm -rf /var/www/localhost/htdocs/index.html

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]

# docker build -t maosui/alpine-apache-php:latest .
# apache2=2.4.17-r4 apache2-utils=2.4.17-r4
