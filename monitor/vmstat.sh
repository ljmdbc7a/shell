#!/bin/sh

#
# vmstat monitor
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
	vmstat $delay 10
done
