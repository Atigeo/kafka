# ---- xPatterns Zookeeper Docker ----

# ---- Version control ----

FROM xpatterns/java7

# ---- Default Environmental Variables ----

# ---- Ports ----

EXPOSE 2180

#Add the CDH 5 repository
COPY conf/cloudera.list /etc/apt/sources.list.d/cloudera.list
#Set preference for cloudera packages
COPY conf/cloudera.pref /etc/apt/preferences.d/cloudera.pref

# ---- Add a Repository Key ----
RUN wget http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/archive.key -O archive.key && sudo apt-key add archive.key && \
    sudo apt-get update

# ---- Install Zookeeper ----
RUN sudo apt-get install -y zookeeper-server=3.4.5+cdh5.4.4+91-1.cdh5.4.4.p0.6~trusty-cdh5.4.4
RUN service zookeeper-server init

# ---- Clear tmp dir ----

RUN rm -Rf /tmp/*

# ---- Setup the startup script ----

COPY conf/startup.sh /startup.sh
RUN chmod u+x /startup.sh
CMD ["/startup.sh"]