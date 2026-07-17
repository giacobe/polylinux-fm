#!/bin/sh

cd "$origInstallDir" || exit 1
. ./resources.sh
home="/home/$levelToBuild"
summary_id=$(echo "$level_HASH" | cut -c 1)
target_summary=$(summary_name "$summary_id")
mkdir -p "$home/evidence"
echo "Place the response summary here." > "$home/evidence/README_evidence.txt"
for hex in $hex_options; do
    note_file=$(note_name "$hex")
    echo "Reference note for $note_file" > "$home/evidence/$note_file"
done

levelinstructions="The evidence directory needs a new file named $target_summary. The folder has other reference notes with normal filenames, but only $target_summary is required. This level practices touch. Run validate when finished."
format_block "$levelinstructions" >> "/home/$readMeLocation"

prepare_level_home
run_as_level_user "touch '$home/evidence/$target_summary'"
expected_hash=$(state_hash "$home")
rm -f "$home/evidence/$target_summary"


