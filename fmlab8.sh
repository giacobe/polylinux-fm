#!/bin/sh

cd "$origInstallDir" || exit 1
. ./resources.sh
home="/home/$levelToBuild"
archive_id=$(echo "$level_HASH" | cut -c 7)
target_file=$(user_log_name "$archive_id")
target_dir="evidence"
for hex in $hex_options; do
    log_file=$(user_log_name "$hex")
    echo "user activity: $log_file" > "$home/$log_file"
done

cat > "/opt/fmlab/validators/$levelToBuild" <<EOF
#!/bin/sh
home="/home/$levelToBuild"
if [ -d "$home/$target_dir" ] && [ -f "$home/$target_dir/$target_file" ] && [ ! -e "$home/$target_file" ]; then
    echo "Level complete. Completion code: $completion_code"
    echo "Run nextlevel when you are ready."
    exit 0
fi
echo "Not yet. $target_file should be inside $target_dir and no longer in your home directory."
exit 1
EOF

levelinstructions="Your home directory contains readable user log files, such as admins.log and vendors.log. The selected log, $target_file, should be archived inside $target_dir and no longer remain in your home directory. This level combines mkdir and mv. Run validate when finished."
format_block "$levelinstructions" >> "/home/$readMeLocation"
finish_level
