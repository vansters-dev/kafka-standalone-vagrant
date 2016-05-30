#!/usr/bin/env bash
# Install Java 8 & Apache Kafka 0.10.00
#

# Download and unzipped kafka source
mkdir kafka
cd kafka
wget http://mirror.softaculous.com/apache//kafka/0.10.0.0/kafka_2.11-0.10.0.0.tgz
tar xf kafka_2.11-0.10.0.0.tgz
cd kafka_2.11-0.10.0.0/

sudo apt-get update

# Install Java 8
apt-get install --yes python-software-properties
add-apt-repository ppa:webupd8team/java
apt-get update -qq
echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | /usr/bin/debconf-set-selections
apt-get install --yes oracle-java8-installer
yes "" | apt-get -f install

# Apache Kafka specify hostname as 0.0.0.0 to bind to all interfaces
sudo echo "listeners=PLAINTEXT://0.0.0.0:9092" >> ./config/server.properties

# Start zookeeper
./bin/zookeeper-server-start.sh ./config/zookeeper.properties &
# Start Apache Kafka broker
./bin/kafka-server-start.sh ./config/server.properties &
