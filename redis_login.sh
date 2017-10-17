#!/bin/bash
# Project: def
# File: redis_login.sh
# Author: AlexYu-beta
# PERSONAL redis login script
# requires correct password from env
# requires correct redis source code directory


cd /usr/local/redis-4.0.2/src
./redis-cli -h 127.0.0.1 -p 6379 -a $REDISPWD
