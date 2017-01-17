#!/bin/bash

#
# kill monitor process
#

pid_file="./data/pid.txt"
while read line
do
	echo $line | xargs kill -9
done < $pid_file
