# Apache Kafka Vagrant Machine
> Standalone mode for development

> Use only for learning or experiments

---

#### Clone this repo
```
git clone https://github.com/vansters-dev/kafka-standalone-vagrant.git
```

#### Up Vagrant machine
```
vagrant up
```

#### Go in vagrant machine
```
vagrant ssh
```
---

#### Kafka commands
- Create "test" topic
```
./bin/kafka-topics.sh --create --topic test --zookeeper localhost:2181 --partitions 1 --replication-factor 1
```

- Run terminal consumer
```
./bin/kafka-console-consumer.sh --topic test --zookeeper localhost:2181
```

- Run terminal producer
```
./bin/kafka-console-producer.sh --topic test --broker-list localhost:9092
```

---

###### *Note 1: * This installation only run a single broker
###### *Note 2: * Kafka commands must be run within
```
/home/vagrant/kafka/kafka_2.11-0.10.0.0
```
