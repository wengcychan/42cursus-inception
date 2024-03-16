FROM debian:bullseye

RUN apt-get update \
	&& apt-get install -y nginx openssl \
	&& rm -rf /var/lib/apt/lists/* 

RUN mkdir /etc/nginx/ssl

RUN openssl req -x509 -newkey rsa:2048 -nodes -days 365 \
	-out /etc/nginx/ssl/wchan_42_fr.csr \
	-keyout /etc/nginx/ssl/wchan_42_fr.key \
	-subj "/C=FI/ST=Helsinki/L=Helsinki/O=42/OU=wchan/CN=wchan.42.fr"

COPY ./conf/nginx.conf /etc/nginx/conf.d

CMD ["nginx", "-g", "daemon off;"]