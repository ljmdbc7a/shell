#!/bin/bash
#
#
# author @liujiaming
# date   @20170117
# github @https://github.com/ljmdbc7a/shell-scripts
#

# 文件
if [ $# -eq 0 ]; then
	echo Usage: $0 data_file
	exit 1
fi
date_file=$1

# db
host=xx.x.xx.xxx
port=xx
user=username
password=password
datebase=dbname

# check data_file
row=`cat $data_file | wc -l | awk '{print $1}'`
if [ $row -le 0 ];then
    echo "data file is empty."
    exit 1
fi

# 分批插入数据库
split -l 500 -a 5 $data_file data_file_split

for file in `ls data_file_split*`
do
    echo $file
	sql="insert into $table_name ($column_name) values"
	while read line
	do
		column_value=`echo $line | awk '{print $1}'`
		sql=$sql" ('$column_value'),"
	done < $file

	len=${#sql}
	sql=${sql:0:(len-1)}";"
	echo $sql

	# 执行sql
	mysql -h$host -P$port -u$user -p$password -D$datebase --default-character-set=utf8 -e "$sql"

	sleep 1s
done
