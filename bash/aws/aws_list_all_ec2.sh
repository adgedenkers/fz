#!/bin/bash
# -------------------------------------------------------
# Generate a FTL System Report from AWS EC2 - All Systems
# -------------------------------------------------------
# __     ___   _    _      _____ _____ _     
# \ \   / / | | |  / \    |  ___|_   _| |    
#  \ \ / /| |_| | / _ \   | |_    | | | |    
#   \ V / |  _  |/ ___ \  |  _|   | | | |___ 
#    \_/  |_| |_/_/   \_\ |_|     |_| |_____|
#       VHA Future Technology Laboratory
#               https://vaftl.us
# -------------------------------------------------------
# Adge Denkers
# adriaan.denkers@va.gov
# VHA Future Technology Laboratory
# U.S. Department of Veterans Affairs
# project: FTL Tools
# file name: list_all_systems.sh
# location: /Users/adge/bin/aws
# date: 2018-01-23
# -------------------------------------------------------

# ----- Output New Header Row Labels to the TSV file `FTL_Systems.tsv`
reportHead="Instance ID\tProject ID\tProject Name\tName\tInstance Type\tState\tKey\tOS\tDNS\tPOC\tEmail\tImage ID\tPublic DNS\tPublic IP\tLaunched"
echo -e $reportHead > all_systems.tsv

# ----- Query AWS EC2 for all FTL Instances - Added Additional Fields
aws ec2 describe-instances --output text --query 'Reservations[*].Instances[*].[InstanceId, [Tags[?Key==`Project ID`].Value][0][0], [Tags[?Key==`Project Name`].Value][0][0],[Tags[?Key==`Name`].Value][0][0],InstanceType,State.Name,KeyName,[Tags[?Key==`OS`].Value][0][0],[Tags[?Key==`DNS`].Value][0][0],[Tags[?Key==`POC`].Value][0][0],[Tags[?Key==`Email`].Value][0][0],ImageId,PublicDnsName,PublicIpAddress,LaunchTime ]' >> all_systems.tsv
