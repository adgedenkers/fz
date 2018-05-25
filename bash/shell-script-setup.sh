#!/bin/bash
# -------------------------------------------------------
# Configure a Bash Script for Use
# -------------------------------------------------------
#             _            _                 
#   __ _   __| | ___ _ __ | | _____ _ __ ___ 
#  / _` | / _` |/ _ \ '_ \| |/ / _ \ '__/ __|
# | (_| || (_| |  __/ | | |   <  __/ |  \__ \
#  \__,_(_)__,_|\___|_| |_|_|\_\___|_|  |___/
# adge.denkers@gmail.com | https://github.com/adgedenkers
# -------------------------------------------------------
# file name: shell-script-setup.sh
# location: /Users/adge/bin/fz/scripts/
# date: 2017-10-26
# -------------------------------------------------------
# 
# Executable via the symlink: sssetup
#
# Usage: 
# $ shell-script-setup [script] [link_name optional]
#       script      = The .sh file to configure
#       link_name   = The symbolic link that's created in the system bin directory
#
# Example:
# $ sssetup /Users/adge/bin/my-script.sh myscript
#
# Once executed, you will be able to type 'myscript' at the command prompt, and it
# will execute the script '/Users/adge/bin/my-script.sh'
# -------------------------------------------------------

# Test if a file to act upon was passed (1st parameter)
if [  -s $1  ]  
then
    echo Setting up script "$1" ...
    echo Making the script executable ...
    sudo chmod a+x $1
    tmpScript="$1"
fi


##### FUTURE ADDITION #####
# Test to see if the file passed was the full-path to the file.
# If it wasn't the full path, get the full path. 

#if [not a full path]
#then 
    #tmpPWD=$(pwd)
    #echo "PWD=$tmpPWD"
    #tmpScript="$tmpPWD/$1"
#fi

###########################

# Test if a link-name was passed - if it wasn't, use
# the script name, minus the `.sh` extension

# Ex: `example.sh` would make the link `example` if
# no link-name was provided.

tmpLinkNameFromFile=$(file-name-no-ext $1)
tmpLink=""
tmpLn=""

if [  -z $2  ]  
then
    tmpLn=$tmpLinkNameFromFile
    tmpLink="/usr/local/bin/$tmpLinkNameFromFile"
else
    tmpLn=$2
    tmpLink="/usr/local/bin/$tmpLn"
fi

echo Creating a symbolic link to "$1"
echo $tmpLink
ln -s $tmpScript $tmpLink
#sudo chown root:admin $tmpLink

echo "------------------------------------------"
echo "$tmpLn -> $tmpScript"
echo "------------------------------------------"

echo Done ... 