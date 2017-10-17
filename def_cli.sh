#!/bin/bash
# Project: def
# File: def_cli.sh
# Author: AlexYu-beta
# the def client script
# requires alias from zsh

if [ $# = 0 ];
then
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
*)
	echo 'Try "def -h" to get some help!'
	exit -1
;;
esac
