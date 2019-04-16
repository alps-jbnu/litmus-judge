#!/bin/bash
#usage: nohup ./service.sh &

USER='<username>'

HOME=/home/$USER/judge
VENV=/home/$USER/env
source $VENV/bin/activate

for f in *.yml
do
    NAME=${f%%.*}
    EXT=${f##*.}
    LOG="$NAME.log"
    echo "Run judge($HOME/$f)"
    dmoj -c $HOME/$f 0.0.0.0 >> $LOG &
done

