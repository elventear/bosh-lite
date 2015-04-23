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

  CollectPeriod 20
  Profile 0
  Enabled True
  Include
  DataDir /opt/AppFirst/data
  Exclude
  DiskSpace 512
  MaxPaths 1024
</configuration>
" > $AFCONF

update-rc.d afcollector enable

/etc/init.d/afcollector restart

