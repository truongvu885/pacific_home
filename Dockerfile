# Dockerfile
# Base official EspoCRM image version cố định
FROM espocrm/espocrm:9.2.5

#USER root
#RUN pecl install xdebug && docker-php-ext-enable xdebug

# COPY ./pacific_home/ /var/www/html/

# COPY entrypoint.sh /usr/local/bin/entrypoint.sh
# RUN chmod +x /usr/local/bin/entrypoint.sh

# Set quyền file chuẩn cho Apache / PHP
# RUN chown -R www-data:www-data /var/www/html \
#     && chmod -R 755 /var/www/html

# Expose port web
EXPOSE 80

# ENV cho production (tùy chỉnh nếu cần)
# ENV ESPOCRM_ENV=production
# ENV PHP_MEMORY_LIMIT=512M

# ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# CMD chuẩn official image (start Apache)
CMD ["apache2-foreground"]
