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
# file name: aws_list_all_ec2.sh
# location: /Users/adge/bin/fz/bash/aws/
# date: 2018-01-23
# updated: 2018-05-22
# -------------------------------------------------------

currTs=$(date +"%Y-%m-%d_%H-%M-%S")
tsv_file_path="/Users/adge/bin/fz/bash/aws/reports"
tsv_file_name="$currTs-FTL-EC2-Report.tsv"

tsv_file="$tsv_file_path/$tsv_file_name"

touch $tsv_file

# ----- Output New Header Row Labels to the TSV file 
reportHead="Instance ID\tProject ID\tProject Name\tName\tInstance Type\tState\tKey\tOS\tDNS\tPOC\tEmail\tImage ID\tPublic DNS\tPublic IP\tLaunched"
echo -e $reportHead > "$tsv_file"

# ----- Query AWS EC2 for all FTL Instances - Added Additional Fields
aws ec2 describe-instances --output text --query 'Reservations[*].Instances[*].[InstanceId, [Tags[?Key==`Project ID`].Value][0][0], [Tags[?Key==`Project Name`].Value][0][0],[Tags[?Key==`Name`].Value][0][0],InstanceType,State.Name,KeyName,[Tags[?Key==`OS`].Value][0][0],[Tags[?Key==`DNS`].Value][0][0],[Tags[?Key==`POC`].Value][0][0],[Tags[?Key==`Email`].Value][0][0],ImageId,PublicDnsName,PublicIpAddress,LaunchTime ]' >> "$tsv_file"
