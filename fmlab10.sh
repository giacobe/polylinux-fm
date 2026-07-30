#!/bin/sh

cd "$origInstallDir" || exit 1
. ./resources.sh
home="/home/$levelToBuild"
cleanup_id=$(echo "$level_HASH" | cut -c 9)
backup_log_id=$(echo "$level_HASH" | cut -c 10)
quarantine_log_id=$(echo "$level_HASH" | cut -c 11)
backup_dir_id=$(echo "$level_HASH" | cut -c 12)
quarantine_dir_id=$(echo "$level_HASH" | cut -c 13)
empty_dir_id=$(echo "$level_HASH" | cut -c 14)
marker_id=$(echo "$level_HASH" | cut -c 15)
unrelated_file=$(unrelated_name "$cleanup_id")
target_backup_base=$(log_name "$backup_log_id")
target_backup_log="$target_backup_base.log"
target_quarantine_log=$(user_log_name "$quarantine_log_id")
target_backup_dir=$(backup_dir_name "$backup_dir_id")
target_quarantine_dir=$(quarantine_dir_name "$quarantine_dir_id")
target_empty_dir=$(cleanup_dir_name "$empty_dir_id")
target_marker=$(completion_marker_name "$marker_id")
mkdir -p "$home/incident"
for hex in $hex_options; do
    log_base=$(log_name "$hex")
    cat > "$home/incident/$log_base.log" <<DATA
10.1.4.8 checked $log_base service
10.1.4.9 reviewed $log_base activity
DATA
done
for hex in $hex_options; do
    user_log=$(user_log_name "$hex")
    echo "user export log: $user_log" > "$home/incident/$user_log"
done
for hex in $hex_options; do
    unrelated=$(unrelated_name "$hex")
    echo "unrelated file: $unrelated" > "$home/incident/$unrelated"
done
mkdir -p "$home/incident/$target_empty_dir"

levelinstructions="Complete the incident response workflow inside incident. Copy $target_backup_log into $target_backup_dir, move $target_quarantine_log into $target_quarantine_dir, remove $unrelated_file, remove the empty directory $target_empty_dir, and create a completion marker named $target_marker in incident. This final level combines mkdir, cp, mv, rm, rmdir, and touch. Run validate when finished."
format_block "$levelinstructions" >> "/home/$readMeLocation"

finish_level
