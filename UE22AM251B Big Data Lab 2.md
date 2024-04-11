# UE22AM251B Big Data Lab 2
Parallel Computations through Map-Reduce

## Assignment Objectives and Outcomes

MapReduce is a programming model and a parallel processing framework for distributed computing that was originally developed by Google. It is designed to process and generate large datasets that can be distributed across clusters of computers in a highly scalable and fault-tolerant manner.

The objective of this lab is to understand and apply MapReduce for basic genomic data analysis tasks.

## Software/Languages to be used
1. Python ```3.10.x```
2. Hadoop ```3.3.6```


## Environment Setup

1. Set up a Hadoop environment, if it's already not setup and ready to go from Lab 1.
 
2. You will be working with the condensed and clean version of this [NCBI Dataset](https://www.ncbi.nlm.nih.gov/datasets/docs/v2/reference-docs/data-packages/genome/) available to download from this [link](https://drive.google.com/file/d/15UsuKaN0t4HqVXIsSMNDTVcaOVbRphsN/view?usp=sharing).

    The above database (GDrive link) shall be used for all the three tasks below.


> .fna extension stands for the FASTA format DNA and protein sequence alignment file that stores DNA information that can be used by molecular biology software.


## Tasks Background


MapReduce can be used in genomics data analysis to efficiently process and analyze large genomic datasets. Genomics involves studying DNA sequences, gene expressions, and other biological data, and the sheer volume and complexity of this data make it well-suited for a parallel processing framework like MapReduce.

Genomics data analysis is done through the following steps:
1) Data Preparation
2) **Mapping**
3) Variant Calling
4) Quality Control
5) Functional Annotation
6) Population Genetics
7) Pathway Analysis
8) Data Storage and Management
9) Parallel Processing

You will work on the **Mapping** Phase and learn how to perform basic DNA sequence analysis tasks using the MapReduce framework.

## Task Specifications

1. **Finding Motifs**
    * Write a MapReduce program to identify the specific sequence motif '**ATGTG'** in the genomic data.
 
    
        > Motifs are short, recurring patterns of nucleotides that have biological significance.

        ### Expected output
    
        ```
        ATGTG   56
        ```
        
2. **Finding GC Content**
    * Write a MapReduce program to calculate the GC content (the percentage of G and C nucleotides) in the genomic data.
    * *Assumptions:*
        * Take the threshold for GC-rich regions to be classified so to be **0.7**
        * Take the window size for the sequence to be **10**

        ### Expected output
        ```        
        1-10    0.9
        10-19   1.0
        11-20   1.0
        12-21   1.0
        13-22   1.0
        14-23   0.9
        15-24   1.0
        16-25   1.0
        17-26   1.0
        18-27   1.0
        19-28   1.0
        2-11    1.0
        20-29   0.9
        21-30   0.9
        22-31   0.9
        23-32   1.0
        24-33   1.0
        25-34   1.0
        26-35   1.0
        27-36   1.0
        28-37   1.0
        29-38   1.0
        3-12    1.0
        30-39   0.9
        31-40   0.9
        32-41   0.9
        33-42   0.9
        34-43   0.9
        35-44   0.9
        36-45   0.9
        37-46   0.9
        38-47   0.9
        39-48   0.9
        4-13    1.0
        40-49   0.9
        41-50   0.9
        42-51   1.0
        43-52   1.0
        44-53   0.9
        45-54   0.9
        46-55   0.9
        47-56   0.9
        48-57   0.9
        49-58   0.9
        5-14    1.0
        50-59   1.0
        51-60   1.0
        52-61   1.0
        53-62   1.0
        54-63   1.0
        55-64   0.9
        56-65   0.9
        57-66   0.9
        58-67   0.9
        59-68   0.9
        6-15    1.0
        60-69   0.9
        61-70   0.9
        62-71   0.9
        63-72   0.9
        64-73   0.9
        65-74   1.0
        66-75   1.0
        67-76   0.9
        68-77   0.9
        69-78   0.9
        7-16    1.0
        70-79   0.9
        71-80   0.9
        8-17    1.0
        9-18    1.0
        ```


