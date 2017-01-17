#!/bin/sh

#
# netstat monitor
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
	netstat -s
	netstat -i
	sleep $delay
done
