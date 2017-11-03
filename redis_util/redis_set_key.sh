#!/bin/bash
# Project: def
# File: redis_set_key.sh
# Author: AlexYu-beta
# PERSONAL redis operation script
# note that the "value" is stored in ../data/def_files as definition files

# current key_setting can only process single word
# later the value can be encryped and thus can be processed.
if [ $# != 1 ];
then
	echo 'Err: Wrong number of parameters.'
	echo 'From redis_set_key.sh'
	exit -1
fi
word="word_def::"$1
def_file="../data/def_files/"$1".def"
definition=`cat $def_file`
echo 'the word should be: '$word
echo 'the definition should be: '$definition
result=`./redis_login.sh << EOF
set $word "$definition"
exit
EOF`
echo $result