3. **Nucleotide Distribution by Position**
    * Write a MapReduce program that calculates the distribution of each nucleotide at different positions in the genomic sequence.
    * *Assumptions:*
        * Calculate the distribution for the first **10** positions only
    
        ### Expected output
        
        ```
        10_A    160
        10_C    153
        10_G    121
        10_N    125
        10_T    167
        10_a    88
        10_c    54
        10_g    54
        10_t    77
        1_A     180
        1_C     125
        1_G     122
        1_N     125
        1_T     174
        1_a     87
        1_c     60
        1_g     48
        1_t     78
        2_A     176
        2_C     135
        2_G     146
        2_N     125
        2_T     145
        2_a     103
        2_c     49
        2_g     45
        2_t     75
        3_A     174
        3_C     142
        3_G     141
        3_N     125
        3_T     142
        3_a     90
        3_c     47
        3_g     49
        3_t     89
        4_A     169
        4_C     126
        4_G     130
        4_N     125
        4_T     173
        4_a     87
        4_c     55
        4_g     55
        4_t     79
        5_A     140
        5_C     147
        5_G     147
        5_N     125
        5_T     170
        5_a     91
        5_c     59
        5_g     32
        5_t     88
        6_A     161
        6_C     153
        6_G     122
        6_N     125
        6_T     168
        6_a     87
        6_c     68
        6_g     40
        6_t     75
        7_A     149
        7_C     134
        7_G     141
        7_N     125
        7_T     178
        7_a     94
        7_c     55
        7_g     34
        7_t     89
        8_A     141
        8_C     160
        8_G     145
        8_N     125
        8_T     152
        8_a     96
        8_c     59
        8_g     36
        8_t     85
        9_A     157
        9_C     162
        9_G     107
        9_N     125
        9_T     169
        9_a     92
        9_c     42
        9_g     50
        9_t     95
        ```


 
## Task Deliverables

1. Load the data into HDFS.

3. Run your code on the dataset until you get the right answer


3. After completing Tasks 1,2 and 3, you shall name the 6 pairs of mapper-reducer python files with each pair pertaining to 1 task with the following naming conventions - 

    ```
    SRN_mapper1.py
    SRN_reducer1.py
    SRN_mapper2.py
    SRN_reducer2.py
    SRN_mapper3.py
    SRN_reducer3.py

    ```

4. Please save all these files in a folder with the following naming convention- 

    ```
    Section_SRN_Lab2

    ```

Zip this folder and submit it in the form link mentioned in your assessment announcement.
## Submission Guidelines
You will need to make the following changes to your ```mapper.py``` and `reducer.py` scripts to run them on the portal.

1. Include the following shebang on the first line of your code
```#!/usr/bin/env python3```

2. Convert your files to executables
```chmod +x mapper*.py reducer*.py```

3. Convert line breaks in DOS format to Unix format (this is necessary if you are coding on Windows - your code will not run on our portal otherwise)
```dos2unix mapper*.py reducer*.py```

## Running the MapReduce Job without Hadoop

A MapReduce job can also be run without Hadoop. Although slower, this utility helps you debug faster and helps you isolate Hadoop errors from code errors.

```
cat path_to_dataset | python3 mapper.py
[command line arguments] | sort -k 1,1 |
python3 reducer.py [command line arguments] > output.txt
```

## HDFS Operations

The HDFS supports all file operations and is greatly similar to the file system commands available
on Linux.

You can access HDFS on command line using `hdfs dfs` and use the `-` prefix before the file
system command to execute general Linux file system commands.

### Loading a file into HDFS

A file can be loaded into HDFS using the following command.

`hdfs dfs -put path_to_file /hdfs_directory_path`

### Listing files on HDFS

Files can be listed on HDFS using

```hdfs dfs -ls /hdfs_directory_path```

Similarly, HDFS also supports `-mkdir` ,` -rm `and more.

### Displaying contents of files on HDFS

File contents can be displayed using

`hdfs dfs -ls /hdfs_directory_path`

## Running a MapReduce Job

A MapReduce job can be run using the following command

```
hadoop jar path-to-streaming-jar-file \
-input path_to_input_file_on_hdfs \
-output path_to_output_folder_on_hdfs \
-mapper absolute_path_to_mapper.py command_line_arguments \
-reducer absolute_path_to_reducer.py command_line_arguments
```

```path-to-streaming-jar-file``` is ```$HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-3.3.6.jar``` if you have followed the previous lab's tutorial on installing Hadoop.