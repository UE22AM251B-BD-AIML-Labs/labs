return_to_pwd=$(pwd)
cd
if [ -d "sqoop" ]; then
    echo "Deleting previous Sqoop installation"
    sudo rm -rf sqoop
fi

mkdir sqoop
cd sqoop

echo "Downloading Sqoop"
wget https://archive.apache.org/dist/sqoop/1.4.7/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz


echo "Unzipping the downloaded package"
tar -xvzf sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz
mv sqoop-1.4.7.bin__hadoop-2.6.0 sqoop

echo "Editing bashrc file"
cd
#export SQOOP_HOME="/home/\$USER/sqoop/sqoop-1.4.7.bin__hadoop-2.6.0"
#export PATH=$PATH:$SQOOP_HOME/bin
echo "export SQOOP_HOME=\$HOME/sqoop/sqoop" >> ~/.bashrc
source ~/.bashrc


echo "Setting up sqoop-env.sh"
cd $SQOOP_HOME/conf
touch sqoop-env.sh
echo "export HADOOP_COMMON_HOME=\$HADOOP_COMMON_HOME" >> sqoop-env.sh
echo "export HADOOP_MAPRED_HOME=\$HADOOP_MAPRED_HOME"  >> sqoop-env.sh
echo "export HIVE_HOME=\$HIVE_HOME"  >> sqoop-env.sh

cd
echo 'SQOOP_HOME'
echo $SQOOP_HOME
echo "Do you see something like /home/\$USER/sqoop/above?[y/n]"
read answer
if [[ $answer == "y" || $answer == "yes" ]]; then
    cd	
    echo "export PATH=\$PATH:\$SQOOP_HOME/bin" >> ~/.bashrc
    source ~/.bashrc
    echo "sqoop version"
    echo $(sqoop version)
    echo "You're good to go. Ignore warnings to set up HBase and Zookeeper env vars. You can run sqoop version to check for the sqoop version installed."

else
    echo "Run source ~/.bashrc and make sure SQOOP_HOME is set."
    echo "After SQOOP_HOME is set, add the following line to bashrc as well: export PATH=\$PATH:\$SQOOP_HOME/bin:$return_to_pwd. Once done, run source ~/.bashrc"
    echo "Finally, run sqoop version to check for the sqoop version installed."
fi

cd $return_to_pwd
echo "Finished sqoop installation."
