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

cat > "/opt/fmlab/validators/$levelToBuild" <<EOF
#!/bin/sh
home="/home/$levelToBuild"
if [ -f "$home/evidence/$target_log" ] && [ -f "$home/evidence/$target_backup" ] && cmp -s "$home/evidence/$target_log" "$home/evidence/$target_backup"; then
    echo "Level complete. Completion code: $completion_code"
    echo "Run nextlevel when you are ready."
    exit 0
fi
echo "Not yet. The evidence directory needs $target_backup to match $target_log, and the original log file must remain."
exit 1
EOF

levelinstructions="The evidence directory contains several named logs. It needs a backup copy named $target_backup that matches $target_log, and the original log file must remain. This level practices cp. Run validate when finished."
format_block "$levelinstructions" >> "/home/$readMeLocation"
finish_level
