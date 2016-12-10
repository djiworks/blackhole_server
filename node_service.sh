#!/bin/bash

# prepare node site
sudo mkdir /var/www/blackhole.org
sudo mv index.js /var/www/blackhole.org/
cd /var/www/blackhole.org/
sudo npm install

# let node run on lower port number (80, 443)
sudo apt-get install libcap2-bin
sudo setcap cap_net_bind_service=+ep /usr/local/bin/node

# make it as service
sudo npm install -g pm2
pm2 start index.js --name blackhole
pm2 startup
# sudo su -c "env PATH=$PATH:/usr/local/bin pm2 startup linux -u pi --hp /home/pi"