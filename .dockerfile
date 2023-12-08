FROM php:8.2-apache


RUN apt-get update && apt-get install -y \
		libfreetype-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
	&& docker-php-ext-install pdo pdo_mysql

RUN a2enmod rewrite