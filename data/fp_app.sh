#! /bin/bash
sudo apt-get -y update 
sudo curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash
sudo apt-get install -y nodejs
sudo npm install -g forever
sudo apt install -y nginx
echo REACT_APP_API="${api-ip}" >> /etc/environment
source /etc/environment
mkdir /home/ubuntu/final-project-app
sudo chown -R ubuntu /home/ubuntu/final-project-app
sudo git clone "https://github.com/Johng117/final-project-app.git" "/home/ubuntu/final-project-app"
sudo chmod 777 /home/ubuntu/final-project-app/package-lock.json
sudo chmod 777 /home/ubuntu/final-project-app
cd /home/ubuntu/final-project-app
npm install
sudo chmod 777 /home/ubuntu/final-project-app/node_modules
sudo chmod 777 /home/ubuntu/final-project-app/node_modules/.cache/.eslintcache


