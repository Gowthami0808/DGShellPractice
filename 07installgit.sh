#!/bin/bash
access=$(id -u)
Date=$(date +"%Y-%m-%d %H:%M:%S")
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$Date.log

if [ $access -eq 0 ]
then  
   yum install mysql -y &>>$LOGFILE
else
# if you give exit 1 before you do echo then it wont even print error it will exit even before that.
   echo "ERROR: You should be a root user"
fi

if [ $? -ne 0 ]
then 
   echo "ERROR: Installation of mysql failed"
fi
 yum install postfix -y &>>$LOGFILE
if [ $? -ne 0 ]
then 
  echo "Installation of postfix is an error"
else 
echo "Installation of Postfix is success"
fi
validate()
{
   if [ $1 -ne 0 ]
   then
   echo "ERROR with installations of $2" &>>$LOGFILE
   else
   echo "Installations for $2 are success" &>>$LOGFILE
   fi
}
validate $? "Mysql"
validate $? "postfix"