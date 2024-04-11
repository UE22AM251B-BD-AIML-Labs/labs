# UE21CS343AB2 Big Data Lab 8
## Structured Streaming with Spark & Kafka

#### What is Structured Streaming?
Apache Spark Structured Streaming is a near-real time processing engine that offers end-to-end fault tolerance with exactly-once processing guarantees using familiar Spark APIs.
Structured Streaming lets you express computation on streaming data in the same way you express a batch computation on static data. The Structured Streaming engine performs the computation incrementally and continuously updates the result as streaming data arrives.

#### What does a streaming pipeline look like?

Streaming data pipelines move data from multiple sources to multiple target destinations in real time, capturing events as they are created and making them available for transformation, enrichment, and analysis. For many applications, real-time and continuously fresh data is vital.

An ingestion point(data source) can belong to various sources, such as a Kafka topic, or a TCP socket, or file storage services like S3. For this assignment, you will be reading streamed data from Kafka topics a KafkaProducer creates. After processing these streams(  aggregrations, transformations, feeding to ML algorithms), it can be written to a database, file storage, or consoled on terminal. Thereafter, insights are gathered from it by producing  realtime dashboards and visualisations. 

![image](https://hackmd.io/_uploads/rylOCQ8Up.png)


## Assignment Objectives and Outcomes
The objective of this assignment is to gain proficiency on Kafka, and Spark(Structured Streaming), Websockets;  to aggregate real-time price, best ask, and best bid values of Bitcoin.

<!-- #### What is Bitcoin? -->
<!-- Bitcoin is a digital or virtual currency created in 2009 that uses peer-to-peer transfers on a digital network that records all cryptocurrency transactions, facilitating instant payments. -->


What you will be working on: Collecting Data - Processing it - Storage
![image](https://hackmd.io/_uploads/ByOMwXU8p.png)

## Software/Languages to be used
1. Python ```3.10.x```
2. Apache Spark ```3.4.0^```

Additionally, the following python libraries are required:
1. pyspark.sql
2. websocket
3. json
4. python-kafka

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
This assignment requires Kafka, Spark and Zookeeper setup and running. The commands to run them are listed at the end if this document.
Kafka and Zookeeper should be ideally installed as prerequisites to previous labs.

Steps to setup Spark 3.5.0:
1. Download this [script](https://drive.google.com/file/d/120RXtseE2c3nnyG7dWjY44c19ttubflS/view?usp=sharing) 
2. Run the following commands
```
chmod +x *.sh    #Giving executable permissions to all shell scripts
dos2unix *.sh    #Important for converting scripts from CRLF to LF
source spark.sh  #Execute the script
```

## Tasks Overview

You will be working with publicly available, real-time market data using Coinbase exchange API that does not require any authentication or account creation. 


**Sample response data**: 
```
{
  "type": "ticker",
  "sequence": 44321677493,
  "product_id": "ETH-USD",
  "price": "1853.55",
  "open_24h": "1859.82",
  "volume_24h": "98528.66344819",
  "low_24h": "1827.35",
  "high_24h": "1890",
  "volume_30d": "3503430.97429533",
  "best_bid": "1853.43",
  "best_bid_size": "0.79324052",
  "best_ask": "1853.55",
  "best_ask_size": "0.19461192",
  "side": "buy",
  "time": "2023-04-24T15:01:47.940047Z",
  "trade_id": 44592518,
  "last_size": "0.02724408"
}
```


| Response Key           | Meaning                                                                         |
|:------------- |:------------------------------------------------------------------------------- |
| type          | The type of message  .                                                          |
| sequence      | A unique identifier for the message.                                            |
| product_id    | Identifier for the trading pair/topic.                                          |
| price         | Last traded price for the cryptocurrency.                                       |
| open_24h      | Opening price for the cryptocurrency in the last 24h                            |
| volume_24h    | Total trading volume of crypocurrency in 24h                                    |
| low_24h       | Lowest price for the cryptocurrency in the last 24h                             |
| high_24h      | Highest price for the cryptocurrency in the last 24h                            |
| volume_30d    | Total trading volume of crypocurrency in 30 days                                |
| best_bid      | Highest price a buyer is willing to pay for that crypocurrency.                                   |
| best_bid_size | Quantity of crypocurrency a buyer is willing to pay on the best_bid price.      |
| best_ask      | Lowest price that a seller is willing to accept.                                 |
| best_ask_size | Quantity of the cryptocurrency that a seller is offering at the best_ask price. |
| side          | Whether the last trade occured on buyer or seller side.                         |
| time          | Timestamp when ticker update was received.                                      |
| last_size     | Size/Quantity of last trade occured                                             |
| trade_id      | Identifier for the last trade that occurred.                                    |


![image](https://hackmd.io/_uploads/HyhNeNUUa.png)



## Task Specifications

### Task 1

You have to develop a script, called ```producer.py```, that uses a WebSocket client connection to connect to Coinbase Pro WebSocket API, subscribes to ticker data for specific cryptocurrency pairs (BTC-USD and ETH-USD), and then sends that data to a Kafka topic as a KafkaProducer.

Websocket url: ```wss://ws-feed.pro.coinbase.com```

This is essentially broken down to the following steps: 

Create a websocket that runs forever, passing in the above url and appropriate functions to be called once a connection is established. This includes subscribing to ETH-USD and BTC-USD Product IDs and ticker channel. Create a topic with the respective Product IDs and produce the respective data stream as a message to that topic.
More details can be found [here](https://docs.cloud.coinbase.com/exchange/docs/websocket-overview) and [here](https://kafka-python.readthedocs.io/en/master/apidoc/KafkaProducer.html).


### Task 2

Complete the given `consumer.py` file that can be downloaded from [here](https://drive.google.com/file/d/12-ezaClu4CWX1vOM1H5EmWi3svHcr4Td/view?usp=sharing).
You will have to fill code blocks doing the following:
1. Read streamed data from the kafka broker for both topics.
2. Define a JSON schema to parse the raw JSON data from Kafka. Parse the raw JSON data, extract relevant fields, and cast them to appropriate data types.
3. Set a watermark(say 2 minutes) to handle late events.

4. Grouped by the product ID and timestamp window, and apply aggregations in the following manner:
```
  .agg(
        {
            "price": "mean",
            "volume_24h": "mean",
            "timestamp": "max",
            "best_bid": "max",
            "best_ask": "max",
        }
    )
```
5. Write the stream to a data sink (csv file named ```output.csv``` in ```append``` mode) with the following columns: max(timestamp), avg(price), max(best_bid), max(best_ask) and avg(volume_24h).


<!-- 3. Convert the timestamp to Spark timestamp format -->

## Task Deliverables

Submit your ```srn_producer.py``` and completed ```srn_consumer.py``` scripts along with the ```srn_output.csv``` file.

## How to Run


1. Start Kafka & Zookeeper with
```
systemctl start zookeeper
systemctl start kafka
```

2. Start Spark with ```/opt/spark/sbin/start-all.sh```

3. Check Kafka & Zookeeper status with
```
systemctl status zookeeper
systemctl status kafka
```

4. While your producer.py is producing streams to the kafka, submit a spark job with external dependencies to the spark cluster with
```./bin/spark-submit --packages org.apache.spark:spark-sql-kafka-0-10_2.12:3.5.0 consumer.py```

   (./bin/ can be ommitted if spark's bin directory is added to your system PATH variable)


4. Stop Kafka & Zookeeper with
```
systemctl stop zookeeper
systemctl stop kafka
```

6. Stop Spark with 
```
/opt/spark/sbin/stop-all.sh
```





## Useful Links
1. https://spark.apache.org/docs/latest/structured-streaming-programming-guide.html
2. https://sparkbyexamples.com/spark/spark-parse-json-from-text-file-string/
3. https://kafka-python.readthedocs.io/en/master/
4. https://sparkbyexamples.com/spark/spark-convert-string-to-timestamp-format/
5. https://sparkbyexamples.com/spark/spark-streaming-with-kafka/
6. https://www.databricks.com/blog/2017/04/26/processing-data-in-apache-kafka-with-structured-streaming-in-apache-spark-2-2.html