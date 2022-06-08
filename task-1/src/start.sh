#!/bin/bash

echo "Checking privileges for network: Executing command - ip link add dummy0 type dummy"
echo
echo
/usr/sbin/ip link add dummy0 type dummy
if [ $? -eq 0 ]; then
	echo "Successful"
else
	echo "Failure"
fi
echo
echo
/usr/sbin/ip link show
echo
echo
echo
echo "Sleeping, Bye!"
sleep 40000