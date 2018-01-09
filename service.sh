#!/bin/bash

USER='<user>'
VPATH='<project>'

HOME=/home/$USER/judge
VENV=/home/$USER/env/$VPATH
source $VENV/bin/activate

LOGFILE=$HOME/service.log
touch $LOGFILE
chown $USER:$USER $LOGFILE

CUR_DATE=`date`
echo "==================================" >> $LOGFILE
echo "Start on [ $CUR_DATE ]" >> $LOGFILE

# https://askubuntu.com/questions/420981/how-do-i-save-terminal-output-to-a-file
dmoj -c $HOME/config.yml 0.0.0.0 &>> $LOGFILE &

