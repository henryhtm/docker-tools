#!/bin/sh
trap "echo 'stopped by TERM';/etc/init.d/mysql stop;echo 'Done.';exit 0;" TERM

/etc/init.d/mysql start ;
while true ;
do
sleep 2 ;
done 


