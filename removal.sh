#!/bin/bash


if [ $1 = "mysql" ]; then
systemctl stop mysql
apt purge mysql-server mysql-client mysql-common mysql-server-core-* mysql-client-core-* -y
apt autoremove -y
sudo rm -rf /etc/mysql
sudo rm -rf /var/lib/mysql
sudo rm -rf /var/log/mysql
dpkg -l | grep mysql
echo "status of mysql package uninstallation $?"

elif [ $1 = "nginx" ]; then
sudo systemctl stop nginx
sudo apt purge nginx nginx-common nginx-core -y
sudo apt autoremove -y
sudo rm -rf /etc/nginx
sudo rm -rf /var/log/nginx
sudo rm -rf /var/www/html
dpkg -l | grep nginx
echo "status of nginx package uninstallation $?"

else
echo " give proper argument in command line"
fi