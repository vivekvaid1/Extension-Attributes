#!/bin/bash
#Extension Attribute to report on what login items current user has
#Shaquir Tannis 7-5-20

#Determine current log in user
currentUser=$(ls -l /dev/console | awk '{print $3}')

#Stop running if there is no user
if [ $currentUser = "root" ] || [ $currentUser = "CompanyAdmin" ] || [ $currentUser = "_mbsetupuser" ] || [ $currentUser = "" ]; then
    #echo "ERROR: No User Logged in, aborting"
    exit 1
fi

uid=$(id -u "$currentUser")

#List login items - Unformatted
rawLoginItems=$( sudo launchctl asuser $uid /usr/bin/osascript <<-EOD
tell application "System Events" to get the name of every login item
    EOD
)

#Format rawLoginItems list - Remove space after the comma
#loginItems=$(echo $rawLoginItems | sed -e 's/, /,/g')

if [ -z "$rawLoginItems" ]; then
    echo "<result>None</result>"
    else
    echo "<result>$rawLoginItems</result>"
fi

exit 0
