#!/bin/zsh

FindMyMac=`defaults read /Library/Preferences/com.apple.FindMyMac.plist FMMEnabled`
if [[ "$FindMyMac" = "0" ]]; then
    result="Disabled"
elif [[ "$FindMyMac" = "1"  ]]; then
    result="Enabled"
else 
    result="Error"
fi
echo "<result>$result</result>"