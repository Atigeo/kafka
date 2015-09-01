xPatterns Kafka Docker
=============

Summary
-------
Start up a Kafka server in a docker container. You may either launch kafka on it's own and point to your own zookeeper, or use the docker-compose.yml to launch both zookeeper and kafka.
http://kafka.apache.org/

Dependencies
-------
The kafka docker requires a running zookeeper instance. You can point to zookeeper using -e ZOOKEEPERHOSTS=<your_zookeeper> when launching the docker or use the docker-compose.yml.
$`wget https://github.com/Atigeo/kafka/raw/master/docker-compose.yml`

Installation 
-------
$`docker pull xpatterns/kafka`

Running
-------
$`docker run -d -p 9092:9092 -e ZOOKEEPERHOSTS=<your_zookeeper> xpatterns/kafka`

or from the directory where you downloaded the docker-compose.yml run
$`docker-compose up`

Testing
-------
telnet localhost 9092

Example
-------


Notes
-------
