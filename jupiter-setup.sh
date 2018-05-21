#!/bin/bash
#                      _ _   _             _           
#      ___  __ _  __ _(_) |_| |_ __ _ _ __(_)_   _ ___ 
#     / __|/ _` |/ _` | | __| __/ _` | '__| | | | / __|
#     \__ \ (_| | (_| | | |_| || (_| | |  | | |_| \__ \
# ____|___/\__,_|\__, |_|\__|\__\__,_|_|  |_|\__,_|___/
#|_____|         |___/                                 
#
# -------------------------------------------------------
# file name: jupiter-setup.sh
# date: 2017-11-17
# -------------------------------------------------------
# 'starting:  (jupiter-setup.sh)'

# -------------------------------------------------------

cd ~/Downloads

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install git

# Update Brew Repository
git -C "$(brew --repo homebrew/core)" fetch --unshallow
echo "Homebrew (brew) Installed"

# Install Python & PIP
brew install python
echo "Python Installed"

# Install/Upgrade Ruby
brew upgrade ruby
echo "Upgraded Ruby to most recent version"

# Install speedtest-cli Python Tool
pip install git+https://github.com/sivel/speedtest-cli.git
sudo touch /var/log/speed.log
echo "speedtest-cli Installed"

# Install 'FSWatch' - file system watch - set events for when a file changes
brew install fswatch
echo "FSWatch Installed"

# Setup My Folders

# create ~/.ahd
mkdir ~/.ahd

# create ~/_keys
mkdir ~/_keys

# create ~/bin
mkdir ~/bin

# crate ~/dev
mkdir ~/dev