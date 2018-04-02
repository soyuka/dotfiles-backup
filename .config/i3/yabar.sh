#!/bin/bash

pfind() {
  ps -e | grep $@ | grep -v grep | awk '{print $1}'
}

killed=0

for pid in $(pfind yabar)
do
  kill $pid
  killed=1
done

if [ $killed == 0 ]
then
        yabar &
fi
