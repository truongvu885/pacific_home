# Dockerfile
# Base official EspoCRM image version cố định
FROM espocrm/espocrm:9.2.5

# RUN pecl install xdebug && docker-php-ext-enable xdebug

# Sao chép cấu hình Xdebug vào thư mục conf.d
# COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

# COPY entrypoint.sh /usr/local/bin/entrypoint.sh
# RUN chmod +x /usr/local/bin/entrypoint.sh

# Set quyền file chuẩn cho Apache / PHP
# RUN chown -R www-data:www-data /var/www/html \
#     && chmod -R 755 /var/www/html

EXPOSE 80

# ENV cho production (tùy chỉnh nếu cần)
# ENV ESPOCRM_ENV=production
# ENV PHP_MEMORY_LIMIT=512M

# ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# CMD chuẩn official image (start Apache)
CMD ["apache2-foreground"]
