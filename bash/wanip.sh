#!/bin/bash
# -------------------------------------------------------
# Get the current WAN IP Address
# -------------------------------------------------------
#             _            _                 
#   __ _   __| | ___ _ __ | | _____ _ __ ___ 
#  / _` | / _` |/ _ \ '_ \| |/ / _ \ '__/ __|
# | (_| || (_| |  __/ | | |   <  __/ |  \__ \
#  \__,_(_)__,_|\___|_| |_|_|\_\___|_|  |___/
# adge.denkers@gmail.com | https://github.com/adgedenkers
# -------------------------------------------------------
# file name: wanip.sh
# location: /Users/adge/bin/afd/tools/
# date: 2017-12-04
# -------------------------------------------------------

case "$1" in
	""|dns)	dig +short myip.opendns.com @resolver1.opendns.com ;;
	http) curl -s http://whatismyip.akamai.com/ && echo ;;
	https) curl -s https://4.ifcfg.me/ ;;
	ftp) echo close | ftp 4.ifcfg.me | awk '{print $4; exit}' ;;
	telnet) nc 4.ifcfg.me 23 | grep IPv4 | cut -d' ' -f4 ;;
	*) echo Bad argument >&2 && exit 1 ;;
esac