#!/bin/sh

trap "echo 'stop hbase';/usr/local/hbase/bin/stop-hbase.sh;sleep 5" TERM

/usr/local/hbase/bin/start-hbase.sh

while true ; do
sleep 2
done
