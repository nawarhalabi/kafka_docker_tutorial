# kafka_docker_tutorial
Workshop material for learning Kafka through the use of docker and some freely available docker images.

# Running the cluster
1. Make sure you have docker installed and the docker daemon is running in the background. the ```docker``` command in the terminal should return some help text.
2. Make sure docker-compose is installed and the ```docker-compose``` command returns some help text in the terminal.
3. In the terminal, navigate to the root directory and run the command ```docker-compose up```.
4. Now run ```docker ps``` to see which containers are running:
  a. Two kafka brokers `````` and ``````
  b. A zookeeper container ``````
