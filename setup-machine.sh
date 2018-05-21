#!/bin/bash
# __     ___   _    _      _____ _____ _     
# \ \   / / | | |  / \    |  ___|_   _| |    
#  \ \ / /| |_| | / _ \   | |_    | | | |    
#   \ V / |  _  |/ ___ \  |  _|   | | | |___ 
#    \_/  |_| |_/_/   \_\ |_|     |_| |_____|
#       VHA Future Technology Laboratory
#               https://vaftl.us
#------------------------------------------------------------------------
# Adge Denkers
# adge@vaftl.us
# Future Technology Laboratory
# U.S. Department of Veterans Affairs
# project: bash_profile
# file name: ./bash_profile/machine-setup/setup.sh
# date: 2017-10-23
#------------------------------------------------------------------------ 
 
echo 'starting: bash_profile (./bash_profile/machine-setup/setup.sh)'

#------------------------------------------------------------------------

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

# Install the AWS CLI Tools
pip install awscli
pip install aws-shell
pip install --upgrade aws-shell
echo "AWS CLI Tools Installed"

# Install speedtest-cli Python Tool
pip install git+https://github.com/sivel/speedtest-cli.git

# Install 'FSWatch' - file system watch - set events for when a file changes
brew install fswatch
echo "FSWatch Installed"

# Install Kubernetes & related software
brew install jq
echo "JQ Installed"

# --- Install Terraform
# Terraform Download Page: https://www.terraform.io/downloads.html
wget https://releases.hashicorp.com/terraform/0.10.7/terraform_0.10.7_darwin_amd64.zip
unzip terraf*
rm -rf terraf*.zip
mv terraform /usr/local/bin
echo "Terraform Installed"

# --- Install Kubernetes CLI
brew install kubernetes-cli
brew install kubernetes-helm
echo "Kubernetes Installed"