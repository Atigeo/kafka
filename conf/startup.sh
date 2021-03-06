#!/bin/bash
# This is the base process of the container.

# Build consumer.properties
rm -Rf /usr/local/$KAFKA_VERSION/config/consumer.properties
echo "zookeeper.connect=${ZOOKEEPERHOSTS}:${ZOOKEEPER_PORT}" >> /usr/local/$KAFKA_VERSION/config/consumer.properties
echo "zookeeper.connection.timeout.ms=6000" >> /usr/local/$KAFKA_VERSION/config/consumer.properties
echo "group.id=test-consumer-group" >> /usr/local/$KAFKA_VERSION/config/consumer.properties

# Build server.properties
rm -Rf /usr/local/$KAFKA_VERSION/config/server.properties
echo "broker.id=0" >> /usr/local/$KAFKA_VERSION/config/server.properties
echo "port=9092" >> /usr/local/$KAFKA_VERSION/config/server.properties
echo "num.network.threads=3" >> /usr/local/$KAFKA_VERSION/config/server.properties
echo "num.io.threads=8" >> /usr/local/$KAFKA_VERSION/config/server.properties
echo "socket.send.buffer.bytes=102400" >> /usr/local/$KAFKA_VERSION/config/server.properties
echo "socket.receive.buffer.bytes=102400" >> /usr/local/$KAFKA_VERSION/config/server.properties
echo "socket.request.max.bytes=104857600" >> /usr/local/$KAFKA_VERSION/config/server.properties
echo "log.dirs=/tmp/kafka-logs" >> /usr/local/$KAFKA_VERSION/config/server.properties
echo "num.partitions=1" >> /usr/local/$KAFKA_VERSION/config/server.properties
echo "num.recovery.threads.per.data.dir=1" >> /usr/local/$KAFKA_VERSION/config/server.properties
echo "log.retention.hours=168" >> /usr/local/$KAFKA_VERSION/config/server.properties
echo "log.segment.bytes=1073741824" >> /usr/local/$KAFKA_VERSION/config/server.properties
echo "log.retention.check.interval.ms=300000" >> /usr/local/$KAFKA_VERSION/config/server.properties
echo "log.cleaner.enable=false" >> /usr/local/$KAFKA_VERSION/config/server.properties
echo "zookeeper.connect=${ZOOKEEPERHOSTS}:${ZOOKEEPER_PORT}" >> /usr/local/$KAFKA_VERSION/config/server.properties
echo "zookeeper.connection.timeout.ms=6000" >> /usr/local/$KAFKA_VERSION/config/server.properties

# Build producer.properties
rm -Rf /usr/local/$KAFKA_VERSION/config/producer.properties
echo "metadata.broker.list=${METADATA_BROKER_INTERFACE}:${METADATA_BROKER_PORT}" >> /usr/local/$KAFKA_VERSION/config/producer.properties
echo "producer.type=sync" >> /usr/local/$KAFKA_VERSION/config/producer.properties
echo "compression.codec=none" >> /usr/local/$KAFKA_VERSION/config/producer.properties
echo "serializer.class=kafka.serializer.DefaultEncoder" >> /usr/local/$KAFKA_VERSION/config/producer.properties

# Wait for zookeeper
while ! exec 6<>/dev/tcp/${ZOOKEEPERHOSTS}/${ZOOKEEPER_PORT}; do
   echo "$(date) - still waiting for zookeeper at ${ZOOKEEPERHOSTS}"
    sleep 5
done

# Start KAFKA
sudo -u kafka /usr/local/$KAFKA_VERSION/bin/kafka-server-start.sh /usr/local/$KAFKA_VERSION/config/server.properties &

# Infinite loop
while true; do 
	sleep 10
done
