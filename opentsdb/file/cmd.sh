#!/bin/sh

trap "echo 'stop hbase';/usr/local/hbase/bin/stop-hbase.sh;sleep 2" TERM

/usr/local/hbase/bin/start-hbase.sh
sleep 10

if [ ! -d /etc/opentsdb/data/default/tsdb-uid ] ; then
        echo "No tsdb table, create it."
        env COMPRESSION=none HBASE_HOME=/usr/local/hbase/ /usr/share/opentsdb/tools/create_table.sh
fi

/usr/share/opentsdb/bin/tsdb tsd &

while true ; do
sleep 2
done
