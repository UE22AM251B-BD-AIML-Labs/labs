# UE22AM251B Big Data Lab 4
Basics of HIVE queries and Big Data analysis.

## Analysis of Formula-1 Dataset

This is the fourth lab for the Big Data Course at PES University.


## Assignment Objectives and Outcomes
1. This assignment will help students become familiar with the HIVE queries and analytics.
2. At the end of this assignment, the student will be able to write queries to extract desired information from big datasets.


## Software/Languages to be used
1. Python ```3.10.x```
2. Hadoop ```v3.3.6```
3. Hive ```v3.1.3``` 

If you havent't already installed Hive, find instructions to do so [here](https://drive.google.com/file/d/17Iz_FYe4xwywdyNP1aq95uSubDhCBzbF/view?usp=sharing).

## Tasks Overview

1. Load the data into HIVE database.
2. Write the HIVE queries for the given questions in both tasks.
3. Save the results.
4. Submit the files to the portal.

## Create & Load Dataset
Download the dataset from [this](https://drive.google.com/drive/folders/1gXvGEwmOtuxsMolZ9vhOiXv9Tp7onR2S?usp=sharing) link.
After starting hive, in your Hive terminal,

Create and use database with
```
create DATABASE f1;
use f1; 
```
set additional proprties with
```
set hive.exec.max.dynamic.partitions=2000;
set hive.exec.max.dynamic.partitions.pernode=2000;
set hive.cli.print.header=true;
set hive.exec.dynamic.partition.mode=nonstrict;
set hive.exec.dynamic.partition=true;
```
**Alternatively** you can run the below lines in terminal, not hive shell, for permenance (will be set for every hive session). 
 
```
hive --hiveconf hive.exec.max.dynamic.partitions=2000;
hive --hiveconf hive.exec.max.dynamic.partitions.pernode=2000;
hive --hiveconf hive.cli.print.header=true;
hive --hiveconf hive.exec.dynamic.partition.mode=nonstrict;
hive --hiveconf hive.exec.dynamic.partition=true;
``` 

Run these commands to create tables and load data.
Note that you need to replace the load data path for each table **with your own path to dataset**.


```
CREATE TABLE IF NOT EXISTS f1.qualifying(
qualifyId INT,
raceId INT,
driverId INT,
constructorId INT,
number INT,
position INT,
q1 STRING,
q2 STRING,
q3 STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
tblproperties("skip.header.line.count"="1");

LOAD DATA LOCAL INPATH '/ABSOLUTE_DIR_PATH_TO_DATASET/qualifying.csv' OVERWRITE INTO TABLE f1.qualifying;


CREATE TABLE IF NOT EXISTS f1.drivers(
driverId INT,
driverRef STRING,
number INT,
code STRING,
forename STRING,
surname STRING,
dob  STRING,
nationality STRING,
url STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
tblproperties("skip.header.line.count"="1");

LOAD DATA LOCAL INPATH '/ABSOLUTE_DIR_PATH_TO_DATASET/drivers.csv' OVERWRITE INTO TABLE f1.drivers;


CREATE TABLE IF NOT EXISTS f1.pitStops(
raceId INT,
driverId INT,	
stop INT,	
lap INT,
time INT,	
duration FLOAT,
milliseconds INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
tblproperties("skip.header.line.count"="1");

LOAD DATA LOCAL INPATH '/ABSOLUTE_DIR_PATH_TO_DATASET/pit_stops.csv' OVERWRITE INTO TABLE f1.pitStops;


CREATE TABLE IF NOT EXISTS f1.circuits(
circuitId INT,
circuitRef  STRING,
name STRING,
location STRING,
country STRING,
lat DOUBLE,
lng DOUBLE,
alt INT,
url STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
tblproperties("skip.header.line.count"="1");

LOAD DATA LOCAL INPATH '/ABSOLUTE_DIR_PATH_TO_DATASET/circuits.csv' OVERWRITE INTO TABLE f1.circuits;


CREATE TABLE IF NOT EXISTS f1.constructor_results(
constructorResultsId INT,
raceId INT,
constructorId INT,
points INT,
status STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
tblproperties("skip.header.line.count"="1");

LOAD DATA LOCAL INPATH '/ABSOLUTE_DIR_PATH_TO_DATASET/constructor_results.csv' OVERWRITE INTO TABLE f1.constructor_results;


CREATE TABLE IF NOT EXISTS f1.constructor_standings(
constructorStandingsId INT,
raceId INT,
constructorId INT,
points INT, 
position INT,
positionText STRING,
wins INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
tblproperties("skip.header.line.count"="1");

LOAD DATA LOCAL INPATH '/ABSOLUTE_DIR_PATH_TO_DATASET/constructor_standings.csv' OVERWRITE INTO 
TABLE f1.constructor_standings;


CREATE TABLE IF NOT EXISTS f1.constructors(
constructorId INT,
constructorRef STRING,
name STRING,
nationality STRING,
url STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
tblproperties("skip.header.line.count"="1");

LOAD DATA LOCAL INPATH '/ABSOLUTE_DIR_PATH_TO_DATASET/constructors.csv' OVERWRITE INTO TABLE f1.constructors;


CREATE TABLE IF NOT EXISTS f1.driver_standings(
driverStandingsId INT,
raceId INT,
driverId INT,
points INT,
position INT,
positionText STRING,
wins INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
tblproperties("skip.header.line.count"="1");

LOAD DATA LOCAL INPATH '/ABSOLUTE_DIR_PATH_TO_DATASET/driver_standings.csv' OVERWRITE INTO TABLE f1.driver_standings;


CREATE TABLE IF NOT EXISTS f1.drivers(
driverId INT,
driverRef STRING,
number INT,
code STRING,
forename STRING,
surname STRING,
dob  STRING,
nationality STRING,
url STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
tblproperties("skip.header.line.count"="1");

LOAD DATA LOCAL INPATH '/ABSOLUTE_DIR_PATH_TO_DATASET/drivers.csv' OVERWRITE INTO TABLE f1.drivers;



CREATE TABLE IF NOT EXISTS f1.lapTimes(
raceId INT,
driverId INT,
lap INT,
position INT,
laptime TIMESTAMP,
milliseconds INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
tblproperties("skip.header.line.count"="1");

LOAD DATA LOCAL INPATH '/ABSOLUTE_DIR_PATH_TO_DATASET/lap_times.csv' OVERWRITE INTO TABLE f1.lapTimes;


CREATE TABLE IF NOT EXISTS f1.races(
raceId INT,
year INT,
round INT,
circuitId INT,
name STRING,
raceDate DATE,
raceTime TIMESTAMP,
url STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
tblproperties("skip.header.line.count"="1");

LOAD DATA LOCAL INPATH '/ABSOLUTE_DIR_PATH_TO_DATASET/races.csv' OVERWRITE INTO TABLE f1.races;


CREATE TABLE IF NOT EXISTS f1.results(
resultId INT,	
raceId INT,
driverId INT,	
constructorId INT,
number INT,
grid INT,
position INT,	
positionText INT,
positionOrder INT,
points INT,
laps INT,
raceTime TIMESTAMP,
milliseconds INT,
fastestLap INT,
rank INT,
fastestLapTime TIMESTAMP,
fastestLapSpeed FLOAT,
statusId INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
tblproperties("skip.header.line.count"="1");

LOAD DATA LOCAL INPATH '/ABSOLUTE_DIR_PATH_TO_DATASET/results.csv' OVERWRITE INTO TABLE f1.results;


```

## Task Specifications

#### Dataset Description
This is a F-1 Dataset that comes from the Ergast API. It entails information about different F1-drivers, their standings, their races, their pit-stops duration etc.
Keep all your files in one folder.

## Task 1
#### Problem Statement
Write the HIVE queries for the following questions.



1. Find the number of races held in year 2009 as `num_races`.
2. Find the top 5 drivers(`forename` and `surname`) with most wins in 2008.
3. Get the average lap time as `avg_laptime` for each race in milliseconds.
4. Find the constructor as `con_name` who had the most 1-2 (first and second position) finishes.
5. Get the top 3 drivers with the best average qualifying position across all races.







:::info
IMPORTANT
Try completing the lab in one HIVE session as the database history doesn't get stored across sessions. You'll have to stop hadoop, run start-hive and load dataset, create commands again. 
:::


<br/>
    
## Task 2
#### Problem Statement
Retrieve the forenames and surnames of  F1 drivers grouped by race ID, with raceId ranging between 841 and 1041. Include the driver's qualifying position if they have qualified and the total time of the driver's pit stops, regardless of the lap. Rename respective columns renamed to ```raceId, forename, lastname, position, pit_stop_duration``` are to be retreived.

To ensure that your query is optimised, you must take into account:
Partitioning (Static or Dynamic?)
On what basis which columns should be partitioned?
Is Indexing required?
How does Pruning improves efficiency?
Type of Joins and order.


## Task Deliverables

Paste your queries for both tasks separated by a newline in a file called ```srn_output.txt``` and submit them. We will be running your queries and checking them against the correct output.

## Useful Links
For lab context and purpose, read https://www.databricks.com/glossary/apache-hive

1. https://sparkbyexamples.com/apache-hive/hive-create-partition-table-explained/
2. https://analyticshut.com/static-vs-dynamic-partitioning-in-hive/
3. https://docs.oracle.com/en/database/oracle/oracle-database/21/vldbg/partition-pruning.html#GUID-E677C85E-C5E3-4927-B3DF-684007A7B05D
4. https://stackoverflow.com/questions/50792914/hive-explain-plan-understanding
5. https://stackoverflow.com/questions/52539843/how-to-load-a-file-to-hive-with-columns-name-mentioned-in-the-file?noredirect=1&lq=1
6. https://www.geeksforgeeks.org/overview-of-dynamic-partition-in-hive/
7. https://docs.cloudera.com/cdw-runtime/cloud/impala-reference/topics/impala-partition-pruning.html



## Tutorial to HIVE

### Creating a database
```
CREATE DATABASE [IF NOT EXISTS] <database-name>;
```
IF NOT EXISTS is an optional clause, which notifies the user that a database with the same name already exists.

Let's call our database demo, so we run it as follows
```
CREATE DATABASE demo;
```

To check if the database is created, run the following command and it should show up in the result.
```
SHOW DATABASES;
```
To use a particular database, run this command
```
USE <database-name>;
```

### Creating a table
```
CREATE TABLE [IF NOT EXISTS] [database_name.]<table-name> (
<column-name>    <data-type>,
<column-name>    <data-type> COMMENT 'Your Comment',
<column-name>    <data-type>,
.
.
.
<column-name>    <data-type>
)
COMMENT 'Add if you want'
LOCATION 'Location On HDFS'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';
```
Let's call our table ratings. 

```
CREATE TABLE [IF NOT EXISTS] demo.ratings(
userID INT,
movieID INT COMMENT 'This is a demo',
rating INT,
recordedTime INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';
```

:::info
IMPORTANT
Since the default field/column terminator in Hive is ^, and we're loading a csv (comma-separated values) file we explicitly mention the custom terminator by using ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' while creating the table.
:::

### Deleting a table
```
DROP TABLE [IF EXISTS] table_name;
```
If we want to drop the ratings table
```
DROP TABLE IF EXISTS ratings;
```
### Sample Dataset - MovieLens
It has 25 million ratings and one million tag applications applied to 62,000 movies by 162,000 users. Includes tag genome data with 15 million relevance scores across 1,129 tags. 

:::info

NOTE : Only the sample templates are provided here, the acutal tables contain more data.
:::


It includes the following tables-

#### Ratings
```\
userID - INT 
movieID - INT
rating - float ranging from 0 to 5
timestamp - INT
```

|userID |movieID|rating|timestamp|
|-----|--------|--------|-------|
|1|296  |5|1147880044|
|3009  |310      |4|1466307865|

#### Movies
```\
movieID - INT
title - str
genres - str 
```
|movieId |title|genres|
|-----|--------|--------|
1|	Toy Story (1995)| Adventure\|Animation\|Children\|Comedy\|Fantasy


#### Tags
```\
userID - INT 
movieID - INT
tag - str
timestamp - INT
```
|userId|movieId|tag|timestamp|
|-----|--------|--------|--------|
|3|260|classic|1439472355|


#### Genome-tags
```\
tagID - INT
tag - str
```
|tagId|tag|
|-----|--------|
|20|action packed|
|54|amazing cinematography|

### Loading a dataset into HIVE
```
LOAD DATA [LOCAL] INPATH '<The table data location>' [OVERWRITE] INTO TABLE <table_name>;
```
For instance, if we want to load the ratings dataset, we would run the following command,
```
LOAD DATA LOCAL INPATH 'ratings.csv' OVERWRITE INTO TABLE demo.ratings;
```



		


### Sample HIVE queries
1. Find the total number of ratings given by all users.
```
SELECT COUNT(*) FROM ratings;
```
2. Get the list of unique movie titles.
```
SELECT DISTINCT title FROM movies;
```
3. Join Ratings and Movies tables based on common movieID.
```
SELECT Ratings.userID, Ratings.movieID, Ratings.rating, Movies.title, Movies.genres
FROM Ratings
JOIN Movies ON Ratings.movieID = Movies.movieID;

```
4. Find userID, movieID and rating where rating is more than or equal to 4.
```
SELECT userID, movieID, rating
FROM Ratings
WHERE rating >= 4;

```
5. To combine distinct ratings and tags.
```
SELECT userID, movieID, rating
FROM Ratings
UNION
SELECT userID, movieID, NULL AS rating
FROM Tags;
```
6. Find common movies between Ratings and Tags.
```
SELECT movieID
FROM Ratings
INTERSECT
SELECT movieID
FROM Tags;
```
7. Find movies in Ratings but not in Tags.
```
SELECT movieID
FROM Ratings
EXCEPT
SELECT movieID
FROM Tags;
```
8. Get a list of users who rated movies along with the movie details.
```
SELECT Ratings.userID, Ratings.movieID, Ratings.rating, Movies.title, Movies.genres
FROM Ratings
INNER JOIN Movies ON Ratings.movieID = Movies.movieID;
```
9. Retrieve all movies along with their ratings, and show null for movies without ratings.
```
SELECT Movies.movieID, Movies.title, Ratings.rating
FROM Movies
LEFT OUTER JOIN Ratings ON Movies.movieID = Ratings.movieID;
```
10. Display all ratings along with movie details, showing null for ratings without movies.
```
SELECT Ratings.userID, Ratings.movieID, Ratings.rating, Movies.title, Movies.genres
FROM Ratings
RIGHT OUTER JOIN Movies ON Ratings.movieID = Movies.movieID;
```
11. Combine all movies and their ratings, showing null where there is no match.
```
SELECT COALESCE(Ratings.userID, Tags.userID) AS userID,
       COALESCE(Ratings.movieID, Tags.movieID) AS movieID,
       Ratings.rating, Tags.tag
FROM Ratings
FULL OUTER JOIN Tags ON Ratings.movieID = Tags.movieID;
```
12. Sort Movies by Title in Ascending Order.
```
SELECT *
FROM Movies
ORDER BY title;
```
13. Sorting Tags by UserID and Timestamp.
```
SELECT *
FROM Tags
ORDER BY userID, timestamp;
```
14. Count of Ratings for Each Movie.
```
SELECT movieID, COUNT(*) as rating_count
FROM Ratings
GROUP BY movieID;
```
15. Average Rating for Each Movie.
```
SELECT movieID, AVG(rating) as avg_rating
FROM Ratings
GROUP BY movieID;
```
16. Maximum Timestamp for Each Tag.
```
SELECT userID, MAX(timestamp) as max_timestamp
FROM Tags
GROUP BY userID;
```
17. Maximum and Minimum Ratings.
```
SELECT MAX(rating) as max_rating, MIN(rating) as min_rating
FROM Ratings;
```
18. Find the top 5 movies with the highest average rating
```
SELECT movieId, AVG(rating) as avg_rating
FROM ratings 
GROUP BY movieId
ORDER BY avg_rating DESC
LIMIT 5;
```
19. Find the top 3 genres that have the highest average rating for movies
```
SELECT m.genres, AVG(r.rating) as avg_rating
FROM ratings r
JOIN movies m ON r.movieId = m.movieId  
GROUP BY m.genres
ORDER BY avg_rating DESC
LIMIT 3;
```
20. Selecting movies released after 2000 with the genres 'Action' or 'Adventure'.
```
SELECT m.movieID, m.title, m.genres, r.rating
FROM Movies m
JOIN Ratings r ON m.movieID = r.movieID
WHERE m.title IS NOT NULL AND SUBSTRING(m.title, LENGTH(m.title)-4, 4) > '2000'
  AND (m.genres LIKE '%Action%' OR m.genres LIKE '%Adventure%');
```
21. Identifying users who tagged movies with 'classic' and gave ratings above 4.
```
SELECT t.userID, t.tag, r.rating
FROM Tags t
JOIN Ratings r ON t.movieID = r.movieID
WHERE t.tag = 'classic' AND r.rating > 4;
```
22. Find all the movies tagged as 'funny' in the genome database along with the user tags, genome tags and ratings given for those funny movies.
```
SELECT t.userId, t.movieId, t.tag, g.tag as genome_tag, r.rating
FROM tags t 
JOIN genome_scores g ON t.movieId = g.movieId
JOIN ratings r ON r.movieId = t.movieId AND r.userId = t.userId
WHERE g.tagId IN (SELECT tagId FROM genome_tags WHERE tag LIKE '%funny%')
```

### Background Information

To understand how and when Hive queries are converted to MapReduce jobs, let’s revisit what Map and Reduce means:

Map - Map jobs filter and organise the data in sorted order.
Reduce - Reduce jobs apply summary/aggregate operations across the data.

Now, depending on what the Hive queries intend to do, there may be any number of Map and Reduce jobs triggered in the back end.

```
describe formatted employees; 
show tables in emp_db; 
```

These are metadata request queries. In these cases, Hive performs a lookup on the metadata server, which is itself a SQL database (MySQL in most production scenarios).

```
select * from employees; 
```
This is an example of HDFS get request. In this case, neither map nor reduce jobs are triggered, since Hive needs to get the data, as is, without applying any computations whatsoever. So Hive executes an equivalent of the dfs fs -get command to get the results.

```
select id, name from employees; 
select * from employees where salary > 3000; 
select count(*) from employees; 
```

These queries, when executed in Hive, will always trigger some combination of Map and/or Reduce jobs, based on the nature of computation involved. The first 2 queries involve filtering the data (#1 is column wise filter, #2 is row wise filter), hence these will trigger Map only jobs without any Reduce jobs. The 3rd query has only aggregate operation to be applied, which can be done by a Reduce only job. Since no filter or transformation operations are involved, Map job will not be triggered.


```
select dept, count(*) from employees group by dept; 
```

This will trigger 1 Map and 1 Reduce job. Map job will do the counting of the employees per department, by creating (key, value) pairs for each department where the key is the department name and the value is 1. E.g. - (SALES, 1), (HR, 1), (SALES, 1), (ENGINEERING, 1), (ENGINEERING, 1), etc. The Reduce job will aggregate all of the (key, value) pairs based on the keys to return the final result i.e. (SALES, 2), (HR, 1), (ENGINEERING, 2), etc.


















