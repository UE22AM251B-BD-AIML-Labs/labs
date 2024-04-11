# UE22AM251B Big Data Lab 7
Explore topic based publish-subscribe model for Distributed data streaming platform – Apache Kafka

## Assignment Objectives and Outcomes

Apache Kafka is an open-source distributed event streaming platform used for building real-time data pipelines and streaming applications. Developed by the Apache Software Foundation, Kafka is designed to handle high-throughput, fault-tolerant, and scalable data streaming. It provides a publish-subscribe model for processing and storing streams of records in a fault-tolerant way.

The objective of this assignment is to explore and implement a topic-based publish-subscribe model using Apache Kafka for distributed data streaming. Students will gain hands-on experience in setting up a Kafka cluster, creating topics, designing producers and consumers, and understanding the fundamentals of publish-subscribe messaging in a distributed environment.



## Software/Languages to be used
1. Python ```3.10.x```
2. Apache Kafka ```2.13-3.6.1```

Additionally, the following Python libraries are required:
1. kafka-python ```2.0.2^```

## Submission Deadline

## Submission Guidelines

You will need to make the following changes to your Python scripts before submitting them.
1. Include the following shebang at the top of your Python scripts.
```
#!/usr/bin/env python3
```
2. Convert your files to executable using the following command.
```
chmod +x *.py
```
3. Convert line breaks in DOS format to Unix format (this is necessary if you are coding on Windows without which your code will not run our portal).
```
dos2unix *.py
```

## Environment Setup
First, you have to setup Apache Kafka on your system. 

Steps:
1. Download this [script](https://drive.google.com/file/d/10cz_Acm2zyydO07Yzyq28OyeDGzblCHY/view?usp=sharing) 
2. Run the following commands
```
chmod +x *.sh    #Giving executable permissions to all shell scripts
dos2unix *.sh    #Important for converting scripts from CRLF to LF
source kafka.sh  #Execute the script
```

## Tasks Background

Apache Kafka can be utilized for processing and analyzing network traffic logs. The goal is to showcase the capabilities of Kafka in handling large-scale data streams efficiently and enabling real-time analytics for network security monitoring.

Network Security monitoring is done through the following steps:
1) **Log Ingestion**
2) **Kafka Cluster**
3) Topic Partitioning
4) **Real-time Processing**
5) Security Analytics
6) Visualization and Alerts
7) Storage and Historical Analysis

You will work on the **Log Ingestion**, **Kafka Cluster**, **Real-time Processing** phases and learn how to perform network traffic logs analysis using Apache Kafka.

## Tasks Overview

You will be working with the condensed and clean version of this [Intrusion Detection Evaluation Dataset](https://www.unb.ca/cic/datasets/ids-2017.html) available to download from this [link](https://drive.google.com/file/d/17fy8hL0HTIRYPguTZPLj7u8KJd80LL_0/view?usp=sharing).

The above database (GDrive link) shall be used for all the three tasks desribed below.


## Task Specifications

The columns in the dataset are as follows:
``` 
1. Flow ID
2. Source IP
3. Source Port
4. Destination IP
5. Destination Port
6. Protocol
7. Timestamp
8. Flow Duration
9. Total Fwd Packets
10. Total Backward Packets
11. Total Length of Fwd Packets
.
.
49.  Packet Length Variance
```
### Task 1
Find the means of 'Total Length of Fwd Packets' observed for a Source IP under a range of Source Ports.
> For example,
> For source IP: 192.168.10.19 and range of source ports (0, 50000), the answer comes out to be
> `{
    "192.168.10.19": 286.3
}
`
> as per the given dataset. Your code should work for any such source ip and source port range. Evaluation Test case won't be disclosed publically.

### Task 2
Find the Output ID for the packet with the most Flow Duration under a Destination Port.
> For example,
> For destination port 443, the answer comes out to be
> `{
    "Flow Duration": "94959",
    "Flow ID with max Flow Duration": "162.213.33.50-192.168.10.51-443-59119-6"
}
`
> as per the given dataset. Your code should work for any such destination port. Evaluation Test case won't be disclosed publically.


## Task Deliverables

You are supposed to do all the tasks in two different python consumer files. The script should output 2 .json files pertaining to the 2 tasks.

**Files to be zipped as per (Section_SRN_Lab7.zip):**

1) producer.py
2) consumer1.py
3) consumer2.py

in the specific naming format as mentioned above, or submission will be marked 0.

How to run:
```
python3 kafka-consumer.py topicName [commandline arguments] > output.json

in one terminal
```

```
cat CIC-IDS2017.csv | python3 kafka-producer.py topicName

in another terminal
```

:::info
### Notes:
1. The topic name should not be hardcoded. The topic name should be passed as a command line argument for both the producer and consumer files.
2. There is a special line in the end of the input file named EOF . This is done so that the consumer knows when to stop reading from the topic. You must not include this line in the output.
3. Usage of direct file interaction commands such as python's open() is not allowed. You must use Kafka's producer and consumer APIs to solve the problem statement.
4. All IPs, ports should be passed as commandline arguments, same as topic, not hardcoded.
6. Print the json.dumps() of the dictionary to the standard output and not the dictionary itself.
:::

### Sample Output
The [sample input files](https://drive.google.com/drive/folders/1Ehzgj3U4OZzsbahObGMuVz2eam2FJpJR?usp=sharing) are provided here. You can use the diff command to check if your output is correct.

```
diff <(jq --sort-keys . your-output.json) <(jq --sort-keys . output.json)
```

### Useful Links
1. https://kafka-python.readthedocs.io/en/master/
2. https://pypi.org/project/kafka-python/
