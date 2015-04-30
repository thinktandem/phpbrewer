# Das PHP Brewer

This is a factory to build and then tar arbitrary and multiple versions of PHP. The original and intended usecase here
was to be able to run multiple versions of PHP side by side and have those versions be WTF and also for these versions to occupy
the minimal amount of space. For that reason this factory spits out compiled versions without their build dependencies or unneeded
artifacts so they can be used else where.

This project is based on the [phpbrew](https://github.com/phpbrew/phpbrew) project and some work done over here by [GM-Alex](https://github.com/GM-Alex/docker-phpapp)

## Basic Install & Usage

You will need docker.

If you don't want to do any customizations to how your PHP is built you can just do this

```bash

docker pull kalabox/phpbrewer:stable
docker run --rm -v /path/on/my/host/where/i/want/the/php.tar.gz:/build kalabox/phpbrewer:stable 5.4.36 5.3.29

```

You will need the volume otherwise your build will be stuck inside the container. If you are using boot2docker please remember that the "host"
in this case is the boot2docker VM which means you will need the first part of the volume to be somewhere in `\Users` on *nix or `\c\users` on DOZE.

The docker run command can take any number of php versions as arguments.

## Custom Install and Usage

If you want customize your php build you will want to do something more like this.

```bash

git clone https://github.com/kalabox/phpbrewer.git
cd phpbrewer
nano/vi/edit conf/pbconfig.yaml
docker build -t sometag .
docker run --rm -v /path/to/my/appserver/dockerfile:/build sometag 5.6.4

```

The default config is this:

```yaml
variants:
  brewme:
    intl:
    cgi:
    bcmath:
    bz2:
    calendar:
    cli:
    ctype:
    dba:
    dom:
    exif:
    fileinfo:
    filter:
    ftp:
    gettext:
    iconv:
    intl:
    ipc:
    json:
    mbregex:
    mbstring:
    mhash:
    mcrypt:
    openssl:
    opcache:
    pcntl:
    pcre:
    pdo:
    phar:
    posix:
    readline:
    sockets:
    tokenizer:
    xml:
    curl:
    zip:
    iconv:
    fpm:
    soap:
extensions:
  brewme:
    apc: 3.1.13
    gd: stable
    xdebug: 2.2.1
    redis: 2.2.5
```

## Other Resources

* [API docs](http://api.kalabox.me/)
* [Test coverage reports](http://coverage.kalabox.me/)
* [Kalabox CI dash](http://ci.kalabox.me/)
* [Mountain climbing advice](https://www.youtube.com/watch?v=tkBVDh7my9Q)
* [Boot2Docker](https://github.com/boot2docker/boot2docker)
* [Syncthing](https://github.com/syncthing/syncthing)
* [Docker](https://github.com/docker/docker)

-------------------------------------------------------------------------------------
(C) 2015 Kalamuna and friends


