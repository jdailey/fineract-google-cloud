* Commands to be issued in Google Cloud shell 
* this is empheral so, each session starts by cloning this repo 
* and running the script $ sh setup.sh

echo "Script Running, which java: " 
java -version 

# show versions of node and npm running
echo "which versions of node and npm?" 
node -v
npm -v 

# other config stuff here 
git config color.ui true 


# Make sure we have the latest apt-get links and libaries 
# sudo apt-get update 

# Install mySql 
echo "MYSQL INSTALL HERE>>>>>>>>"
sudo apt-get -y install mysql-server 

# Install Cassandra 
#echo "CASSANDRA INSTALL HERE>>>>>>>>>" 
#sudo apt-get install cassandra , has no targets on the GCP version of Debian 
# http://cassandra.apache.org/download/ 

echo "deb http://www.apache.org/dist/cassandra/debian 311x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -
sudo apt-get update 

# so, now we have the target for cassandra and can install 
sudo apt-get install cassandra

# start the cassandra service 
sudo service cassandra start




