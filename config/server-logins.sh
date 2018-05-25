#!/bin/bash
#             _            _                 
#   __ _   __| | ___ _ __ | | _____ _ __ ___ 
#  / _` | / _` |/ _ \ '_ \| |/ / _ \ '__/ __|
# | (_| || (_| |  __/ | | |   <  __/ |  \__ \
#  \__,_(_)__,_|\___|_| |_|_|\_\___|_|  |___/
# adge.denkers@gmail.com | https://github.com/adgedenkers
# -------------------------------------------------------
# file name: server-logins.sh
# location: ~/bin/fz/config/
# date: 2017-12-04
# updated: 2018-05-21
#
# -------------------------------------------------------
# Adge's Personal Servers
# -------------------------------------------------------

# jupiter.local
alias :jupiter="ssh -i '~/.ssh/adge' jupiter.local"

# denkers minecraft server
alias :mc-server="ssh -i '$keys/AHD01.pem' ec2-user@ec2-52-90-76-120.compute-1.amazonaws.com"
# -------------------------------------------------------


# -------------------------------------------------------
# Shortcuts to AWS servers
# -------------------------------------------------------

# === Generic Shortcut ===
function :conn() {
    # string is fed into command as follows
    # ssh -i "keypair.pem" ec2-user@ec2-52-205-188-212.compute-1.amazonaws.com
    output="$1 $2 \"$keys/$3\" $4"
    eval $output
}


# Key File Locations
# -------------------------------------------------------
# keypair.pem   =   '$keys/keypair.pem'
# keypairV2.pem =   '$keys/keypairV2.pem'
#
# keypair.pem   =   "ssh -i '$keys/keypair.pem' ec2-user@"
# keypairV2.pem =   "ssh -i '$keys/keypairV2.pem' ec2-user@"

# -------------------------------------------------------
# Server Related Functions
# -------------------------------------------------------
alias :list-servers='. /Users/adge/bin/afd/settings/servers/server-list-function.sh'

alias :conn:ahd="ssh -i '$keys/keypair.pem' ec2-user@ec2-52-44-16-244.compute-1.amazonaws.com"

# -------------------------------------------------------
# Primary FTL Systems
# -------------------------------------------------------

# ***** FTL Web and Mail Server
alias :conn:vaftl="ssh -i '$keys/keypair.pem' ec2-user@ec2-54-225-240-96.compute-1.amazonaws.com"
# ***** / FTL Web and Mail Server

# ***** FTL Help Desk Server
alias :conn:helpdesk="ssh -i '$keys/keypair.pem' adge@ec2-34-224-176-32.compute-1.amazonaws.com"
# ***** / FTL Help Desk Server

# ***** FTL Help Desk Server Replacement
alias :conn:hd3="ssh -i '$keys/keypairV2.pem' ec2-user@35.171.87.177"
# ***** / FTL Help Desk Server

# ***** FTL Tools Server
alias :conn:repo="ssh -i \"$keys/keypairV2.pem\" ec2-user@ec2-34-231-150-220.compute-1.amazonaws.com"
# ***** / FTL Tools Server

# ***** FTL AI System
alias :conn:ai="ssh -i '$keys/keypairV2.pem' ec2-user@ec2-54-175-164-32.compute-1.amazonaws.com"
# ssh -i '/Users/adge/_keys/keypairV2.pem' ec2-user@ec2-54-175-164-32.compute-1.amazonaws.com
#
# OLD 
# alias :conn:ai="ssh -i '$keys/keypairV2.pem' ec2-user@ec2-35-169-133-108.compute-1.amazonaws.com"
# ssh -i '/Users/adge/_keys/keypairV2.pem' ec2-user@ec2-35-169-133-108.compute-1.amazonaws.com
#
# ----- Notes -----
# AWS VPC               =   
# AWS Security Group    =   sg-f0adb685
# ---- / Notes

# Generating public/private rsa key pair
# Your identification has been saved in =    /etc/ssh/ssh_host_rsa_key
# Your public key has been saved in     =    /etc/ssh/ssh_host_rsa_key.pub
# The key fingerprint is:
# SHA256:+Yv0xGvQrV6Qw4I6D1lX0Sx3P6EnPpKnglGcn2vSfBg root@ip-10-11-2-88
#        +Yv0xGvQrV6Qw4I6D1lX0Sx3P6EnPpKnglGcn2vSfBg
# ***** / FTL AI System

# -------------------------------------------------------
# VA Mobile Help Desk
# -------------------------------------------------------

# Access with the AWS Credentials
alias :conn:mobilehd="ssh -i '$keys/keypair.pem' centos@ec2-54-163-253-59.compute-1.amazonaws.com"

# Access with Adge's Credentials
alias :conn:mobilehd-adge="echo 'VAm0b1l3-HD' && ssh -i '~/.ssh/vamobile-hd' adge@help.vamobile.us"


# -------------------------------------------------------
# FTL Project Systems
# -------------------------------------------------------

# ***** eScreening VistA Server
alias :conn:escreening="ssh -i '$keys/keypairV2.pem' ec2-user@ec2-52-90-205-158.compute-1.amazonaws.com"

# ***** Feedstrap Server (feedstrap.vaftl.us)
alias :conn:feedstrap="ssh -i '$keys/keypair.pem' ec2-user@ec2-54-146-173-25.compute-1.amazonaws.com"


# ***** Lariat - Django Server
alias :conn:lariat="ssh -i '$keys/keypair.pem' centos@ec2-34-229-104-178.compute-1.amazonaws.com"


# ***** MHA Server (mha.vaftl.us)
alias :conn:mha:ahd="ssh -i '$keys/keypairV2.pem' ec2-user@ec2-52-70-6-210.compute-1.amazonaws.com"

alias :conn:mha="ssh -i '$keys/keypairV2.pem' ubuntu@ec2-34-234-44-58.compute-1.amazonaws.com"

# --- old MHA connections
# alias :conn:mha="ssh -i '$keys/keypair.pem' ubuntu@ec2-54-159-209-182.compute-1.amazonaws.com"

# ***** Patient Buddy - VistA Server
# adge 
alias :conn:adge-buddyvista="ssh -i '$keys/keypairV2.pem' adge@ec2-54-242-48-113.compute-1.amazonaws.com"
# ec2-user
alias :conn:buddyvista="ssh -i '$keys/keypairV2.pem' ec2-user@ec2-54-242-48-113.compute-1.amazonaws.com"


# ***** Vets.gov Development Server *****
# adge
alias :a:conn:vetsgov=""


# ***** Women's Health Ordering Menu Project *****
alias :conn:wh-vista="ssh -i '$keys/keypairV2.pem' adge@ec2-54-242-251-131.compute-1.amazonaws.com"