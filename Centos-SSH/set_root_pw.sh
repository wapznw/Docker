#!/bin/bash

if [ -f /.root_pw_set ]; then

	echo "Root password already set!"
	exit 0
fi

# dpkg-reconfigure -f noninteractive openssh-server

PASS=${ROOT_PASS:-$(pwgen -s 6 1)}
_word=$( [ ${ROOT_PASS} ] && echo "preset" || echo "random" )
echo "=> Setting a ${_word} password to the root user"
echo "root:$PASS" | chpasswd

echo "=> Done!"
touch /.root_pw_set

echo "========================================================================"
echo "You can now connect to this Debian container via SSH using:"
echo ""
echo "ssh root@"`hostname -i`
echo ""
echo "and enter the root password '$PASS' when prompted"
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"
