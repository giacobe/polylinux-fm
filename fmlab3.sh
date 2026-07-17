#!/bin/sh

cd "$origInstallDir" || exit 1
. ./resources.sh
home="/home/$levelToBuild"
log_id=$(echo "$level_HASH" | cut -c 2)
target_base=$(log_name "$log_id")
target_log="$target_base.log"
target_backup="$target_base""_backup.log"
mkdir -p "$home/evidence"
for hex in $hex_options; do
    log_base=$(log_name "$hex")
    cat > "$home/evidence/$log_base.log" <<DATA
source=$log_base action=allow
source=$log_base action=deny
DATA
done

levelinstructions="The evidence directory contains several named logs. It needs a backup copy named $target_backup that matches $target_log, and the original log file must remain. This level practices cp. Run validate when finished."
format_block "$levelinstructions" >> "/home/$readMeLocation"

prepare_level_home
run_as_level_user "cp '$home/evidence/$target_log' '$home/evidence/$target_backup'"
expected_hash=$(state_hash "$home")
rm -f "$home/evidence/$target_backup"

write_hash_validator

finish_level
