#!/bin/bash

echo
echo
echo "Printing start logs.."
echo "Attemping to create a file in /tmp"
touch /tmp/sample
if [ $? -eq 0 ]; then
    echo "Successful"
else
    echo "Failed"
fi
echo
echo
echo "Exiting, Bye!"
echo
echo --------------------------------------------