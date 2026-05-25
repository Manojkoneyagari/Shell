#!/bin/bash

USER=$(whoami)

if [ $USER != "root" ]; then
echo " Please run the script with root user"
else
echo "This script runned by root user and date is $(date)"
fi