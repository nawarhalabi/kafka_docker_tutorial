# kafka_docker_tutorial
Workshop material for learning Kafka through the use of docker and some freely available docker images.

# Running the cluster
1. Make sure you have docker installed and the docker daemon is running in the background. the ```docker``` command in the terminal should return some help text.
2. Make sure docker-compose is installed and the ```docker-compose``` command returns some help text in the terminal.
3. In the terminal, navigate to the root directory and run the command ```docker-compose up -d```.
4. Now run ```docker ps``` to see which containers are running:
    * Two kafka brokers ```kafkadockertutorial_ksrv1_1``` and ```kafkadockertutorial_ksrv2_1```
    * A zookeeper container ```kafkadockertutorial_zksrv_1```
    * A kafka manager container ```kafkadockertutorial_kmgr_1``` for monitoring (-ish)
    * A jupyter/spark container ```kafkadockertutorial_jupyter-spark_1``` which would be our streaming cluster (one node only)
    * A jdbc mysql container ```kafkadockertutorial_jdbc_1``` and a web interface container to manage the DB ```kafkadockertutorial_adminer_1```
    * A rest API for ingesting data into kafka through http ```rest```

# After running the cluster
* You can start ```jupyter notebook``` on the local machine in the root repo dir to try the producer consumer api
* You can go to localhost:8889 to access the spark cluster notebook (on windows use the ip of your docker machine)
* You can go to localhost:8080 to access the database manager (on windows use the ip of your docker machine)
* You can go to localhost:9000 to access the kafka manager (on windows use the ip of your docker machine)

# Using the REST api to produce data to topics
* Send a POST request to ```http://localhost:8082/topics/mytopic1``` (or use the ip address of the docker machine)
* Make sure these two headers are set:
   * ```Content-Type: application/vnd.kafka.binary.v2+json```
   * ```Accept: application/vnd.kafka.v2+json, application/vnd.kafka+json, application/json```
* The body of the POST request must follow the following json structure:
   ```{
  "records": [
    {
      "key": "a2V5",
      "value": "Y29uZmx1ZW50"
    },
    {
      "value": "a2Fma2E=",
      "partition": 1
    },
    {
      "value": "bG9ncw=="
    }
  ]
  }```
