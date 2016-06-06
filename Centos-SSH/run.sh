#!/bin/bash

if [ ! -f /.root_pw_set ]; then
	/set_root_pw.sh
fi

service sshd start

while :
do
 sleep 100
done
 