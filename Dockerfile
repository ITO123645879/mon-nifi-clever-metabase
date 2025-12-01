FROM apache/nifi:1.25.0

# Installer le MySQL connector
USER root
RUN apt-get update && apt-get install -y wget && \
    wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j-8.3.0.tar.gz && \
    tar -xvf mysql-connector-j-8.3.0.tar.gz && \
    cp mysql-connector-j-8.3.0/mysql-connector-j-8.3.0.jar /opt/nifi/nifi-current/lib/

USER nifi

# Copie de ton fichier NiFi config
COPY nifi.properties /opt/nifi/nifi-current/conf/

CMD ["bin/nifi.sh", "run"]

