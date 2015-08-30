# ---- Version control ----

FROM docker-registry.life.atigeo.com:5000/java7

ENV KAFKA_VERSION kafka_2.10-0.8.2.1
ENV KAFKA_DOWNLOAD http://apache.osuosl.org/kafka/0.8.2.1/kafka_2.10-0.8.2.1.tgz

# ---- Default Environmental Variables ----

# Zookeeper
ENV ZOOKEEPERHOSTS xpatterns-hadoop
ENV ZOOKEEPER_PORT 2181

# ---- Ports ----

# Kafka
EXPOSE 9092

# ---- Install Kafka ----

RUN useradd kafka -U
RUN echo kafka:kafka | chpasswd
RUN mkdir /home/kafka && chown kafka:kafka /home/kafka

RUN wget $KAFKA_DOWNLOAD  -P /tmp/
RUN tar zxvf /tmp/$KAFKA_VERSION.tgz -C /usr/local/

# ---- Setup the startup script ----

COPY conf/startup.sh /startup.sh
RUN mkdir /home/tomcat && chown $USER:$USER /home/tomcat

RUN chmod u+x /startup.sh
CMD ["/startup.sh"]