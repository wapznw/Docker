FROM maosui/alpine-apache-php:latest

ENV MYSQL_DB_HOST localhost
ENV MYSQL_DB_ROOT root
ENV MYSQL_DB_ROOT_PASS 1234
ENV MYSQL_DB_NAME testlink
ENV MYSQL_DB_USER testlink
ENV MYSQL_DB_PASS testlink123

RUN cd /var/www/localhost/htdocs && rm -rf * \
&& wget -q http://git.oschina.net/wapznw/testlink/raw/master/testlink-1.9.14.tar.gz -O testlink-1.9.14.tar.gz \
&& tar zxvf testlink-1.9.14.tar.gz \
&& mv testlink-1.9.14/* ./ \
&& rm -rf testlink-1.9.14 \
&& rm -rf testlink-1.9.14.tar.gz \
&& mkdir -p /var/testlink/logs \
&& mkdir -p /var/testlink/upload_area \
&& chmod -R 777 /var/www/localhost/htdocs /var/testlink/logs /var/testlink/upload_area \
&& sed -i 's/value="localhost"/value="<?php echo getenv("MYSQL_DB_HOST"); ?>"/' /var/www/localhost/htdocs/install/installDbInput.php \
&& sed -i 's/value="testlink"/value="<?php echo getenv("MYSQL_DB_NAME"); ?>"/' /var/www/localhost/htdocs/install/installDbInput.php \
&& sed -i 's/id="databaseloginname"/id="databaseloginname" value="<?php echo getenv("MYSQL_DB_ROOT"); ?>"/' /var/www/localhost/htdocs/install/installDbInput.php \
&& sed -i 's/id="databaseloginpassword"/id="databaseloginpassword" value="<?php echo getenv("MYSQL_DB_ROOT_PASS"); ?>"/' /var/www/localhost/htdocs/install/installDbInput.php \
&& sed -i 's/id="tl_loginname"/id="tl_loginname" value="<?php echo getenv("MYSQL_DB_USER"); ?>"/' /var/www/localhost/htdocs/install/installDbInput.php \
&& sed -i 's/id="tl_loginpassword"/id="tl_loginpassword" value="<?php echo getenv("MYSQL_DB_PASS"); ?>"/' /var/www/localhost/htdocs/install/installDbInput.php 

# docker build -t maosui/alpine-testlink:latest .
