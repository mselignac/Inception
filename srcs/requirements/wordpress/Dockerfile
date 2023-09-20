FROM alpine:3.15.5
RUN apk -U upgrade
RUN apk add --no-cache bash wget curl openrc
RUN apk add --no-cache mariadb-client

RUN mkdir -p /var/www/wordpress
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www/wordpress
RUN cd /var/www/wordpress && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN chmod 777 -R /var/www/wordpress
RUN	chown -R root:root /var/www/wordpress

RUN apk add --no-cache php7 \
    --no-cache php7-fpm \
    --no-cache php7-curl \
    --no-cache php7-dom \
    --no-cache php7-mysqli \
    --no-cache php7-sodium \
    --no-cache php7-openssl \
    --no-cache php7-xml \
    --no-cache php7-zip \
    --no-cache php7-exif \
    --no-cache php7-fileinfo \
    --no-cache php7-json \
    --no-cache php7-mbstring \
    php7-phar lighttpd php7-common php7-session php7-iconv php7-gd \
    php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc \
    php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-simplexml

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php7/php-fpm.d/www.conf
WORKDIR /var/www/wordpress
COPY conf/wordpress_entrypoint.sh /tmp/wordpress_entrypoint.sh
RUN chmod +x /tmp/wordpress_entrypoint.sh

ENTRYPOINT ["sh", "/tmp/wordpress_entrypoint.sh"]
