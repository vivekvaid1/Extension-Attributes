#!/bin/sh
echo "<result>`/usr/bin/pmset -g 2>&1 | grep -w sleep | awk '{print $2}'`</result>"
