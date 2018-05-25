#!/bin/bash
#                      _ _   _             _           
#      ___  __ _  __ _(_) |_| |_ __ _ _ __(_)_   _ ___ 
#     / __|/ _` |/ _` | | __| __/ _` | '__| | | | / __|
#     \__ \ (_| | (_| | | |_| || (_| | |  | | |_| \__ \
# ____|___/\__,_|\__, |_|\__|\__\__,_|_|  |_|\__,_|___/
#|_____|         |___/                                 
#
# -------------------------------------------------------
# file name: file-name-no-ext.sh
# date: 2017-10-26
# -------------------------------------------------------
#echo 'Take a file and return the file name without a file extension.'
#echo 'starting:  (file-name-no-ext.sh)'
#echo '~/bin/file-name-no-ext.sh'
#echo '$ file-name-no-ext [file_path]'
# -------------------------------------------------------

#echo "Stripping the extension from the file name ..."

if [  -e $1  ]  
then
    tmpFile=$1
    tmpFile=${1##*/}
    tmpFile=${tmpFile%.*}
    echo $tmpFile
fi