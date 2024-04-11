# UE22AM251B Big Data Lab 5
Explore In-memory data structures through RDDs 

## Analysis of Social media influencers
This is an assignment for the UE20CS322 Big Data Course at PES University.
A social media platform wants to analyze user follower data to identify top influencers with the most followers and users who follow the most accounts. To efficiently process this data, Spark RDDs are employed as in-memory data structures.


## Assignment Objectives and Outcomes
* Get familiar with Apache Spark and learn about the speed and efficiency of Spark.
* Students gain practical experience working with Spark RDDs, which are the fundamental data structures in Spark. They learn how to load, manipulate, and analyze data using RDD transformations and actions.
* Students grasp the concept of lazy evaluation in Spark, where transformations are not executed immediately but are evaluated only when an action is triggered. This understanding is crucial for optimizing data processing workflows.



## Submission Guidelines
You will need to make the following changes to your ```spark-solution.py``` scripts.


1. Include the following shebang on the first line of your code
```#!/usr/bin/env python3```

2. Convert your files to an executable
```chmod +x spark-solution.py```

3. Convert line breaks in DOS format to Unix format (this is necessary if you are coding on Windows)
```dos2unix spark-solution.py```

## Software/Languages to be used:
1. Python ``3.10.x``
2. Hadoop ``v3.3.6``
3. Apache Spark ``v3.3.0``

Additionally, the following Python libraries are required:

1. pyspark == ``3.3.0``

**No other libraries are allowed.**

## Dataset
You will be working with a social media dataset. You will be working with 7% of the actual dataset. The code you submitted will be run on a bigger dataset and has to produce correct output. Below are the columns of the dataset:

1. User ID (string)
2. Username (string)
3. Follower Count (string)
4. Following Count (string)

## Problem Statement
Identifying top 5 influencers and identifying top 5 users who follow the most accounts. 

:::info
Note: Create separate directories for top 5 influencers and top 5 users who follow the most accounts
:::

### Task Breakdown
1. **Data Loading:** Load the user data from a CSV file into a Spark DataFrame. It assumes the CSV file has a header row, and it automatically infers the schema.

2. **Data Preparation:** Convert certain columns to the correct data type, specifically, the columns other than username to int.

3. **Calculating Total Followers and Following Counts:** The code should calculate the total number of followers and total following counts for each user. It should add two new columns to the DataFrame. This step prepares the data for identifying top influencers and users who follow the most accounts.

4. **Identifying Top Influencers:** The code should identify the top influencers by sorting the DataFrame in descending order based on the Total Followers column. It should limit the results to the top five users with the most followers.

5. **Identifying Users Who Follow the Most Accounts:** Similarly, the code should identify users who follow the most accounts by sorting the DataFrame in descending order based on the Total Following column. It should limit the results to the top five users in this category.

6. **Saving Results:** The results are saved to text files. The top influencer's results are saved in "top_influencers" and the users who follow the most accounts are saved in "most_following_users" where top_influencers, most_following_users are directories created. 

7. **Code Execution:** The code should be executed within a SparkSession, which provides the necessary environment for distributed data processing.

8. **Resource Cleanup:** After completing the data analysis and saving the results, the SparkSession should be stopped to release allocated resources.




#### Sample input:
Find sample dataset [here](https://drive.google.com/file/d/1mB6t1Mm5UvyKNWGK-yzzY58P9Pdn2wLP/view?usp=sharing) 
<!-- Your code will be tested on a larger database.
 -->
![Screenshot from 2023-11-11 21-37-30](https://hackmd.io/_uploads/HJN0L7TX6.png)


#### Sample output:
Find sample output.
![Screenshot from 2023-11-11 21-35-33](https://hackmd.io/_uploads/Sy3LL7Tma.png)

<u>directory -> most_following_users:
    file -> part-00000</u>
Row(User ID='2', TotalFollowing=19)
Row(User ID='9', TotalFollowing=17)
Row(User ID='3', TotalFollowing=15)
Row(User ID='1', TotalFollowing=14)
Row(User ID='7', TotalFollowing=14)

<u>directory -> top_influencers:
    file -> part-00000</u>
Row(User ID='5', TotalFollowers=10)
Row(User ID='2', TotalFollowers=7)
Row(User ID='9', TotalFollowers=7)
Row(User ID='1', TotalFollowers=6)
Row(User ID='3', TotalFollowers=6)


## Submission Guidelines
All the code required to complete task breakdown is required to be in a script named `your_srn.py`. Only this single file needs to be submitted. Note that `your_srn.py` file will be run directly on spark so make sure not to add any unnecessary formatted lines, or else your python script won't run. SRN must be in lowercase.
Note: Do not include code for step 6) (Saving results to output files) in your submission file.

## Helpful Commands
**Starting Spark**
start-all.sh is a shell script that is used to start all the processes that spark requires.
```
/opt/spark/sbin/start-all.sh 
```

**How to run:** You are required to load the dataset into a Spark RDD or DataFrame and perform the required operations on it. You can use the spark-submit command to run your code. The command should be as follows:

``/opt/spark/bin/spark-submit spark-solution.py <input_file> <output_folder>``

:::info
IMPORTANT
Please mention the complete path to the spark-solution.py, input file and output files in the above terminal command.
:::

**To start spark shell:**
/opt/spark/bin/spark-shell: you can use this to test and run a few small spark programs.

**Example:**

```
/** map */
var map = sc.textFile("/path/to/text/file").flatMap(line => line.split(" ")).map(word => (word,1));
 
/** reduce */
var counts = map.reduceByKey(_ + _);
 
/** save the output to file */
counts.saveAsTextFile("/path/to/output/")
```