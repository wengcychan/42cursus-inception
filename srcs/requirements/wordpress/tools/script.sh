#!/bin/sh

while ! mysql -h mariadb -u ${MYSQL_USER} -p${MYSQL_PASSWORD} -e ";" 2>/dev/null; do
    echo "Waiting for MariaDB to be accessible..."
    sleep 5
done

if [ ! -f /var/www/html/wp-config.php ]; then

	mkdir -p var/www/html

	cd /var/www/html;

	wp core download --allow-root

	mv ./wp-config-sample.php ./wp-config.php

	sed -i "s/'database_name_here'/'${MYSQL_DATABASE}'/g" wp-config.php
	sed -i "s/'username_here'/'${MYSQL_USER}'/g" wp-config.php
	sed -i "s/'password_here'/'${MYSQL_PASSWORD}'/g" wp-config.php
	sed -i "s/'localhost'/'${MYSQL_LOCALHOST}'/g" wp-config.php

	wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

	wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root

	wp theme install twentytwentytwo --activate --allow-root

fi

php-fpm7.4 -F
