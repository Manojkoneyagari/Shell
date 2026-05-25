#!/bin/bash

Logfile=/var/log/$0.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USER=$(id -u)
if [ $USER -ne 0 ]; then
echo " Please run the script with root user"
exit 1
fi




Validatepackage() {
if [ $1 -eq 0 ]; then
echo -e "$(date +%Y/%m/%d-%H:%M) $2 ${G} package installation is success ${N}"
echo -e " ${Y} Validating $2 service status now ${N}"
Validateservice $2
else
echo -e "${R} $2 Package installation is failed ${N}"
exit 1
fi
}

Validateservice() {
    Service=$1
    if [ $1 = "mysql-server" ]; then
        Service="mysql"
    fi
        systemctl status $Service
      if [ $? -eq 0 ]; then
      echo -e "${G} $Service service has started ${N}"
      else
      echo -e "${R} $Service service is not started, so manually starting and enabling the service ${N}"
      fi
}


#Checking MYSQL package insatlled or not

for package in $@
do
dpkg -l | grep $package
if [ $? -eq 0 ]; then
echo "$(date +%Y/%m/%d-%H:%M)- $package already ${G} installed ${N}"
exit 0
else
echo "$(date +%Y/%m/%d-%H:%M) $package is not installed, Hence we are ${Y} installing now ${N}" | tee -a Logfile
apt install $package -y &>> Logfile
Validatepackage $? $package
fi
done



