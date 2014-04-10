#!/bin/bash

java -cp lib/avro-repo-bundle-1.7.4-withdeps.jar:\
lib/camus-kafka-coders-0.1.0-SNAPSHOT-shaded.jar:\
lib/camus-schema-registry-avro-0.1.0-SNAPSHOT.jar:\
target/AvroRepoKafkaProducerTest.jar \
org.buildoop.kafka.producer.AvroRepoKafkaProducerTest resources/config.properties
