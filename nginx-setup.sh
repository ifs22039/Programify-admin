#!/bin/sh

# Install Nginx
apk add --no-cache nginx

# Hapus konfigurasi default
rm /etc/nginx/http.d/default.conf

# Salin konfigurasi Nginx kita
cp /var/www/html/nginx.conf /etc/nginx/http.d/default.conf

# Jalankan PHP-FPM di background
php-fpm &

# Jalankan Nginx di foreground
nginx -g 'daemon off;'