#! /bin/bash
sudo apt-get -y update 
sudo curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash
sudo apt-get install -y nodejs
echo DATABASE="${db}" >> /etc/environment
echo HOST="${host}" >> /etc/environment
echo PASSWORD="${password}" >> /etc/environment
echo USER="${user}" >> /etc/environment
source /etc/environment
sudo mkdir /home/ubuntu/final-project-api
sudo git clone "https://github.com/Johng117/final-project-api.git" "/home/ubuntu/final-project-api"
sudo chmod 777 /home/ubuntu/final-project-api/package-lock.json
sudo chmod 777 /home/ubuntu/final-project-api
cd /home/ubuntu/final-project-api
sudo npm install
npm install forever -g
# sudo mkdir /home/ubuntu/forever
# sudo chmod 777 /home/ubuntu/forever
# FOREVER_ROOT=/home/ubuntu/forever 
# forever start /home/ubuntu/final-project-api/index.js

# sudo chmod 400 package-lock.json
# cd ~
# sudo chmod 400 final-project-api