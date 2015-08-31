xPatterns Kafka Docker
=============

Summary
-------
Start up a Kafka server in a docker container.
http://kafka.apache.org/

Dependencies
-------
The kafka docker requires a running zookeeper instance. You can point to zookeeper using -e ZOOKEEPERHOSTS=<your_zookeeper> when launching the docker.

Installation 
-------
$`docker pull xpatterns/kafka`

Running
-------
$`docker run -d -p 9092:9092 -e ZOOKEEPERHOSTS=<your_zookeeper> xpatterns/kafka`

Testing
-------
telnet localhost 9092

Example
-------
How to use your project.

Notes
-------
You can learn more about git markup here. (https://github.com/github/markup/blob/master/README.md)
