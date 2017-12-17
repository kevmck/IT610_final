#!/bin/bash

#SQL Backup Script for Bash

#Create name structure
PREPEND='backup_'
APPEND="$(date "+%F-%T")"

#Command for creating the dump file
mysqldump -u root -pclloyd20 it610 > /home/ubuntu/it610_final/sql_srv/backups/$PREPEND$APPEND.sql

#Count number of backups that currently exist on the system
FILECOUNT="$(find /home/ubuntu/it610_final/sql_srv/backups/ -maxdepth 1 -type f | wc -l)"

#If there are 7 or more files, delete the oldest
RFN="$(ls ./backups/*.sql | sort -V | head -n1)"
if [ $FILECOUNT -gt 7 ]; then
	rm $RFN
fi
