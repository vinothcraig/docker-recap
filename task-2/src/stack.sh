#!/bin/bash
cmd=$1
if [ $cmd == "up" ]; then
	app
	docker build -t ubuntu-task2:latest .
	sleep 2
	docker stack deploy --compose-file ./parent-docker-compose.yaml task2
elif [ $cmd == "down" ]; then
	docker stack rm task2
elif [ $cmd == "logs" ]; then
	services=$(docker service ls | awk '{print $2}' | grep -v NAME | xargs)
	for s in $services
		do 
		echo 
		echo "Printing Logs for [ $s ]..."
		echo 
		echo
		docker service logs $s 
		echo 
		echo -------------------------
		echo
		done
elif [ $cmd == "status" ]; then
	echo
	docker service ls
	echo
else 
	echo "Allowed switches are [up/down/status/logs]"
	exit 1
fi 
