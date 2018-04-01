#!/bin/bash
sudo apt-get install ntp
sudo service ntp start
sed -i 's/*.ubuntu.pool.ntp.org/ua.pool.ntp.org/g' /etc/ntp.conf
sudo service ntp restart
* * * * * /home/ihor/scripts/ntp_deploy.sh

