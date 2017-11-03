#!/bin/bash
# Project: def
# File: def_cli.sh
# Author: AlexYu-beta
# the def client script
# requires alias from zsh


if [ $# = 0 ];
then
	echo 'Err: Missing parameters.'
	echo 'Try "def -h" to get some help!'
	exit -1
fi

case $1 in

-h|-H|-help|-HELP)
	cat HELP.txt
;;

-v|-V|-version|-VERSION)
	source ./def_conf.sh
	echo $version
;;

-as|-AS)
	word=""
	definition=""
	if [ $# -lt 2 ];
	then
		echo 'Err: Wrong number of parameters.'
		echo 'Try "def -h" to get some help!'
		exit -1
	else
		definition=$*
		temp=${definition#* }
		word=${temp%%:*}
		definition_trunc=${definition#*:}
		definition_len=${#definition}
		definition_trunc_len=${#definition_trunc}
#		echo "<test>"
#		echo $definition_len
#		echo $definition_trunc_len
#		echo "</test>"
		if [ $definition_len = $definition_trunc_len -o $definition_trunc_len = 0 ];
		then
			echo 'Warn: No definition string.'
			definition='No definition'
		else
			definition=$definition_trunc
		fi
	fi
	echo -e "the word is: \t\t" $word
	echo -e "the definition is:\t" $definition
;;

-af|-AF)
	word=""
	definition=""
	if [ $# -lt 2 -o $# -gt 3 ];
	then
		echo 'Err: Wrong number of parameters.'
		echo 'Try "def -h" to get some help!'
		exit -1
	elif [ $# = 2 ];
	then
		echo 'Warn: No definition file.'
		word=$2
		definition='No definition'
	else
		word=$2
		def_path=$3
		base_dir=${def_path%/*}
		file_name=${def_path##*/}
		base_dir_len=${#base_dir}
		file_name_len=${#file_name}
		if [ $base_dir_len = $file_name_len ];
		then
			source ./def_conf.sh
			base_dir=$project_dir"/data/def_files"
		fi
		match_num=`find $base_dir -type f -name "$file_name" | wc -l`
		if [ $match_num = 0 ];
		then
			echo 'Err: Definition file not found.'
			echo 'Hint: The definition files are stored in ./data/def_files by convention.'
	    echo 'Hint: The definition files are postfixed with .def by convention.'
			exit -1
		fi
		file=$base_dir"/"$file_name
		definition=`cat $file`
	fi
	echo "Notice: You are trying adding a word definition to your local encyclopedia."
	echo -e "The word is: \t\t" $word
	echo -e "The definition is:\t" $definition
	echo "Sure to continue?(y/n)"
	read query_ch
	if [ $query_ch = 'y' ];
	then
		echo 'Adding the word definition...'
		# step 1: create the def file and write to ./data/def_files
		# step 2: (not-implemented yet) encrypt the file to ./data/tmp
		# step 3: write the file to db
	else
		echo 'The word definition abandoned!'
	fi
;;

*)
	echo 'Err: Command not found.'
	echo 'Try "def -h" to get some help!'
	exit -1
;;

esac
