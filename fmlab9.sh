#!/bin/sh

cd "$origInstallDir" || exit 1
. ./resources.sh
home="/home/$levelToBuild"
case_id=$(echo "$level_HASH" | cut -c 8)
case_slug=$(case_name "$case_id")
target_root="investigation-$case_slug"
target_notes="case_notes.txt"
mkdir -p "$home/templates"
for hex in $hex_options; do
    slug=$(case_name "$hex")
    echo "template for investigation-$slug" > "$home/templates/investigation-$slug.txt"
done
cat > "$home/$target_notes" <<DATA
Case $case_slug opened for suspicious login activity.
Preserve notes before deeper investigation.
DATA

cat > "/opt/fmlab/validators/$levelToBuild" <<EOF
#!/bin/sh
home="/home/$levelToBuild"
if [ -d "$home/$target_root/evidence" ] && [ -d "$home/$target_root/backup" ] && [ -f "$home/$target_notes" ] && [ -f "$home/$target_root/backup/$target_notes" ] && cmp -s "$home/$target_notes" "$home/$target_root/backup/$target_notes"; then
    echo "Level complete. Completion code: $completion_code"
    echo "Run nextlevel when you are ready."
    exit 0
fi
echo "Not yet. $target_root should have evidence and backup folders, and backup should contain $target_notes."
exit 1
EOF

levelinstructions="Build the investigation structure $target_root. It should contain evidence and backup folders, and the backup folder should contain a preserved copy of $target_notes. This level combines mkdir and cp. Run validate when finished."
format_block "$levelinstructions" >> "/home/$readMeLocation"
finish_level
