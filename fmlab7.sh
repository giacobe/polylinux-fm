#!/bin/sh

cd "$origInstallDir" || exit 1
. ./resources.sh
home="/home/$levelToBuild"
backup_id=$(echo "$level_HASH" | cut -c 6)
target_base=$(log_name "$backup_id")
target_log="$target_base.log"
target_backup_dir="case_backup"
mkdir -p "$home/evidence"
for hex in $hex_options; do
    log_base=$(log_name "$hex")
    cat > "$home/evidence/$log_base.log" <<DATA
09:00 $log_base login accepted
09:03 $log_base privilege escalation blocked
09:15 $log_base session closed
DATA
done

cat > "/opt/fmlab/validators/$levelToBuild" <<EOF
#!/bin/sh
home="/home/$levelToBuild"
if [ -d "$home/$target_backup_dir" ] && [ -f "$home/evidence/$target_log" ] && [ -f "$home/$target_backup_dir/$target_log" ] && cmp -s "$home/evidence/$target_log" "$home/$target_backup_dir/$target_log"; then
    echo "Level complete. Completion code: $completion_code"
    echo "Run nextlevel when you are ready."
    exit 0
fi
echo "Not yet. $target_backup_dir should contain $target_log, and evidence/$target_log should still exist."
exit 1
EOF

levelinstructions="The evidence folder contains named logs. The selected log, $target_log, needs a preserved copy inside $target_backup_dir, and the original should remain in evidence. This level combines mkdir and cp. Run validate when finished."
format_block "$levelinstructions" >> "/home/$readMeLocation"
finish_level
