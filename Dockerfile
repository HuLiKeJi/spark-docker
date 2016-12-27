# Spark Dockerfile
FROM anapsix/alpine-java

MAINTAINER HuLiKeJi

ENV SPARK_VERSION=2.0.2 \
    SPARK_HADOOP_VERSION=hadoop2.7 \
    SPARK_HOME="/opt/spark-${SPARK_VERSION}-bin-${SPARK_HADOOP_VERSION}"

# Install dependencies
RUN apk update && \
        apk add ca-certificates wget && \
        update-ca-certificates

RUN wget "http://mirror.bit.edu.cn/apache/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-${SPARK_HADOOP_VERSION}.tgz" -O /tmp/spark.tgz && \
    tar xvfz /tmp/spark.tgz -C /opt

ENV PATH $PATH:${SPARK_HOME}/bin

WORKDIR $SPARK_HOME
