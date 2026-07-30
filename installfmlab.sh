#!/bin/sh

umask 022

export SYSTEM_PASSWORD="systemPassword"
currentDate=$(date +"%m-%d-%Y" | head -n 1)
export currentDate

existing_install="no"
for levelnumber in 1 2 3 4 5 6 7 8 9 10; do
    if [ -d "/home/fmlab$levelnumber" ] || grep -q "^fmlab$levelnumber:" /etc/passwd 2>/dev/null; then
        existing_install="yes"
    fi
done

if [ -d /opt/fmlab ]; then
    existing_install="yes"
fi

if [ "$existing_install" = "yes" ]; then
    echo "An existing File Manipulation Lab install was found."
    echo "Run sh cleanup.sh before installing again."
    exit 1
fi

confirmation="no"
while :; do
    export USER_ID=""
    echo "Enter your email address (e.g. xyz1234@psu.edu): "
    read USER_ID
    printf "Is %s your email address? (y/n) " "$USER_ID"
    read confirmation
    case "$confirmation" in
        y|Y) break ;;
    esac
done

mkdir -p /home
mkdir -p /opt/fmlab
chmod 755 /opt /opt/fmlab

if [ -f /etc/profile ]; then
    cp /etc/profile /opt/fmlab/profile.backup
    chmod 600 /opt/fmlab/profile.backup
fi

cp profile /etc/profile
cp nextlevel /usr/bin/nextlevel
cp prevlevel /usr/bin/prevlevel
cp validate /usr/bin/validate
chmod 755 /usr/bin/nextlevel /usr/bin/prevlevel /usr/bin/validate

export origInstallDir=$(pwd)
levelsetname="fmlab"
failed_levels=""

echo -n "Building levels [ "
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

    if "$origInstallDir/$levelsetname$levelnumber.sh"; then
        :
    else
        failed_levels="$failed_levels $levelToBuild"
    fi
    cd "$origInstallDir" || exit 1
done
echo "]"

if [ -n "$failed_levels" ]; then
    echo "Build failed for:$failed_levels"
    echo "Run sh cleanup.sh, fix the errors above, then install again."
    exit 1
fi

echo "done"

su - fmlab1
