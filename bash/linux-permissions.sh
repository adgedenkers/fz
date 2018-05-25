#!/bin/bash
# -------------------------------------------------------
# List Linux Permissions Cheatsheet
# -------------------------------------------------------
#             _            _                 
#   __ _   __| | ___ _ __ | | _____ _ __ ___ 
#  / _` | / _` |/ _ \ '_ \| |/ / _ \ '__/ __|
# | (_| || (_| |  __/ | | |   <  __/ |  \__ \
#  \__,_(_)__,_|\___|_| |_|_|\_\___|_|  |___/
# adge.denkers@gmail.com | https://github.com/adgedenkers
# -------------------------------------------------------
# file name: linux-permissions.sh
# location: /Users/adge/bin/afd/settings/reference/
# date: 2018-02-15 
# -------------------------------------------------------

awk -F, '{printf "%-7s %-7s %-7s %-7s\n",$1,$2,$3,$4}' /Users/adge/bin/afd/settings/reference/linux-permissions.txt
