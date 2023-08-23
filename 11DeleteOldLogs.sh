#!/bin/bash
APP_LOGS_DIR="/home/centos/app-logs"
DELETED_FILES_STORAGE="/home/centos/shellscript-logs"
DATE=$(date +%F)
SCRIPT_FILE=$0
LOG_DELETEED_FILES=$DELETED_FILES_STORAGE/$SCRIPT_FILE$DATE.log


OLD_LOG_FILES=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +14)

while read line
do
   echo "Deleting file $line" &>>$LOG_DELETEED_FILES
   rm -rf $line
done <<<$OLD_LOG_FILES