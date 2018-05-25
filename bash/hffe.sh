#!/bin/bash
# -------------------------------------------------------
# HFFE
# -------------------------------------------------------
#             _            _                 
#   __ _   __| | ___ _ __ | | _____ _ __ ___ 
#  / _` | / _` |/ _ \ '_ \| |/ / _ \ '__/ __|
# | (_| || (_| |  __/ | | |   <  __/ |  \__ \
#  \__,_(_)__,_|\___|_| |_|_|\_\___|_|  |___/
# adge.denkers@gmail.com | https://github.com/adgedenkers
# -------------------------------------------------------
# file name: hffe.sh 
# location: /bin/fz/scripts/
# date: 2018-04-19
# -------------------------------------------------------

echo "What file?"
read $inputfile
outputfile=$inputfile

if [ $1 -eq "-d" ]
then
    decrypt="-d"
else
    decrypt=""
    touch ~/.ahd/.ecr
    # Execute First Encrpytion
    openssl rsa $decrypt -a -salt -in $inputfile -out ~/.ahd/.ecr

    # Remove the original input file
    # rm $inputfile

    # Execute Second Encryption
    openssl base64 $decrypt -a -salt -in ~/.ahd/.ecr -out $inputfile
fi

# if encrypting file


#openssl aes-256.cbc -a -salt -in $inputfile -out $outputfile


# if decrypting file

# openssl aes-256.cbc $decrypt -a -salt -in $inputfile -out ~/.ahd/.ecr


# Cleanup
decrypt=""
rm ~/.ahd/.ecr