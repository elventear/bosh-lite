#!/bin/sh

AFCONF=/etc/AppFirst
TENANT=$1
URLFRONT=$2

test -z $TENANT && exit 1
test -z $URLFRONT || URLFRONT=frontend.appfirst.com

echo "
<configuration>
   URLfront $URLFRONT 
   Tenant $TENANT
</configuration>
" > $AFCONF
/etc/init.d/afcollector restart
