#!/bin/sh

#
# memory monitor
#

usage(){
	echo "Usage: "$0" delay"
}
if [ $# -ne 1 ]; then
	usage
	exit 1
fi

delay=$1
while [ "1" == "1" ]
do
	echo "------------- "`date '+%Y-%m-%d %H:%M:%S'`" --------------"
	cat /proc/meminfo
	cat /proc/vmstat
	cat /proc/buddyinfo
	sleep $delay
done
