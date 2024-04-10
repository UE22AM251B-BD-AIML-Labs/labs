## Hadoop Installation Guide

Execute the following commands to move to the home directory and updating the package list and the system. This guide assumes that you are working with Ubuntu or a Debian based distribution.
```
cd
sudo apt update -y
sudo apt upgrade -y
```
The commands in the guide use USER as the notation for your username, this should be your SRN in lowercase. This is important since the auto-evaluation depends on it. Verify your username by running `whoami`
on the terminal.
Change any `/home/USER/` to `/home/<your SRN>/`

## Installing Hadoop
Download hadoop installation script from [here](https://drive.google.com/file/d/1SNJFrFfIjpjoIg4SWhvYb1yip-sZMkjE/view?usp=sharing).

Run ```chmod +x *.sh``` to give executable permissions to the hadoop.sh file and run `source hadoop.sh`

## 1. Formatting NameNode
Before starting Hadoop for the first time, the namenode must be formatted. Use the following command.

`hdfs namenode -format`

A SHUTDOWN message will signify the end of the formatting process. If you have reached this stage, it signifies that you have successfully installed hadoop.


## 2. Starting Hadoop
Navigate to the hadoop folder and execute the following commands. start-all.sh is a shell script that is used to start all the processes that hadoop requires.



```
cd
cd hadoop-3.3.3/sbin/
./start-all.sh
```
Type `jps` to find all the Java Processes started by the shell script. You should see a total of 6 processes, including the `jps` process. Note that the order of the items and the process IDs will be different.

```
2994 DataNode
3219 SecondaryNameNode
3927 Jps
3431 ResourceManager
2856 NameNode
3566 NodeManager
```

## 3. Accessing Hadoop from the Browser
You can access Hadoop on `localhost` on the following ports:
```
NameNode - http://localhost:9870
DataNode - http://localhost:9864
YARN Manager - http://localhost:8088
```

## 4. Hadoop Example
We will be using the Wordcount example to demonstrate the usage of Hadoop.
Create a text file named input.txt with any content you want. Next, we will put
this to the HDFS folder `/example` with the following command.


```
hdfs dfs -mkdir /example
hdfs dfs -put input.txt /example
```

Run the following command for the wordcount example.

```
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-
examples-3.3.3.jar wordcount /example/input.txt /example/output
```

You can check the output with the following command.

`hdfs dfs -cat /example/output/part-r-00000`