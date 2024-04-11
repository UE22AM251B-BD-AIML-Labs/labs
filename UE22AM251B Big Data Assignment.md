# UE22AM251B Big Data Assignment 


## Objectives and Outcomes
The project should showcase your ability to design and implement big data workflows.



## Software/Languages
<!-- * Storage: HBase, Cassandra -->
<!-- * Workflow Manaager: Oozie -->

* Data Streaming: Spark
* Scripter: Python 
* Environment: Oracle Virtualbox or VMWare
* Job runner: Hadoop

## Overview
In this assignment, you're required to create a data streaming workflow using Kafka for the first half. This workflow will involve producing streaming trade data to a HDFS sink. In the second half, you'll use the same HDFS file as a source for two Hadoop jobs outlined in tasks 1 and 2.

## Submission Guidelines

A **pdf** report containing all code/scripts, detailed explanation of the workflow, configurations for setting up and executing the assignment and screenshots of the same **(make sure your team name is visible in the screenshots, in terminal screenshots/as a comment in code/as a dir name in execution path)**.
<b>Plagiarised reports will have teams flagged and marks will be deducted.</b>
Deliverable: your_team_name.pdf

## Task

## Task Specifications
<!-- You will be working with an ecommerce dataset in which each row is an event log of user activity on a particular ecommerce website. 
A user is identified with a `user_id` and `user_session`, and the type of event recorder is either view, cart or purchase.
"view" implies the user just viewed a particular product, whereas "cart" means he added the product to his cart or shopping basket, and "purchase" implies he purchased it. 
A `product` is an item, identified with `product_id`, belonging to a `category_id` and `category_code`, of a particular `brand`, and has a particular `price` as well.
 -->
You will be working with binance's API that returns values that represent different aspects of a trade event on Binance exchange.

The following example retrieves real-time trade updates for a specific trading pair (BTC-USDT in this example) on Binance using the Binance WebSocket API


#### Endpoint

```wss://stream.binance.com:9443/ws/btcusdt@trade```

⁠

#### Schema


```
1. "e": Event type (String)
The type of event, in this case, "trade".

2. "E": Event time (Integer)
The timestamp of the event in milliseconds.

3. "s": Symbol (String)
The trading pair symbol, e.g., "BTCUSDT" for Bitcoin to USDT.

4. "t": Trade ID (Integer)
The unique identifier for the trade event.

5. "p": Price (Float)
The price at which the trade occurred.

6. "q": Quantity (Float)
 The quantity of the asset traded.

7. "b": Buyer order ID (Integer)
The unique identifier for the buyer's order.

8. "a": Seller order ID (Integer)
The unique identifier for the seller's order.

9. "T": Trade time (Integer)
The timestamp of the trade in milliseconds.

10. "m": Is the buyer the market maker? (Boolean)
Indicates whether the buyer is the market maker.

11. "M": Ignore (system specific, not relevant to user) (Boolean/Null)
```

#### Request Params 

`symbol`
(btcusdt in this example)

#### Sample response

```
{
    "e": "trade",
    "E": 1712176569334,
    "s": "BTCUSDT",
    "t": 3530509543,
    "p": "65613.39000000",
    "q": "0.00543000",
    "b": 26232302040,
    "a": 26232302223,
    "T": 1712176569333,
    "m": true,
    "M": true
}
```


<!-- 1. Flume/Kafka source and sink (consumer) scripts.
2. Kafka connector script to HDFS.
3. Hadoop mapper & reducer scipts or HIVE DDL and DML scripts to execute tasks 1 and 2. 
4. An Oozie workflow XML file that defines the sequence of actions, including Hadoop MapReduce job Hive action execution, and handling of failures.
5. A comprehensive documentation detailing the workflow design, configurations, and scripts, along with instructions for setting up and running the workflow.  -->


## Kafka

Using Kafka, you will need two Python scripts to stream data from Binance's WebSocket API, process it, and then write it to HDFS.

Kafka is to be used as a message broker here, a producer script to publish messages (trade events from Binance's WebSocket API) to a Kafka topic (btcusdt_trades for example), and the consumer script to consume those messages from the same Kafka topic and wite to HDFS.

Once this step is complete, execute the tasks below using the same file in HDFS as a data source for Hadoop.


## Hadoop
Get the output for the following queries by running hadoop jobs. (Implementation is upto you, using Hive or MR)

### Task 1
<!-- Identify the popular brands based on cart and purchase history across user sessions. List out the top 10 brands separated by newline in a file called ```srn_hadoop_task1.txt```. -->

Determine the percentage of trades where the buyer is the market maker for each trading pair.

### Task 2
<!-- Identify user sessions with high cart abandonment. Note that those user sessions that end with a purchase do not result in cart abondonment. List out 10000 such user sessions separated by newline in a file called ```srn_hadoop_task2.txt```. -->

Find the top 5 trading pairs with the highest trade volume.

A trading pair consists of a buyer and seller (identified by their IDs). Your job is to find similar pairs and find out the top 5 pairs with the highest cumulative volume (price*quantity).
If you do not find similar pairs then return top 5 trading pairs with the highest trade volume, noncumulative.
<!-- There will be many such same buyer and seller pairings. -->


<!-- ### Task 3

Analyze the distribution of trade timestamps to identify any patterns or anomalies. -->

## Links


1. https://github.com/binance/binance-spot-api-docs/blob/master/web-socket-streams.md#trade-streams


<!-- 1. https://www.youtube.com/watch?v=34HDFiAIcyY
2. https://docs.google.com/document/d/1dGYF5wpAIb1MZ1EgDY86VGbkmVgPq5H3QU22u0LwpF4/edit
3. https://binance-docs.github.io/apidocs/voptions/en/#option-mark-price
 -->

