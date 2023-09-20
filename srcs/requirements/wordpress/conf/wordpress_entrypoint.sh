#!/bin/sh
sleep 15

echo "HERE 1"

mkdir -p /run/php
wp core download --allow-root

echo "HERE 2"

wp config create --allow-root \
  --dbhost=$WORDPRESS_DB_HOST \
  --dbname=$WORDPRESS_DB_NAME \
  --dbuser=$MYSQL_USER \
  --dbpass=$MYSQL_PASSWORD

echo "HERE 3"

wp core install  --allow-root \
  --path="/var/www/wordpress" \
  --url=$DOMAIN_NAME \
  --title=$WORDPRESS_TITLE \
  --admin_user=$WORDPRESS_ADMIN \
  --admin_password=$WORDPRESS_ADMIN_PASSWORD \
  --admin_email=$WORDPRESS_ADMIN_EMAIL \
  --skip-email

echo "HERE 4"
wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL \
  --role=author --user_pass=$WORDPRESS_USER_PASSWORD --allow-root
wp plugin update --all --allow-root


echo "HERE 5"

/usr/sbin/php-fpm7 -F -R