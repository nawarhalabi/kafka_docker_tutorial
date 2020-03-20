docker network create kafka
docker network list
docker run --env ALLOW_ANONYMOUS_LOGIN=yes -p 2181:2181 -p 8080:8080  --hostname zksrv --name zksrv --network kafka -d bitnami/zookeeper:latest
echo srvr | nc localhost 2181
docker run -p 9092:9092 --hostname ksrv1 --env KAFKA_CFG_ZOOKEEPER_CONNECT=zksrv:2181 --env KAFKA_CFG_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092 --env ALLOW_PLAINTEXT_LISTENER=yes --env KAFKA_CFG_LISTENERS=PLAINTEXT://0.0.0.0:9092 --name ksrv1 --network kafka -d bitnami/kafka:latest
docker exec ksrv1 /opt/bitnami/kafka/bin/kafka-topics.sh --create --zookeeper zksrv:2181 --partitions 2 --replication-factor 2 --topic mytopic1
docker exec ksrv1 /opt/bitnami/kafka/bin/kafka-topics.sh --create --zookeeper zksrv:2181 --partitions 2 --replication-factor 2 --topic mytopic2
docker-compose up -d

