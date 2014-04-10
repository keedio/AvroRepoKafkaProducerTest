#!/bin/bash

AVRO_REPO_LIBS=lib
CAMUS_KAFKA_LIBS=lib

mkdir bin
javac -cp $AVRO_REPO_LIBS/avro-repo-bundle-1.7.4-withdeps.jar:\
$CAMUS_KAFKA_LIBS/camus-kafka-coders-0.1.0-SNAPSHOT-shaded.jar:\
$CAMUS_KAFKA_LIBS/camus-schema-registry-avro-0.1.0-SNAPSHOT.jar \
-d bin src/org/buildoop/kafka/producer/AvroRepoKafkaProducerTest.java

cd bin
mkdir ../target
jar -cf ../target/AvroRepoKafkaProducerTest.jar \
org/buildoop/kafka/producer/AvroRepoKafkaProducerTest.class
