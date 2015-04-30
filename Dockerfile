# docker build -t kalabox/phpbrewer .

FROM kalabox/debian:stable

# Upgrade system
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

# Get deps
# Still not sure if we need this: libgd3 libicu-dev?
RUN \
  echo "deb-src http://ftp.debian.org/debian wheezy main contrib non-free" >> /etc/apt/sources.list && \
  apt-get update -y --fix-missing && \
  apt-get install -y build-essential checkinstall zip apt-utils && \
  apt-get build-dep -y php5 && \
  apt-get install -y php5 php5-dev php-pear autoconf automake curl build-essential libxslt1-dev re2c libxml2 && \
  apt-get install -y libxml2-dev php5-cli bison libbz2-dev libreadline-dev libfreetype6 libfreetype6-dev libpng12-0 && \
  apt-get install -y libpng12-dev  libjpeg-dev libjpeg8-dev libjpeg8 libgd2-xpm-dev libxpm4 libltdl7 libltdl-dev && \
  apt-get install -y libssl-dev openssl && \
  apt-get install -y gettext libgettextpo-dev libgettextpo0 && \
  apt-get install -y libicu-dev && \
  apt-get install -y libmhash-dev libmhash2 && \
  apt-get install -y libmcrypt-dev libmcrypt4 && \
  apt-get install -y mysql-server mysql-client libmysqlclient-dev libmysqld-dev && \
  apt-get install -y postgresql postgresql-client postgresql-contrib && \
  apt-get install -y php5-fpm php5 php5-dev php5-gd php5-cli php5-ldap php5-mcrypt php5-curl php5-mysqlnd php5-gmp && \
  apt-get install -y redis-server libgmp10 && \
  pecl install redis && \
  apt-get clean -y && \
  apt-get autoclean -y && \
  apt-get autoremove -y && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN \
  apt-get install -y php5-xdebug php-apc

# Add files
COPY build.sh /usr/bin/build
COPY conf/pbconfig.yaml /root/config.yaml
COPY install_php /usr/bin/install_php

# Setup
RUN \
  cd /tmp && \
  curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew && \
  chmod +x /tmp/phpbrew && \
  mv /tmp/phpbrew /usr/bin/phpbrew && \
  chmod +x /usr/bin/install_php && \
  chmod +x /usr/bin/build && \
  phpbrew init --config=/root/config.yaml && \
  echo "source /root/.phpbrew/bashrc" >> /root/.bashrc && \
  ln -s /.phpbrew /root/.phpbrew && \
  mkdir /build

ENTRYPOINT ["/usr/bin/build"]
