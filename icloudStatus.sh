#!/bin/bash

# Purpose: to grab iCloud status

plistBud="/usr/libexec/PlistBuddy"

loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

if [[ -e "/Users/$loggedInUser/Library/Preferences/MobileMeAccounts.plist" ]]; then
    iCloudStatus=`$plistBud -c "print :Accounts:0:LoggedIn" /Users/$loggedInUser/Library/Preferences/MobileMeAccounts.plist`
else
    iCloudStatus="Not Enabled"
fi

echo "<result>$iCloudStatus</result>"