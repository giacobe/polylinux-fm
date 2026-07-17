#!/bin/sh

cd "$origInstallDir" || exit 1
. ./resources.sh
home="/home/$levelToBuild"
backup_id=$(echo "$level_HASH" | cut -c 6)
backup_dir_id=$(echo "$level_HASH" | cut -c 7)
target_base=$(log_name "$backup_id")
target_log="$target_base.log"
target_backup_dir=$(backup_dir_name "$backup_dir_id")
mkdir -p "$home/evidence"
for hex in $hex_options; do
    log_base=$(log_name "$hex")
    cat > "$home/evidence/$log_base.log" <<DATA
09:00 $log_base login accepted
09:03 $log_base privilege escalation blocked
09:15 $log_base session closed
DATA
done

levelinstructions="The evidence folder contains named logs. The selected log, $target_log, needs a preserved copy inside $target_backup_dir, and the original should remain in evidence. This level combines mkdir and cp. Run validate when finished."
format_block "$levelinstructions" >> "/home/$readMeLocation"

prepare_level_home
run_as_level_user "mkdir '$home/$target_backup_dir'"
run_as_level_user "cp '$home/evidence/$target_log' '$home/$target_backup_dir/$target_log'"
expected_hash=$(state_hash "$home")
rm -rf "$home/$target_backup_dir"


