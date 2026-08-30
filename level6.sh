#!/bin/sh

cd "$origInstallDir" || exit 1
. ./resources.sh
home="/home/$levelToBuild"
old_id=$(echo "$level_HASH" | cut -c 5)
old_slug=$(case_name "$old_id")
target_old="old-$old_slug"
required_active=""
mkdir -p "$home/cases"
for hex in $hex_options; do
    slug=$(case_name "$hex")
    if [ "$slug" = "$old_slug" ]; then
        mkdir -p "$home/cases/$target_old"
    else
        active_dir="case-$slug"
        mkdir -p "$home/cases/$active_dir"
        echo "active investigation: $active_dir" > "$home/cases/$active_dir/notes.txt"
        required_active="$required_active $active_dir"
    fi
done

levelinstructions="The cases directory contains readable case directories. The empty old case directory is cases/$target_old. Remove that old case directory, and leave active cases with notes in place. This level practices rmdir. Record the requested filename or directory name for the external answer form."
format_block "$levelinstructions" >> "$readMeLocation"

finish_level
