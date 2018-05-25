#!/bin/bash
# -------------------------------------------------------
# Generate a FTL System Report from AWS EC2 
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
# file name: ftl_ec2_report.sh
# location: /Users/adge/bin/aws/dev/list_of_systems
# date: 2018-01-17
# -------------------------------------------------------

# ----- Output New Header Row Labels to the TSV file `FTL_Systems.tsv`
reportHead="Instance ID\tProject ID\tProject Name\tName\tInstance Type\tState\tKey\tOS\tDNS\tPOC\tEmail\tImage ID\tPublic DNS\tPublic IP\tLaunched\tReviewed"
echo -e $reportHead > Unreviewed_Systems-AHD.tsv



# ----- Query AWS EC2 for all FTL Instances - Added Additional Fields
aws ec2 describe-instances --output text --filter "Name=tag:Reviewed,Values=" --query 'Reservations[*].Instances[*].[InstanceId, [Tags[?Key==`Project ID`].Value][0][0], [Tags[?Key==`Project Name`].Value][0][0],[Tags[?Key==`Name`].Value][0][0],InstanceType,State.Name,KeyName,[Tags[?Key==`OS`].Value][0][0],[Tags[?Key==`DNS`].Value][0][0],[Tags[?Key==`POC`].Value][0][0],[Tags[?Key==`Email`].Value][0][0],ImageId,PublicDnsName,PublicIpAddress,LaunchTime,[Tags[?Key==`Reviewed`].Value][0][0] ]' >> Unreviewed_Systems-AHD.tsv
