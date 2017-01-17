#!/bin/sh

#
# Start monitor
#

date=`date "+%Y-%m-%d"`
data=./data
mkdir -p $data
rm -f $data/pid.txt

# set delay
if [ $# -eq 1 ]; then
	delay=$1
else
	delay=1
fi

# vmstat top
nohup sh vmstat.sh $delay >> $data/vmstat.log.$date &
echo $! >> $data/pid.txt

nohup top -b -d $delay >> $data/top.log.$date &
echo $! >> $data/pid.txt

# cpu
nohup mpstat -P ALL $delay >> $data/mpstat.log.$date &
echo $! >> $data/pid.txt

# mem
nohup sh meminfo.sh $delay >> $data/meminfo.log.$date &
echo $! >> $data/pid.txt

# io
nohup iostat -x -t $delay >> $data/iostat.log.$date &
echo $! >> $data/pid.txt

# network
nohup sh netstat.sh $delay >> $data/netstat.log.$date &
echo $! >> $data/pid.txt

nohup sar -n -DEV $delay >> $data/sar_dev.log.$date &
echo $! >> $data/pid.txt

nohup sar -n -EDEV $delay >> $data/sar_edev.log.$date &
echo $! >> $data/pid.txt

nohup sar -n -ETCP $delay >> $data/sar_etcp.log.$date &
echo $! >> $data/pid.txt
