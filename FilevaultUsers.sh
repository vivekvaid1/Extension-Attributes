#!/bin/bash

# Get all user accounts on the Mac
all_users=$(dscl . -list /Users | grep -v "^_")

# Initialize an empty array to store FileVault-enabled users
filevault_enabled_users=()

# Loop through each user account to check FileVault status
for user in $all_users; do
    filevault_status=$(fdesetup list | grep -w "$user" | awk '{print $2}')
    if [ "$filevault_status" = "ENABLED" ]; then
        filevault_enabled_users+=("$user")
    fi
done

# Output the list of FileVault-enabled users as a comma-separated string
echo "<result>$(IFS=,; echo "${filevault_enabled_users[*]}")</result>"
