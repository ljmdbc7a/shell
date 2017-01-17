#!/bin/sh

#
# check os env
# author @liujiaming
# date   @20170117
# github @https://github.com/ljmdbc7a/shell-scripts
#

cat /proc/version
sysctl -a
ulimit -a
DISK=`df -k | sort -n -r -k 2 | awk -F/ 'NR==1 {gsub(/[0-9].*/,"",$3); print $3}'`
cat /sys/block/$DISK/queue/scheduler
