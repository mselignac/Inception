FROM alpine:3.15.5
RUN apk -U upgrade
RUN adduser -u 1000 -D -S -G www-data www-data
RUN apk add --no-cache nginx && apk add --no-cache vim && apk add --no-cache curl && apk add --no-cache bash
RUN mkdir -p /etc/nginx/ssl
RUN apk add --no-cache openssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/nginx_inc.crt \
    -keyout /etc/nginx/ssl/nginx_inc.key \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42paris/CN=mseligna.42.fr/UID=mseligna"
RUN mkdir -p /var/run/nginx && mkdir -p /var/www/html
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN rm /etc/nginx/http.d/default.conf
RUN chmod -R 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
CMD ["nginx", "-g", "daemon off;"]