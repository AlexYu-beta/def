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

-a|-A)
	definition=""
	if [ $# -lt 2 ];
	then
		echo 'Err: Missing parameters.'
		echo 'Try "def -h" to get some help!'
		exit -1
	elif [ $# = 2 ];
	then
		definition='No definition'
	else
		definition=$3
	fi
	echo $definition
;;

*)
	echo 'Err: Command not found.'	
	echo 'Try "def -h" to get some help!'
	exit -1
;;

esac
