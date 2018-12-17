#:-----------------------------------------------------
# Adge Denkers
# adge.denkers@gmail.com
# file name: .bash_profile
# date: 2018-12-03
# updated: 2018-12-03
# -----------------------------------------------------
# Adge's Personal Raspberry Pi Bash Profile
# -----------------------------------------------------
# v. 1.2
# d. 2018-04-29
# -----------------------------------------------------


# ----- Section 1 -----
# -----------------------------------------------------
# Adge's User Accounts
# -----------------------------------------------------

# ----- Adge's GitHub Account
GITHUBUSER="adgedenkers"


# ----- Section 2 -----
# -----------------------------------------------------
# System Configuration Settings
# -----------------------------------------------------

# ----- Set Default Editor to 'Nano'
export EDITOR=/usr/bin/nano

# ----- Add color to the Terminal
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# ----- Section 3 -----
# -----------------------------------------------------
# Modify System Command Defaults
# -----------------------------------------------------

# ----- Modify default `ls` command
alias ls="ls -lasG"

# ----- Modify default `rmdir` command
alias rmdir="rm -R $1"

# ----- Section 4 -----
# -----------------------------------------------------
# Directory Aliases
# -----------------------------------------------------

# Personal Bin Directory
bin="$HOME/bin"

# My Private Directory
p="$HOME/.ahd"
alias :p="cd $p"
alias :private="cd $p"

sysbin="/usr/local/bin"
alias :sysbin="cd $sysbin"
alias :sysbin-f=":f $sysbin"
alias :sysbin-c="code $sysbin"


# ----- Section 5 -----
# -----------------------------------------------------
# File Aliases
# -----------------------------------------------------

# ----- Bash Profile
# -----------------------------------------------------
alias $profile="~/.bash_profile"
# ----- --- edit profile
:be="nano $profile"
:BE="nano $profile"
:Be="nano $profile"
# ----- --- reload profile
alias :br=". ~/.bash_profile"

# ----- Server Connections List
# -----------------------------------------------------
server_connections="$HOME/bin/fz/config/servers.sh"
# ----- --- Load the Server Connections File (Server Shortcuts)
source $server_connections
# ----- --- Edit the Server Connections File
alias :servers="nano $server_connections"

# ----- Section 6 -----
# -----------------------------------------------------
# Custom Commands and Command Shortcuts
# -----------------------------------------------------

# -----
# -----


# ----- :filetree
# ----- Print a file tree for the directory you are in.

alias :filetree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"

# ----- :mkdir
# ----- Create a directory and move into it.
:mkdir() {mkdir -p "$1" && cd "$1" ; }

# ----- :os
# ----- Print the current OS and Version

alias :os="cat /etc/*-release"


# ----- Section 7 -----
# -----------------------------------------------------
# Custom Functions
# -----------------------------------------------------

#   :extract ----- Extract most know archives with one command
#   $ extract somefile.tar.bz2
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# ----- Git Functions
:git-update() {
    git add -A .
    git commit "$@"
    git push
}

:git-configure() {
    echo "What is the name of the repository (abc123.git)?"
    read reponame
    git remote add upstream https://github.com/adgedenkers/$reponame
    git add -A .
    echo "Commit message?"
    read commitmessage
    git commit -m "$commitmessage"
    git push
}

:git-save() {
    git add -A .
    git commit "$@"
    git push
}

:git-new() {
    if [ -z "$1" ]
    then
        echo "No repository name provided"
    else
        reponame=$1
        mkdir $reponame && cd $reponame
        echo "# $reponame" >> README.md
        git init
        git add README.md
        git commit -m "ahd - Initial Commit"
        remoteorigin="https://github.com/adgedenkers/$reponame.git"
        git remote add origin $remoteorigin
        #git remote add origin https://github.com/adgedenkers/$reponame.git
        git push -u origin master
    fi
}

:git_new_repo() {
    # uses the github api to create a repository under your account
    # uses just the default settings provided below
    
    # set the variables
    new_repo=$1
    
    # now, execute the command, using your token
    curl -i -H 'Authorization: token 93f6bb897e5d098b782c3a3bb4d3fdcc4b7c4a4f' -d '{ "name": "$new_repo", "auto_init": true, "private": false, "gitignore_template": "nanoc" }' https://api.github.com/user/repos
}


# -- Create the repo on GitHub and grab everything after /VHAINNOVATIONS/ in the clone command (in this case, "MHA.git")
# -- Navigate to the directory where the files are located to push to the repo
# -- Execute like this: $ cd /mha/folder/location && :git-upload-new MHA.git
:git-upload-new() {
    echo "# AHD Added" >> README.md
    git init
    git add .
    git add README.md
    git commit -m "first commit"
    git remote add origin https://github.com/VHAINNOVATIONS/$@
    git push -u origin master
}


# ----- Networking Functions

# :network_devices  ----- Print a list of all network devices
function :network_devices() { for ip in $(seq 1 254); do ping -c 1 10.4.1.$ip>/dev/null; [ $? -eq 0 ] && echo "10.4.1.$ip UP" || : ; done; }

# :wanip            ----- Print your WAN IP address
alias :wanip="dig +short myip.opendns.com @resolver1.opendns.com"

# :wanip_logger     ----- WAN IP Logger
function wanip_log() {
    wanip_val=$(dig +short myip.opendns.com @resolver1.opendns.com)
    curr_ts=$(date +"%Y-%m-%d %H:%M:%S")
    echo [$curr_ts] $wanip_val >> /var/log/wan_ip.log
    
    # previous wan ip is stored in an Env. Variable
    
    # compare the stored wan ip with the wan ip just received
    
    # if the two are different, update the Env. Variable, and then somehow notify Adge that a change has taken place - because the AWS security groups with my ip will need to be modified to reflect the new ip
}


# ----- Section 8 -----