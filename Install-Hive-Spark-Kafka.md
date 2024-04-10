## Hive,  Spark, Kafka Installation Guide

First provide both the shell scripts the necessary permissions in the home directory (`cd`). Make sure you run these before installing any of the below tools.

```
chmod +x *.sh #Giving executable permissions to all shell scripts
dos2unix *.sh #Important for converting scripts from CRLF to LF
``` 
## 1. Hive
Download [hive-install.sh](https://drive.google.com/file/d/1047i2rQWIHqRltWZaPwMxjClwkGKpGvC/view?usp=sharing) and [start-hive.sh](https://drive.google.com/file/d/10bAKALrIoq3JlJgF1RzIEwvlt8ufTXoi/view?usp=sharing) scripts.



To install hive run the following command:
```source install-hive.sh```

Once installed, start hive with 
```start-hive.sh```
This script includes starting hadoop as well.
 
It is necessary to run the above command everytime you want to start hive shell. However, note that when you exit from hive, you need to stop hadoop as well, do this with ```./stop-all.sh && sudo rm -rf ~/dfsdata/ && sudo rm -rf ~/tmpdata/ && hdfs namenode -format```in ```$HADOOP_HOME/sbin``` directory.
 
## 2. Spark
Download the spark installation script [spark.sh](https://drive.google.com/file/d/120RXtseE2c3nnyG7dWjY44c19ttubflS/view?usp=sharing).
To install spark run the following command:
```source spark.sh```

To start Spark, run the following command:
`/opt/spark/sbin/start-all.sh`

To start Spark, run the following command:
`/opt/spark/sbin/stop-all.sh`

## 3. Kafka

Download the kafka installation script [kafka.sh](https://drive.google.com/file/d/10cz_Acm2zyydO07Yzyq28OyeDGzblCHY/view?usp=sharing) 

To install spark run the following command:
```source kafka.sh```

Run the following to start, check status, and stop kafka.
```
sudo systemctl start kafka
sudo systemctl status kafka
sudo systemctl stop kafka
```


Note that Zookeeper should be up and running first for kafka to function, run the following commands to start, check status and stop zookeeper.

```
sudo systemctl start zookeeper
sudo systemctl status zookeeper
sudo systemctl stop zookeeper
```


