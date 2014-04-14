#!/bin/bash

# For use with buildoop packages installed
AVRO_LIB=/usr/lib/avro/avro-1.7.5.jar
KAFKA_LIB=/usr/lib/kafka/kafka_2.9.2-0.8.0.jar

# For use with internal dependencies (without buildoop packages)
#AVRO_LIB=target/libs/avro-1.7.5.jar
#KAFKA_LIB=target/libs/kafka_2.9.2-0.8.0.jar

# Common Libraries
SCALA_LIB=target/libs/scala-library-2.9.2.jar
LOG4J_LIB=target/libs/log4j-1.2.16.jar
METRICS_LIB=target/libs/metrics-core-2.2.0.jar
SLF4J_LIB=target/libs/slf4j-api-1.6.1.jar
JACKSON_LIBS=target/libs/jackson-core-asl-1.8.8.jar:target/libs/jackson-mapper-asl-1.8.8.jar
CAMUS_LIBS=target/libs/camus-kafka-coders-0.1.0.jar:target/libs/camus-etl-kafka-0.1.0.jar:target/libs/camus-api-0.1.0.jar:target/libs/camus-schema-registry-avro-0.1.0.jar
AVRO_REPO=target/libs/avro-repo-common-1.7.4.jar:target/libs/avro-repo-client-1.7.4.jar
JERSEY_LIBS=target/libs/jersey-client-1.8.jar:target/libs/jersey-core-1.8.jar:
KAFKA_PRODUCER_AVRO=target/avroRepoKafkaProducerTest-0.0.1.jar

CLASSPATH=$LOG4J_LIB:$SCALA_LIB:$AVRO_LIB:$KAFKA_LIB:$METRICS_LIB:$SLF4J_LIB:$JACKSON_LIBS:$CAMUS_LIBS:$AVRO_REPO:$JERSEY_LIBS:$KAFKA_PRODUCER_AVRO
MAIN_CLASS=org.buildoop.kafka.producer.AvroRepoKafkaProducerTest
PROPERTIES_FILE=resources/config.properties


java -cp $CLASSPATH $MAIN_CLASS $PROPERTIES_FILE 
