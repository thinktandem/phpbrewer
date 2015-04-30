#!/bin/bash

# Build requested versions from source
echo "Building PHP versions $@..."
for i in "$@"
do
  /usr/bin/install_php $i
done

# Tar our versions
tar -czvf /build/php.tar.gz -C /root/.phpbrew .
