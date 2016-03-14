# Das PHP Brewer

This is a factory to build and then tar arbitrary and multiple versions of PHP. The original and intended use case here
was to be able to run multiple versions of PHP side by side and have those versions be both WTF and small. For those reasons this factory spits out compiled versions without their build dependencies or unneeded
artifacts so they can be used elsewhere.

This project is based on the [phpbrew](https://github.com/phpbrew/phpbrew) and some other good work done over [here](https://github.com/GM-Alex/docker-phpapp) by GM-Alex.

## Known Limitations

* This currently only produces Debian compatible versions, however it wouldn't be too hard to adapt this project for other things.
* Wherever you end up using these you should make sure you use [phpbrew](https://github.com/phpbrew/phpbrew)
* You may also have to install some libraries on the target container as well depending on how you brew.

## Our builds

We've built the following versions PHP for you to use

* 5.3.29
* 5.4.40
* 5.5.24

You can grab them and previus builds over in the [releases](https://github.com/kalabox/phpbrewer/releases). We actually are using these as the basis of our [Kalabox](http://github.com/kalabox/kalabox) php-appserver.

*If you want be brew on your own please continue to read!*

## Basic Install & Usage

You will need [docker](http://docker.io).

If you don't want to do any customizations to how your PHP is built you can just do this:

```bash

docker pull kalabox/phpbrewer:stable
docker run --rm -v /path/on/my/host/where/i/want/the/php.tar.gz:/build kalabox/phpbrewer:stable 5.4.36 5.3.29

```

You will need the volume flag otherwise your build will be stuck inside the container. If you are using boot2docker please remember that the "host" in this case is the boot2docker VM which means you will need the first part of the volume to be somewhere in `\Users` on *nix or `\c\users` on DOZE.

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
    gd: stable
    redis: 2.2.5
```

## Other Resources

* [API docs](http://api.kalabox.io/)
* [Test coverage reports](http://coverage.kalabox.io/)
* [Mountain climbing advice](https://www.youtube.com/watch?v=tkBVDh7my9Q)
* [Docker](https://github.com/docker/docker)

-------------------------------------------------------------------------------------
(C) 2016 Kalabox Inc and friends


