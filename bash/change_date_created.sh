#!/bin/bash
# -------------------------------------------------------
# Change the date a file was created
# -------------------------------------------------------
#             _            _                 
#   __ _   __| | ___ _ __ | | _____ _ __ ___ 
#  / _` | / _` |/ _ \ '_ \| |/ / _ \ '__/ __|
# | (_| || (_| |  __/ | | |   <  __/ |  \__ \
#  \__,_(_)__,_|\___|_| |_|_|\_\___|_|  |___/
# adge.denkers@gmail.com | https://github.com/adgedenkers
# -------------------------------------------------------
# file name: change_date_created.sh
# location: /Users/adge/bin/afd/tools/
# date: 2018-04-09
# -------------------------------------------------------

# This is esentially what this script executes:
#
# $ touch –t 201804091125 ~/bin/images/myfile.jpg

# ***** Usage *****
# $ change_date_created.sh ~/path/to/file_name.abc
# 
# You will be prompted to enter the date in YYYYMMDD format
# Then you will be asked for the time in HHMM format
# When you press enter, the file will be modified to reflect
# the date and time you supplied as the date created


fileToChange=$0 # path to file and file name

echo "Please provide the creation date for the file"
echo "---------------------------------------------"
echo "The date must be formatted like this: YYYYMMDD" 
echo "(ex: 20180221 = Feb. 21, 2018)"
read newDate
echo "Pleae provide the time the file was created "
echo "---------------------------------------------"
echo "The time must be formatted like this: HHMM"
echo "(ex: 1326 = 1:26 PM)"
read newTime