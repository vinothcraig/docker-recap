#!/bin/bash

sleep 3
echo "Starting child containers.."
echo
echo
docker-compose up
echo
echo
echo "Parent is sleeping, Bye!"
sleep 40000