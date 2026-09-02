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

levelinstructions="The evidence directory needs a new file named $target_summary. The directory has other reference notes with normal filenames, but only $target_summary is required. This level practices touch. Run validate when finished and submit the printed key to the exercise grading form."
format_block "$levelinstructions" >> "$readMeLocation"

finish_level
