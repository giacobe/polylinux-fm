#!/bin/sh

cd "$origInstallDir" || exit 1
. ./resources.sh
home="/home/$levelToBuild"
case_id=$(echo "$level_HASH" | cut -c 8)
note_id=$(echo "$level_HASH" | cut -c 9)
evidence_dir_id=$(echo "$level_HASH" | cut -c 10)
backup_dir_id=$(echo "$level_HASH" | cut -c 11)
case_slug=$(case_name "$case_id")
target_root="investigation-$case_slug"
target_notes=$(investigation_note_name "$note_id")
target_evidence_dir=$(investigation_dir_name "$evidence_dir_id")
target_backup_dir=$(backup_dir_name "$backup_dir_id")
mkdir -p "$home/templates"
for hex in $hex_options; do
    slug=$(case_name "$hex")
    echo "template for investigation-$slug" > "$home/templates/investigation-$slug.txt"
done
cat > "$home/$target_notes" <<DATA
Case $case_slug opened for suspicious login activity.
Preserve notes before deeper investigation.
DATA

levelinstructions="Build the investigation structure $target_root. It should contain $target_evidence_dir and $target_backup_dir directories, and the $target_backup_dir directory should contain a copied version of $target_notes. This level combines mkdir and cp. Record the requested filename or directory name for the external answer form."
format_block "$levelinstructions" >> "/home/$readMeLocation"

finish_level
