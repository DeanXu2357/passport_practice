FROM ubuntu

MAINTAINER DeanXu

# install nginx
RUN apt-get update &&\
    apt-get install -y nginx &&\
    apt-get install -y software-properties-common

RUN apt-get install -y language-pack-en-base
RUN LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y nginx php7.1 php7.1-fpm php7.1-cli php7.1-common php7.1-json php7.1-opcache php7.1-mysql php7.1-phpdbg php7.1-mbstring php7.1-gd php7.1-imap php7.1-ldap php7.1-pgsql php7.1-pspell php7.1-recode php7.1-soap php7.1-tidy php7.1-dev php7.1-intl php7.1-curl php7.1-zip php7.1-xml php-xdebug

COPY config/php/php.ini /etc/php/7.1/fpm/
COPY config/nginx/default /etc/nginx/sites-available/
RUN rm -f /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
    chown -R www-data:www-data /var/lib/nginx

ADD app /var/www/html/

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

EXPOSE 80
EXPOSE 9000

CMD ["nginx"]
