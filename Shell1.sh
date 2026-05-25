#!/bin/bash

USER=$(whoami)

if [ $USER != "root" ]; then
echo " Please run the script with root user"
exit 1
fi