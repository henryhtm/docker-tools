#!/bin/sh

trap "echo 'stop hbase';/usr/local/hbase/bin/stop-hbase.sh;sleep 5" TERM

read HostName < /etc/hostname
echo "127.0.0.1 $HostName"> /etc/hosts

/usr/local/hbase/bin/start-hbase.sh
sleep 10
hbase-daemon.sh start thrift

while true ; do
sleep 2
done
