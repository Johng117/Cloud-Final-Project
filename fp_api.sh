#! /bin/bash
sudo apt-get -y update 
sudo curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash
sudo apt-get install -y nodejs
sudo mkdir /home/ubuntu/final-project-api
sudo git clone "https://github.com/Johng117/final-project-api.git" "/home/ubuntu/final-project-api"
cd: final-project-api
sudo npm install
