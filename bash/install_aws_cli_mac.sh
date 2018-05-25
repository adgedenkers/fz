#!/bin/bash
# -------------------------------------------------------
# Installs AWS CLI on Mac OS X
# -------------------------------------------------------
#             _            _                 
#   __ _   __| | ___ _ __ | | _____ _ __ ___ 
#  / _` | / _` |/ _ \ '_ \| |/ / _ \ '__/ __|
# | (_| || (_| |  __/ | | |   <  __/ |  \__ \
#  \__,_(_)__,_|\___|_| |_|_|\_\___|_|  |___/
# adge.denkers@gmail.com | https://github.com/adgedenkers
# -------------------------------------------------------
# file name: install_aws_cli_mac.sh
# location: /Users/adge/bin/fz/scripts/
# date: 2018-01-04
# -------------------------------------------------------

dir=$(pwd)

brew install python3
pip3 install awscli --upgrade --user

cd $dir