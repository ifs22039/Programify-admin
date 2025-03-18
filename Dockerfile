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
    icu-dev # Required for intl extension

# Install PHP extensions
RUN docker-php-ext-install \
    pdo_mysql \
    exif \
    pcntl \
    bcmath \
    gd \
    zip \
    intl # Added intl extension for Filament

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

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]