#!/bin/bash
# -------------------------------------------------------
# Internet Speed Logger
# -------------------------------------------------------
#             _            _                 
#   __ _   __| | ___ _ __ | | _____ _ __ ___ 
#  / _` | / _` |/ _ \ '_ \| |/ / _ \ '__/ __|
# | (_| || (_| |  __/ | | |   <  __/ |  \__ \
#  \__,_(_)__,_|\___|_| |_|_|\_\___|_|  |___/
# adge.denkers@gmail.com | https://github.com/adgedenkers
# -------------------------------------------------------
# file name: internet-speed.sh
# location: ~/bin/fz/bash/
# date: 2018-05-21
# -------------------------------------------------------

tmpSpeed=$(/usr/local/bin/speedtest --simple) && currTs=$(date +"%Y-%m-%d %H:%M:%S") && echo [$currTs]: $tmpSpeed >> /var/log/speed.log