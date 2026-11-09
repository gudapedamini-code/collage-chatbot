FROM php:8.2-apache

# Enable Apache mod_rewrite and mod_headers
RUN a2enmod rewrite headers

# Install mysqli extension for MySQL database support
RUN docker-php-ext-install mysqli

# Set working directory
WORKDIR /var/www/html

# Copy project files into Apache web root
COPY . /var/www/html/

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html

# Expose default HTTP port
EXPOSE 80

CMD ["apache2-foreground"]
