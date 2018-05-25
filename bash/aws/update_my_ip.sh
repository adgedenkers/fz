#!/bin/bash
# script to pull my current public IP address 
# and add a rule to my EC2 security group allowing me SSH access 
curl v4.ifconfig.co > ip.txt
awk '{ print $0 "/32" }' < ip.txt > ipnew.txt
export stuff=$(cat ipnew.txt)
aws ec2 authorize-security-group-ingress --group-name NewGroup \
 --protocol tcp --port 22 --cidr $stuff

# Security group ID sg-03884371 = FTL Security Group - Adge
# my own personal security group in AWS. Can be modified, deleted, recreated
# all traffic open to my home network

 aws ec2 authorize-security-group-ingress \
  --group-id sg-03884371 \
  --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 22, "ToPort": 22, "IpRanges": [{"CidrIp": "$aws_my_cidr", "Description": "Adge Denkers"}]}]'