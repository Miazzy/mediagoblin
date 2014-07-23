#!/bin/bash
export HOME=/var
export TMPDIR=/var/tmp

rm -rf $TMPDIR
mkdir -p $TMPDIR
cp -r /etc/service /tmp
test -d /var/log || cp -r /var_original/log /var
test -d /var/lib || cp -r /var_original/lib /var
test -d /var/run || cp -r /var_original/run /var
test -d /var/lock || ln -s /var/run/lock /var/lock
test -f /var/mediagoblin.db || cp /var_original/mediagoblin.db /var
mkdir -p /var/user_dev

cd /opt/app
./lazyserver.sh --server-name=broadcast 2>&1