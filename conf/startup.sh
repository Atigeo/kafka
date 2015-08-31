#!/bin/bash
# This is the base process of the container.

sudo service zookeeper-server start

# Infinite loop
while true; do 
	sleep 10
done
