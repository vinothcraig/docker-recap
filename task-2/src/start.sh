#!/bin/bash

echo "Checking write access on /tmp"
echo
echo
touch /tmp/file
if [ $? -eq 0 ]; then
	echo "Successful"
else
	echo "Failure"
fi
echo
echo
docker swarm init
sleep 3
echo "Starting child containers via swarm.."
echo 
echo 
./stack.sh up
echo
echo "Sleeping, Bye!"
sleep 40000