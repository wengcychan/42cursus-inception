FROM debian:bullseye

RUN apt-get update \
	&& apt-get install -y php-fpm php-mysql mariadb-client curl \
	&& rm -rf /var/lib/apt/lists/* 

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php

COPY ./tools/script.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/script.sh

CMD ["/usr/local/bin/script.sh"]