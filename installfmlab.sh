#!/bin/sh

export SYSTEM_PASSWORD="systemPassword"
export currentDate=$(date +"%m-%d-%Y" | head -n 1)

confirmation="no"
while [ "$confirmation" != "y" ]; do
    export USER_ID=""
    echo "Enter your email address (e.g. xyz1234@psu.edu): "
    read USER_ID
    printf "Is %s your email address? (y/n) " "$USER_ID"
    read confirmation
done

mkdir -p /home
mkdir -p /opt/fmlab/validators
chmod 755 /opt /opt/fmlab /opt/fmlab/validators

cp profile /etc/profile
cp nextlevel /usr/bin/nextlevel
cp prevlevel /usr/bin/prevlevel
cp validate /usr/bin/validate
chmod 755 /usr/bin/nextlevel /usr/bin/prevlevel /usr/bin/validate

export origInstallDir=$(pwd)
levelsetname="fmlab"

echo -n "Building levels [ "
for levelnumber in 1 2 3 4 5 6 7 8 9 10; do
    echo -n "$levelnumber "
    export levelToBuild="$levelsetname$levelnumber"
    export level_HASH=$(echo -n "$USER_ID$currentDate$SYSTEM_PASSWORD$levelToBuild" | sha256sum | cut -d ' ' -f 1)
    export completion_code=$(echo "$level_HASH" | cut -c 1-10)
    export readMeLocation="$levelToBuild/README.txt"

    adduser -D -g "User" "$levelToBuild"
    passwd -d "$levelToBuild" > /dev/null 2>&1

    echo "* Create date: $currentDate" > "/home/$readMeLocation"
    echo "* User       : $USER_ID" >> "/home/$readMeLocation"
    echo "***************************************" >> "/home/$readMeLocation"
    echo "* Instructions for this level:        *" >> "/home/$readMeLocation"

    "$origInstallDir/$levelsetname$levelnumber.sh"
    cd "$origInstallDir" || exit 1
done
echo "]"
echo "done"

su - fmlab1
