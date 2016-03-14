# docker build -t kalabox/phpbrewer .

FROM debian:jessie

# Upgrade system
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

# Get core deps
RUN echo "deb-src http://ftp.debian.org/debian jessie main contrib non-free" >> /etc/apt/sources.list
RUN apt-get update -y --fix-missing
RUN apt-get install -y build-essential checkinstall curl zip apt-utils
RUN apt-get build-dep -y php5

# Get PHP things
RUN apt-get install -y php5 php5-dev php5-cli \
  autoconf automake curl build-essential libxslt1-dev re2c libxml2 \
  libmagickwand-dev libmagickcore-dev \
  libxml2-dev bison libbz2-dev libreadline-dev libfreetype6 libfreetype6-dev libpng12-0 \
  libpng12-dev libjpeg-dev libjpeg62-turbo \
  libjpeg62-turbo-dev libgd2-xpm-dev libxpm4 libltdl7 libltdl-dev \
  libssl-dev openssl \
  gettext libgettextpo-dev libgettextpo0 \
  mysql-server mysql-client libmysqlclient-dev libmysqld-dev \
  postgresql postgresql-client postgresql-contrib \
  libicu-dev libmhash-dev libmhash2 libmcrypt-dev libmcrypt4 libgmp10 libpcre3-dev \
  php5-fpm php5-gd php5-ldap php5-mcrypt php5-curl php5-mysqlnd php5-gmp php-pear php5-xdebug php-apc \
  redis-server && \
  pecl install redis

# Add files
COPY build.sh /usr/bin/build
COPY conf/pbconfig.yaml /root/config.yaml
COPY install_php /usr/bin/install_php

# Setup
RUN cd /tmp && \
  curl -fsSL -o /usr/local/bin/phpbrew https://github.com/phpbrew/phpbrew/raw/1.18.5/phpbrew && \
  chmod +x /usr/local/bin/phpbrew && \
  phpbrew init --config=/root/config.yaml && \
  echo "source /root/.phpbrew/bashrc" >> /root/.bashrc && \
  ln -s /.phpbrew /root/.phpbrew

ENTRYPOINT ["/usr/bin/build"]
