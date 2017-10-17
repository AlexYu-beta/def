#!/bin/bash
# Project: def
# File: redis_login.sh
# Author: AlexYu-beta
# PERSONAL redis login script
# requires correct password from env
# requires correct redis source code directory

source ./def_conf.sh
cd $redis_dir
./redis-cli -h 127.0.0.1 -p 6379 -a $redis_pwd
