#!/bin/bash
# -------------------------------------------------------
# Raspberry Pi - Setting up my Personal Configuration
# -------------------------------------------------------
#             _            _
#   __ _   __| | ___ _ __ | | _____ _ __ ___
#  / _` | / _` |/ _ \ '_ \| |/ / _ \ '__/ __|
# | (_| || (_| |  __/ | | |   <  __/ |  \__ \
#  \__,_(_)__,_|\___|_| |_|_|\_\___|_|  |___/
# adge.denkers@gmail.com | https://github.com/adgedenkers
# -------------------------------------------------------
# file name: ahd_setup.sh
# location: ~/bin/fz/rpi/bash_profile/
# date: 2018-12-03
# -------------------------------------------------------

# Setup and Configuration for Bash Profile Installation

# Create Directories if Needed
mkdir ~/.ahd
mkdir ~/.keys
mkdir ~/bin
mkdir ~/bin/fz
mkdir ~/bin/fz/config
mkdir ~/dev

# clone the fz repo locally
cd ~/dev
git clone https://github.com/adgedenkers/fz.git

# copy bash profile and server connections list to home directory
cp ~/dev/fz/rpi/setup_and_profile/.bash_profile ~/.bash_profile
cp ~/dev/fz/rpi/setup_and_profile/.servers ~/.servers

cd ~/

# Install Packages

# - Update the package manager apt-get
sudo apt-get update             # Updates the List of Packages

# - Update the OS and all installed packages with latest versions
sudo apt-get dist-upgrade       # Updates OS
sudo apt-get upgrade            # Updates Installed Packages

# - Install Additional Packages

sudo apt-get install -y nano, git, speedtest-cli

cd ~/bin/
git clone 