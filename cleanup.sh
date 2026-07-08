#!/bin/sh

for levelnumber in 1 2 3 4 5 6 7 8 9 10; do
    deluser "fmlab$levelnumber"
done

rm -rf /home/fmlab*
rm -rf /opt/fmlab
rm -f /usr/bin/validate

echo "File Manipulation Lab users, homes, and validators removed."
