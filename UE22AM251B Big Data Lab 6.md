# UE22AM251B Big Data Lab 6
Structured data processing with Spark Data frames and SparkSQL.


A DataFrame is a Dataset organized into named columns. It is conceptually equivalent to a table in a relational database or a data frame in R/Python, but with richer optimizations under the hood. DataFrames can be constructed from a wide array of sources such as: structured data files, tables in Hive, external databases, or existing RDDs. 

Spark SQL is Apache Spark’s module for working with structured data. It allows you to seamlessly mix SQL queries with Spark programs.


## Assignment Objectives and Outcomes
The objective of this assignment is to assess your proficiency in structured data processing using Apache Spark, specifically focusing on Spark DataFrames and Spark SQL. By completing this assignment, you are expected to demonstrate your ability to manipulate and analyze structured data efficiently using Spark's high-level abstractions.

## Software/Languages to be used
1. Python ```3.10.x```
2. Apache Spark ```3.5.0```

Additionally, the following Python libraries are required:
1. pyspark ```3.4.0^```

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

<!-- ## Environment Setup
First, you have to setup Apache Spark on your system. 

Steps:
1. Download this [script](https://drive.google.com/file/d/1UBsumpjsnx7Tc19Qj_zhjx3dJsBEZfrr/view?usp=sharing) 
2. Run the following commands
```
chmod +x *.sh    #Giving executable permissions to all shell scripts
dos2unix *.sh    #Important for converting scripts from CRLF to LF
source spark.sh  #Execute the script
``` -->
## Tasks Overview

You will be working with the condensed and clean version of this [Kaggle Database](https://www.kaggle.com/datasets/ankkur13/boston-crime-data/data) available to download from this [link](https://drive.google.com/file/d/11HrUjsbKZqJFQllS7MAK6bM-CxkqvcSK/view?usp=sharing).

The above database (GDrive link) shall be used for all the four tasks desribed below.

**Input data characteristics**: 

* The table should be deduplicated.
* The table may contain null/empty cells. You may drop any rows with NA values in any of the columns.

## Task Specifications

The columns in the dataset are as follows:
``` 
1. OFFENSE_CODE
2. OFFENSE_CODE_GROUP
3. DISTRICT
4. REPORTING_AREA
5. YEAR
6. MONTH
7. DAY_OF_WEEK
8. HOUR
9. STREET
```
### Task 1
What is the most common offense?

### Task 2
Find the distribution of crimes committed at each reporting area, in descending order.

### Task 3
Find the distribution of average number of reported crimes per day for each district?

### Task 4
Find the distribution of hours (Least 10) of crimes excluding the ones reported as "Larceny" in streets ending with "AVE", in ascending order.


## Task Deliverables

You are supposed to do all the tasks in a single python script. The script should save the results/output in 4 .csv files pertaining to the 4 tasks. Name the csv files as <b>SRN_task1.csv</b> respectively for tasks 2-4 as well.

How to run:
```
$SPARK_HOME/bin/spark-submit SRN.py <input_file> <output_folder>
```
:::info
### Notes:
<!-- 1. The input dataset filename and output solution folder name should not be hardcoded. The filenames should be passed as command line arguments. -->
1. Loops are not allowed. You must use Spark's RDDs and DataFrames to solve the problem statement.
2. The submittable filename should be <b>SRN.py</b>.
3. Usage of direct file interaction commands such as python's open() is not allowed. You must use Spark's RDDs and DataFrames to solve the problem statement.
5. Make sure to always fetch the available SparkContext / SparkSession object using the getOrCreate() method instead of creating a new one. This will prevent any errors while attempting to create a new SparkContext/SparkSession object to connect to the Spark cluster.
6. Any submission not adhering to instructed formats <b>WILL NOT</b> be evaluated. If you want your submission to count, make sure your submission is according to the format mentioned above. 
:::

### Sample Output
The [sample input files](https://drive.google.com/drive/folders/1sGPwF7yGCtvDvsLPp_EyhKeM2OJB-zSr?usp=sharing) are provided here. You can use the diff command to check if your output is correct.

```
diff Task*_output.csv SRN.csv
```




### Useful Links
1. https://spark.apache.org/docs/latest/api/python/getting_started/quickstart_df.html
2. https://sparkbyexamples.com/pyspark/pyspark-what-is-sparksession/
