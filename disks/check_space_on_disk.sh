#!/bin/bash

MAIL=root 
MAILIF=90
WARNIF=80


LANG=C

tmpfile="/tmp/.fs_usage_check"
echo -n "" >"$tmpfile"
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $1,$5 }' | sort -u | while read partition usep ; do
    if [ ${usep%%%} -ge $MAILIF ]; then
        echo "Running out of space \"$partition  ($usep)\" on $(hostname -f) as on $(date)" >>"$tmpfile"
    fi
done
if [ -s "$tmpfile" ] ; then
    mail  -s "Disk Space Warning on $(hostname -f)" $MAIL <"$tmpfile"
fi
rm -f "$tmpfile"



df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $6,$5 }' | while read partition usep ; do
    if [ ${usep%%%} -ge $WARNIF ]; then
	w -h | awk '($3 ~ /:[0-9]/) { print $1,$3 }' | sort -u | while read active_user dis; do
		su $active_user -c "DISPLAY=$dis notify-send -t 10000 \"Running out of space\" \"$partition is $WARNIF% full or more: $usep\"" 
	done
    fi
done
