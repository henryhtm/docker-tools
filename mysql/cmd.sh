#!/bin/sh
trap "echo 'stopped by TERM';/etc/init.d/mysql stop;echo 'Done.';exit 0;" TERM
trap "echo 'stopped by KILL'>>/mnt/tmp.txt;/etc/init.d/mysql stop;sleep 5" KILL

/etc/init.d/mysql start ;
while true ;
do
sleep 2 ;
done 


