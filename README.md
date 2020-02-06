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
