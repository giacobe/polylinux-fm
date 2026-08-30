#!/bin/sh

cd "$origInstallDir" || exit 1
. ./resources.sh
home="/home/$levelToBuild"
archive_id=$(echo "$level_HASH" | cut -c 7)
archive_dir_id=$(echo "$level_HASH" | cut -c 8)
target_file=$(user_log_name "$archive_id")
target_dir=$(archive_dir_name "$archive_dir_id")
for hex in $hex_options; do
    log_file=$(user_log_name "$hex")
    echo "user activity: $log_file" > "$home/$log_file"
done

levelinstructions="Your home directory contains readable user log files, such as admins.log and vendors.log. Move the selected log, $target_file, into $target_dir so it no longer remains in your home directory. This level combines mkdir and mv. Record the requested filename or directory name for the external answer form."
format_block "$levelinstructions" >> "/home/$readMeLocation"

finish_level
