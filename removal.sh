#!/bin/bash


if [ $1 -eq "mysql" ]; then
systemctl stop mysql
apt purge mysql-server mysql-client mysql-common mysql-server-core-* mysql-client-core-* -y
apt autoremove -y
sudo rm -rf /etc/mysql
sudo rm -rf /var/lib/mysql
sudo rm -rf /var/log/mysql
dpkg -l | grep mysql
echo "status of mysql package uninstallation $?"
fi