AvroRepoKafkaProducerTest
=========================

Basic kafka producer to send Avro Messages with an Avro schema repository.

Working mode:

1. Producer constructs the avro message
2. Encodes the message using a test schema included in resources folder
3. Fills the content of the message with some basic information.
4. Encodes the message (using com.linkedin.camus.etl.kafka.coders.KafkaAvroMessageEncoder class)
   - KafkaAvroMessageEncoder communicates with an avro schemas repository.
   - Avro repo sends an ID to our test program, the message is stored in Kafka with the ID in the Header and the bytes payload.
   

Avro Schema Repo:
  https://github.com/mvalleavila/avro-1.7.4-schema-repo
  - Stores the schemas, if an schema is not stored sends a new ID, if the schema exists sen the previously assigned ID.
  - Then the consumer "asks" for the schema with a determinated ID.
  
Camus:
  https://github.com/mvalleavila/camus
  - Camus is a connection between Kafka and HDFS. So is a Kafka Consumer, in the example it's used a camus class to encode the message, and "talk" with the Avri Schema Repository

=================================

## Compilation
  mvn clean package
  
==================================

## Use
   - Edit resources/config.properties with the IP and Port where you are running kafka brokers and the schema repo.
     metadata.broker.list=hadoop-manager:9092   
     etl.schema.registry.url=http://hadoop-manager:2876/schema-repo    

     Execute run.sh:  
     The ID of the message received is printed in console, test sending the same message (same ID would be received), and send some different schemas (diferent ID will be received). To send different messages edit the property avro.schema.file=resources/testSchema1.avsc
     3 test schema avsc files are included in resources. (don't use other than included in resources folder)
