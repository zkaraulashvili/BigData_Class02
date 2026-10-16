FROM quay.io/debezium/connect:2.6

USER root

RUN cd /kafka/connect && \
    curl -L -o debezium-connector-jdbc.tar.gz \
    https://repo1.maven.org/maven2/io/debezium/debezium-connector-jdbc/2.6.2.Final/debezium-connector-jdbc-2.6.2.Final-plugin.tar.gz && \
    tar -xzf debezium-connector-jdbc.tar.gz && \
    rm debezium-connector-jdbc.tar.gz

USER kafka
