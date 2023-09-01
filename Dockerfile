# Use an official PHP image as a parent image
FROM php:8.1-cli

# Install necessary PHP extensions and libraries
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
  && docker-php-ext-install zip

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set the working directory in the container
WORKDIR /app

# Copy the entire application to the container
COPY . .

# Install dependencies using Composer
RUN composer install

# Command to run the application
CMD ["php", "index.php"]
