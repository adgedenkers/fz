#!/bin/bash
curl v4.ifconfig.co > $HOME/bin/afd/config/aws_my_ip.txt

awk '{ print $0 "/32" }' < $HOME/bin/afd/config/aws_my_ip.txt > $HOME/bin/afd/config/aws_my_cidr.txt

export aws_my_cidr=$(cat $HOME/bin/afd/config/aws_my_cidr.txt)

aws ec2 update-security-group-rule-descriptions-ingress --group-id sg-03884371 --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 22, "ToPort": 22, "IpRanges": [{"CidrIp": "'$aws_my_cidr'", "Description": "Adge"}]}]'

# aws ec2 authorize-security-group-ingress --group-id sg-03884371 --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 22, "ToPort": 22, "IpRanges": [{"CidrIp": "'$aws_my_cidr'", "Description": "Adge Denkers"}]}]'