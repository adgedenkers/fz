#!/bin/bash
# -------------------------------------------------------
# Add a User and SSH Key to a Server in AWS
# -------------------------------------------------------
#             _            _                 
#   __ _   __| | ___ _ __ | | _____ _ __ ___ 
#  / _` | / _` |/ _ \ '_ \| |/ / _ \ '__/ __|
# | (_| || (_| |  __/ | | |   <  __/ |  \__ \
#  \__,_(_)__,_|\___|_| |_|_|\_\___|_|  |___/
# adge.denkers@gmail.com | https://github.com/adgedenkers
# -------------------------------------------------------
# file name: add_user_and_ssh_key.sh
# location: ~/bin/afd/aws/
# date: 2018-04-19
# -------------------------------------------------------

# 0. This script should be run as sudo

# 1. Add all the users that need to be added to the system

useradd adge
passwd adge
# supply password
# confirm password

# now make the user a sudoer by adding them to the sudoer file

# to do so, you first must modify the /etc/sudoers file and uncomment
# the second of the two lines below:
visudo

# ## Allows people in group wheel to run all commands
# %wheel        ALL=(ALL)       ALL

# save the file
# exit the editor

# add the user we just created to the "wheel" group

usermod -aG wheel adge

# to test that it worked, execute this:
su adge -

# add .ssh directory and authorized_keys file

mkdir ~/.ssh
touch ~/.ssh/authorized_keys

groups
adge wheel // should list the username as a group as well as wheel

# also, you can check what groups a user belongs to by using the 'groups' command
groups adge
adge : adge wheel
# adge : adge means that I'm part of my own group, which all users are
# and wheel means that I'm a part of the 'wheel' group

# now execute a whoami command
sudo whoami
# you will probably have to enter your password
# the returned value from whoami should be 'root'
root




# 2. Explicitly set other authentication methods to no
#       PasswordAuthentication no
#       ChallengeResponseAuthentication no

#
#    Explicitly set the authentication method to use to yes
#       PubkeyAuthentication yes

#    All of this is in the /etc/ssh/sshd_config file
sudo nano /etc/ssh/sshd_config

# 3. Reset the SSH Settings
systemctl sshd restart


# 4. Configure SSH on the Server
#       Using one of these methods:
#        - One key for all users, or 
#        - Each user has their own personal key

#       Using One Key for All Users


# making a key for multiple users to use
project_name="vamobile-hd"
ssh-keygen -f ~/.ssh/server-keys/$project_name -t rsa -b 4096
sudo chown adge:staff ~/.ssh/server-keys/$project_name
sudo chown adge:staff ~/.ssh/server-keys/$project_name.pub
# Your identification has been saved in /.keys/vamobile-hd.
# Your public key has been saved in /.keys/vamobile-hd.pub.


# now copy the public key over to the server, under the user's home directory
# by adding it to the file /home/[username]/.ssh/authorized_keys
# Use the tool "ssh-copy-id" to copy it over

# *** key files ***
# /.keys/vamobile-hd        // private key - lives on user's machine
# /.keys/vamobile-hd-pub    // public key - lives on the server in the user's 
#                              authorized_keys file

# setup permissions for key files 
sudo chmod 700 ~/.ssh
sudo chmod 600 ~/.ssh/authorized_keys


# **************************************************
# Send Key Files to the centos' ~/.ssh folder on an AWS System
# **************************************************

# ><><><><><><><><><><><>><><><><><><><><><><><><>><><><><><><>
# NOT WORKING CORRECTLY
# ><><><><><><><><><><><>><><><><><><><><><><><><>><><><><><><>

username="centos"
system="ec2-54-163-253-59.compute-1.amazonaws.com"
access_key="keypair.pem" # the admin key used by SCP to log into the system in question as centos

# set the keys folder on your local machine if needed
# keys="~/.keys"

key_public="vamobile-hd.pub"
key_private="vamobile-hd"

scp ~/.ssh/server-keys/$key_public -i "$keys/$access_key" $username@$system:/home/$username/.ssh/$key_public

scp -i "$keys/$access_key" ~/.ssh/server-keys/$key_private $username@$system:/home/$username/.ssh/$key_private

# ><><><><><><><><><><><>><><><><><><><><><><><><>><><><><><><>

scp -i "$keys/keypair.pem" ~/.ssh/server-keys/vamobile-hd.pub centos@ec2-54-163-253-59.compute-1.amazonaws.com:/home/centos/.ssh/vamobile-hd.pub

scp -i "$keys/keypair.pem" ~/.ssh/server-keys/vamobile-hd centos@ec2-54-163-253-59.compute-1.amazonaws.com:/home/centos/.ssh/vamobile-hd

ssh -i "$keys/keypair.pem" centos@ec2-54-163-253-59.compute-1.amazonaws.com

# now on the server side of things
# in the centos user account
cd ~/.ssh
sudo cp vamobile-hd.pub /home/vikki/.ssh/
sudo chown vikki:vikki /home/vikki/.ssh/vamobile-hd.pub


# switch to user `vikki`
su vikki -
#Password: 
cd ~/.ssh
cat vamobile-hd.pub >> authorized_keys 

sudo chmod 700 ~/.ssh
sudo chmod 600 ~/.ssh/authorized_keys

# leave vikki account, returning to centos
exit

# centos account
cd ~


# users accounts that I can't access, such as Bill Cerniuk's, we send them the pair of keys in a zip file. Then, we tell them to upload the .pub file only to the .ssh folder of their user account.

# they may need to 