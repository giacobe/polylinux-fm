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

levelinstructions="Your home directory contains readable user log files, such as admins.log and vendors.log. The selected log, $target_file, should be archived inside $target_dir and no longer remain in your home directory. This level combines mkdir and mv. Run validate when finished."
format_block "$levelinstructions" >> "/home/$readMeLocation"

prepare_level_home
run_as_level_user "mkdir '$home/$target_dir'"
run_as_level_user "mv '$home/$target_file' '$home/$target_dir/$target_file'"
expected_hash=$(state_hash "$home")
mv "$home/$target_dir/$target_file" "$home/$target_file"
rmdir "$home/$target_dir"

write_hash_validator

finish_level
