#!/bin/bash
access=$(id -u)
if [ $access -eq 0 ]
then  
   yum install git -y
else
   echo "ERROR: You should be a root user"
fi