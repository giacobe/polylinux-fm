#!/bin/sh

umask 022

export SYSTEM_PASSWORD="systemPassword"
export currentDate=$(date +"%m-%d-%Y" | head -n 1)

confirmation="no"
while [ "$confirmation" != "y" ] && [ "$confirmation" != "Y" ]; do
    export USER_ID=""
    echo "Enter your email address (e.g. xyz1234@psu.edu): "
    read USER_ID
    printf "Is %s your email address? (y/n) " "$USER_ID"
    read confirmation
done

mkdir -p /home
cp profile /etc/profile
cp nextlevel /usr/bin/nextlevel
cp prevlevel /usr/bin/prevlevel
cp validate /usr/bin/validate
chmod 755 /usr/bin/nextlevel /usr/bin/prevlevel /usr/bin/validate

export origInstallDir=$(pwd)
levelsetname="fmlab"

echo -n "Building levels [ "
builder_pids=""
for levelnumber in 1 2 3 4 5 6 7 8 9 10; do
    echo -n "$levelnumber "
    export levelToBuild="$levelsetname$levelnumber"
    export level_HASH=$(echo -n "$USER_ID$currentDate$SYSTEM_PASSWORD$levelToBuild" | sha256sum | cut -d ' ' -f 1)
    export readMeLocation="$levelToBuild/README.txt"

    adduser -D -g "User" "$levelToBuild"
    passwd -d "$levelToBuild" > /dev/null 2>&1

    echo "* Create date: $currentDate" > "/home/$readMeLocation"
    echo "* User       : $USER_ID" >> "/home/$readMeLocation"
    echo "***************************************" >> "/home/$readMeLocation"
    echo "* Instructions for this level:        *" >> "/home/$readMeLocation"

    "$origInstallDir/$levelsetname$levelnumber.sh" &
    builder_pids="$builder_pids $!"
done
echo "]"

for builder_pid in $builder_pids; do
    wait "$builder_pid"
done

for levelnumber in 1 2 3 4 5 6 7 8 9 10; do
    level_home="/home/fmlab$levelnumber"
    chown -R "fmlab$levelnumber:fmlab$levelnumber" "$level_home"
    chmod -R o-rx "$level_home"
done

echo "done"

su - fmlab1
