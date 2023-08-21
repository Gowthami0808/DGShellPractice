#!/bin/bash
access=$(id -u)
if [ $access -eq 0 ]
then  
   yum install git -y
else
# if you give exit 1 before you do echo then it wont even print error it will exit even before that.
   echo "ERROR: You should be a root user"
fi