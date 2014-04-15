#!/bin/bash
for i in /usr/lib/kafka/lib/kafka-producer-avro/*.jar
do
	CLASSPATH="$CLASSPATH:$i"
done

MAIN_CLASS=org.buildoop.kafka.producer.AvroRepoKafkaProducerTest
PROPERTIES_FILE=/etc/kafka/conf/producer-avro.properties

java -cp $CLASSPATH $MAIN_CLASS $PROPERTIES_FILE 
