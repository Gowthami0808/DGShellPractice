#!/bin/bash
access=$(id -u)
Red="\e[31m"
green="\e[32m"
normal="\e[0m"
Date=$(date +"%Y-%m-%d %H:%M:%S")
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$Date.log

if [ $access -eq 0 ]
then  
   yum install mysql -y &>>$LOGFILE
else
# if you give exit 1 before you do echo then it wont even print error it will exit even before that.
   echo -e "$Red ERROR: You should be a root user $normal"
fi

if [ $? -ne 0 ]
then 
   echo -e "$Red ERROR: Installation of mysql failed"
fi
 yum install postfix -y &>>$LOGFILE
if [ $? -ne 0 ]
then 
  echo -e "$Red Installation of postfix is an error $normal"
else 
echo -e "$Red Installation of Postfix is success $normal"
fi
validate()
{
   if [ $1 -ne 0 ]
   then
   echo -e "$Red ERROR with installations of $2 $normal" &>>$LOGFILE
   else
   echo -e "$green Installations for $2 are success $normal" &>>$LOGFILE
   fi
}
validate $? "Mysql"
validate $? "postfix"