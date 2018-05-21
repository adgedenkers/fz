#!/bin/bash
# -------------------------------------------------------
# Create a User Account and Add an SSH Key to it
# -------------------------------------------------------
#             _            _                 
#   __ _   __| | ___ _ __ | | _____ _ __ ___ 
#  / _` | / _` |/ _ \ '_ \| |/ / _ \ '__/ __|
# | (_| || (_| |  __/ | | |   <  __/ |  \__ \
#  \__,_(_)__,_|\___|_| |_|_|\_\___|_|  |___/
# adge.denkers@gmail.com | https://github.com/adgedenkers
# -------------------------------------------------------
# file name: create_user_add_key.sh
# location: ~/bin/afd/aws/
# date: 2018-04-20
# -------------------------------------------------------

# prompt for user account to add key to
echo "What would you like to name the new account login?"
read account

sudo useradd $account
sudo passwd $account
sudo usermod -aG wheel $account

echo ""
echo "user `$account` has been added, and password set to a temporary password"
echo "user `$account` has been added to the `wheel` group, granting them ssh rights"

echo "What user are you logged in as?"
read me

echo "What public key file ('keyfile.pub') do you want to use? Provide the full path"
read keyfile

account_ssh_dir="/home/$account/.ssh"
auth_key_file="$account_ssh_dir/authorized_keys"


if [ ! -d "$account_ssh_dir" ]; then
    # Execute this code if the `.ssh` directory doesn't exist
    sudo mkdir $account_ssh_dir
fi

if [ ! -f "$auth_key_file" ]; then
    # Execute this code if the `authorized_keys` file doesn't exist
    sudo touch $auth_key_file
fi

sudo chown -R $me:$me $account_ssh_dir

cat ~/.ssh/vamobile-hd.pub | sudo tee -a $auth_key_file

sudo chown -R $account:$account $account_ssh_dir

sudo chmod 700 $account_ssh_dir
sudo chmod 600 $auth_key_file

echo ""

echo "all set ..."