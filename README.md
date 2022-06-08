# docker-recap

## Task 1
* Stack is running a simple ubuntu docker container.
* Privileges are enabled via `cap_add: all` option (Current example will also work with just `net_admin` capability)
* The stack deploys two ubuntu containers 
    a. One with privileges enabled
    b. Other with no privilege
* The stack is brought up/down using `stack.sh`
* When the stack is brought up, it deploys both containers and runs a small script to create a dummy network link. 
* It would succeed in the privileged container & fail in the normal container, whose logs can be seen by running `./stack.sh logs`


## Task 2
* Stack is running a simple ubuntu docker container (Parent)
* This container is mounted with the docker.sock from the host to enable abilities to run docker inside the container (However, this is not recommeneded in the production or by any security practice)
* This container is also mounted with the sys mount to load the Apparmor module from the host. 
* The profile, startup scripts are copied to the working directory of the parent container via Dockerfile build.
* The stack is brought up/down using `stack.sh`
* When the stack is brought up, it starts parent container and deploys two child containers inside of it. 
* The two child containers are brought up using `docker-compose` via startup script. 
* One child will be loaded with default Apparmor profile and the other one with a custom profile that just denies access to write operation on /tmp. 
* When the child is started, the startup script on the children would attempt to create a file inside /tmp. 
* This file creation would succeed in the normal container, but would fail in the container that has custom profile assigned.
* The logs can be seen using `./stack.sh logs`. 

## Clean up
* Bring down the stack using `./stack.sh down`
* Clean up residual container if any using `for i in $(sudo docker ps -a | grep -v IMAGE| awk '{print $1}') ; do sudo  docker rm $i ; done`
* Remove the images using `for j in {1..2} ; do sudo docker rmi ubuntu-task${j}:latest ; done`
* Remove the host instance from virtual box/cloud.