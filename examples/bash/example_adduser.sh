#!/bin/bash

# Create User Account on AWS - Admin, Sudo and SSH

# Install Python and PIP
sudo yum -y install python

# Install the AWS Client CLI Tools
sudo pip install awscli
sudo pip install aws-shell
sudo pip --upgrade aws-shell

# user = $1
# pass = Welcome1!

# add `ftl` group - an admin group
sudo groupadd ftl

# create user $1, add the user to the groups ftl and wheel, and set the user's password to 'Welcome1!'
sudo adduser -m -G ftl,wheel --password Welcome1! $1
sudo su - $1
mkdir .ssh
chmod 700 .ssh
touch .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
