#!/bin/sh
apk add --no-cache \
    openssl openssl-dev make lua5.3 lua-dev lua5.1-socket pcre pcre-dev alpine-sdk

#VERSION=master
#TAG=master
VERSION=2.5.2
TAG=v$VERSION

wget https://github.com/lefcha/imapfilter/archive/$TAG.zip
unzip $TAG.zip
cd imapfilter-$VERSION

make all
make install

apk del alpine-sdk

cd ..
rm -r imapfilter-$VERSION
rm $TAG.zip

adduser -h /home/imapfilter -D -s /sbin/nologin -G nobody imapfilter
mkdir /home/imapfilter/.imapfilter && chown imapfilter:nobody /home/imapfilter/.imapfilter
