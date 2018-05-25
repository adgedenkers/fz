# Update My WAN IP address in AWS

The process is as follows:

    1. Get the list of security groups to check (from update_my_ip.json)
    2. For each group
        1. For each inbound rule
            1. Copy all fields into variables
            2. If `Description` = `my-name` // Compare `Description` field with `my-name` from the config file
                1. Delete the entry
                2. Create new entry with updated IP
            3. End If
        2. End For Each Inbound Rule
    3. End For Each Security Group

## Scripts

- `update_my_wan_ip.sh`: This is the primary script that executes the process above.
- `update_my_sec_group.sh`: This script creates a new entry in a security group with your information.