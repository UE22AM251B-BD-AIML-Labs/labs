## Sqoop Installation Guide
Prerequisite - Hive and Hadoop should be installed.

First provide the necessary permissions in the home directory (`cd`). Make sure you run these before installation.

```
chmod +x *.sh #Giving executable permissions to all shell scripts
dos2unix *.sh #Important for converting scripts from CRLF to LF
``` 

Download [install-sqoop.sh](https://drive.google.com/file/d/1I7QRRqpZdyH6hOjoMZAsoS4G1SLNNDVc/view?usp=sharing) script.


To install sqoop run the following command:
```source install-sqoop.sh```

:::info
If you're using a zshrc terminal, replace .bashrc with .zshrc in the installation script.
:::

