#!/bin/sh

for levelnumber in 1 2 3 4 5 6 7 8 9 10; do
    deluser "fmlab$levelnumber" 2>/dev/null
    rm -rf "/home/fmlab$levelnumber"
done

rm -f /usr/bin/validate /usr/bin/nextlevel /usr/bin/prevlevel

if [ -f /opt/fmlab/profile.backup ]; then
    cp /opt/fmlab/profile.backup /etc/profile
fi

rm -rf /opt/fmlab

echo "File Manipulation Lab users, homes, commands, and lab data removed."
