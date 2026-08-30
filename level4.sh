#!/bin/sh

cd "$origInstallDir" || exit 1
. ./resources.sh
home="/home/$levelToBuild"
threat_id=$(echo "$level_HASH" | cut -c 3)
target_threat=$(threat_name "$threat_id")
mkdir -p "$home/downloads" "$home/quarantine"
for hex in $hex_options; do
    decoy_file=$(download_name "$hex")
    echo "normal download: $decoy_file" > "$home/downloads/$decoy_file"
done
echo "suspicious binary sample" > "$home/downloads/$target_threat"

levelinstructions="The downloads directory contains normal-looking files and one suspicious file: $target_threat. Move that suspicious file into quarantine, and leave the other downloads in place. This level practices mv. Record the requested filename or directory name for the external answer form."
format_block "$levelinstructions" >> "$readMeLocation"

finish_level
