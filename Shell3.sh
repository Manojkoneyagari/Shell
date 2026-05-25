#!/bin/bash

USER=$(id -u)
if [ $USER -ne 0 ]; then
echo " Please run the script with root user"
exit 1
fi




Validatepackage() {
if [ $1 -eq 0 ]; then
echo "$2 package installation is successfully"
echo " Validating $2 service status now"
Validateservice $2
else
echo "$2 Package installation is failed"
exit 1
fi
}

Validateservice() {
systemctl status $1
if [ $? -eq 0 ]; then
echo " $1 service has started "
else
echo " $1 service is not started, so manually starting and enabling the service "
fi
}


#Checking MYSQL package insatlled or not

for package in $@
do
dpkg -l | grep $package
if [ $? -eq 0 ]; then
echo " $package already installed"
exit 0
else
echo " $package is not installed, Hence we are installing now"
apt install $package -y
Validatepackage $? $package
fi
done



