AvroRepoKafkaProducerTest
=========================

Basic kafka producer to send Avro Messages with an Avro schema repository.

Working mode:

1. Producer construct the avro message
2. Encode the message using a test sqchema included in folder resources
3. Fill the content of the message with some basic information.
4. Encode the message (using com.linkedin.camus.etl.kafka.coders.KafkaAvroMessageEncoder class)
   - KafkaAvroMessageEncoder communicates with an avro schemas repository.
   - Avro repo send an ID to our test program, the message is stored in Kafka with the ID in the Header and the bytes payload.
   

Avro Schema Repo:
  https://github.com/mvalleavila/avro-1.7.4-schema-repo
  - Stores the schemas, if an schema is not stored sends a new ID, if the schema exists sen the previously assigned ID.
  - Then the consumer "asks" for the schema with a determinated ID.
  
Camus:
  https://github.com/mvalleavila/camus
  - Camus is a connection between Kafka and HDFS. So is a Kafka Consumer, in this example a camus class it's usedto encode the message, and "talk" with the Avro Schema Repository

=================================

## Compilation
  mvn clean package
  
==================================

## Use
   - Edit resources/config.properties with the rights IP and Ports where you are running kafka brokers and the schema repo.
```
     metadata.broker.list=hadoop-manager:9092   
     etl.schema.registry.url=http://hadoop-manager:2876/schema-repo    
```
   - To select what Avro message will be sent edit ```avro.schema.file=resources/testSchema1.avsc```, three different files are included for three tests.
   
   - Execute run.sh  
   The ID of the message received is printed in console.  
   You can test sending the same message and check the same ID is being received.  
