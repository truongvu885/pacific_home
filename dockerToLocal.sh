#!/bin/sh
echo "copy source from container to local to push to git"
docker exec pacific-home-db /usr/bin/mysqldump -u root -p12345678 espocrm > init.sql
rm -rf ./html/
mkdir html
mkdir ./html/client
docker cp pacific-home:/var/www/html/client/custom ./html/client
docker cp pacific-home:/var/www/html/custom ./html/
docker cp pacific-home:/var/www/html/data ./html/
docker cp pacific-home:/var/www/html/public/index.php ./html/