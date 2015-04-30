# PHPBREWER

This thing builds PHP versions from source so you can use them elsewhere

## Install

`docker pull kalabox/phpbrewer:stable`

or

`docker build -t myrepo/phpbrewer:stable .`

## Usage

`docker run --rm -v /path/to/my/appserver/dockerfile:/build kalabox/phpbrewer:stable <PHP VERSION1> <PHPVERSION2>`

## Examples

```
docker run --rm -v /Users/mpirog/Dockerfiles/php-appserver:/build kalabox/phpbrewer:stable 5.3.29 5.4.36
docker run --rm -v /Holla:/build kalabox/phpbrewer:stable 5.5.4
```

## Customize your build

Edit the `conf/pbconfig.yaml` file and then build the dockerfile instead of pulling it.

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


