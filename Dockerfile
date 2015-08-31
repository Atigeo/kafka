# ---- xPatterns Kafka Docker ----

# ---- Version control ----

FROM docker-registry.life.atigeo.com:5000/java7

ENV KAFKA_VERSION kafka_2.10-0.8.2.1
ENV KAFKA_DOWNLOAD http://apache.osuosl.org/kafka/0.8.2.1/kafka_2.10-0.8.2.1.tgz

# ---- Default Environmental Variables ----

#Zookeeper
ENV ZOOKEEPERHOSTS xpatterns-hadoop
ENV ZOOKEEPER_PORT 2181

#Kafka
ENV METADATA_BROKER_INTERFACE localhost
ENV METADATA_BROKER_PORT 9092

# ---- Ports ----

# Kafka
EXPOSE ${METADATA_BROKER_PORT}

# ---- Install Kafka ----

RUN wget $KAFKA_DOWNLOAD  -P /tmp/
RUN tar zxvf /tmp/$KAFKA_VERSION.tgz -C /usr/local/

# ---- Create user Kafka ----

RUN useradd kafka -U
RUN echo kafka:kafka | chpasswd
RUN mkdir /home/kafka
RUN chown kafka:kafka /home/kafka
RUN chown /usr/local/${KAFKA_VERSION}

# ---- Clear tmp dir ----

RUN rm -Rf /tmp/*

# ---- Setup the startup script ----

COPY conf/startup.sh /startup.sh
RUN chmod u+x /startup.sh
CMD ["/startup.sh"]