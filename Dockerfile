# Use PHP 8.3 with FPM on Alpine Linux
FROM php:8.3-fpm-alpine

# Install system dependencies
RUN apk add --no-cache \
    git \
    curl \
    libpng-dev \
    libxml2-dev \
    libzip-dev \
    zip \
    unzip \
    icu-dev \
    nginx # Tambahkan Nginx

# Install PHP extensions
RUN docker-php-ext-install \
    pdo_mysql \
    exif \
    pcntl \
    bcmath \
    gd \
    zip \
    intl

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Add git safe directory configuration
RUN git config --global --add safe.directory /var/www/html

# Copy application files
COPY . .

# Set correct permissions before composer install
RUN chown -R www-data:www-data /var/www/html

# Install Composer dependencies with ignore platform reqs for intl
RUN composer install \
    --no-scripts \
    --no-autoloader \
    --optimize-autoloader \
    --ignore-platform-req=ext-intl

# Generate Composer autoloader
RUN composer dump-autoload

# Generate application key
RUN php artisan key:generate

# Create storage link
RUN php artisan storage:link

# Set final permissions
RUN chown -R www-data:www-data \
    /var/www/html/storage \
    /var/www/html/bootstrap/cache \
    /var/www/html/public/storage

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Modify PHP-FPM configuration to use different port
RUN sed -i 's/listen = 9000/listen = 9001/g' /usr/local/etc/php-fpm.d/zz-docker.conf

# Expose ports
EXPOSE 9000

# Start PHP-FPM and Nginx
CMD ["/bin/sh", "-c", "php-fpm & nginx -g 'daemon off;'"]