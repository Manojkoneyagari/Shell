#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]; then
echo " Please run the script with root user"
else
echo "This script runned by root user and date is $(date)"
fi