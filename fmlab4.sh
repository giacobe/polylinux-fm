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

levelinstructions="The downloads folder contains normal-looking files and one suspicious file: $target_threat. That suspicious file should end up in quarantine, and the other downloads should stay in place. This level practices mv. Run validate when finished."
format_block "$levelinstructions" >> "/home/$readMeLocation"

prepare_level_home
run_as_level_user "mv '$home/downloads/$target_threat' '$home/quarantine/$target_threat'"
expected_hash=$(state_hash "$home")
mv "$home/quarantine/$target_threat" "$home/downloads/$target_threat"

write_hash_validator

finish_level
