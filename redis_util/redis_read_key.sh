#!/bin/bash
# Project: def
# File: redis_read_key.sh
# Author: AlexYu-beta
# PERSONAL redis operation script

if [ $# = 0 ];
then
	echo 'Err: Missing parameters.'
	echo 'From redis_read_key.sh'
	exit -1
fi
word="word_def::"$1
result=`./redis_login.sh <<EOF
get $word
EOF`
echo $result
