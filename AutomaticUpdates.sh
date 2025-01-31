#!/bin/zsh

UpdateStatus=`defaults read /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload`
if [[ "$UpdateStatus" = "0" ]]; then
    result="Disabled"
elif [[ "$UpdateStatus" = "1"  ]]; then
    result="Enabled"
else 
    result="Error"
fi
echo "<result>$result</result>"
#thanks