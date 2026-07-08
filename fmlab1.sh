#!/bin/sh

cd "$origInstallDir" || exit 1
. ./resources.sh
home="/home/$levelToBuild"
mkdir -p "$home/evidence"
echo "Place the response summary here." > "$home/evidence/README_evidence.txt"
for hex in $hex_options; do
    note_file=$(note_name "$hex")
    echo "Reference note for $note_file" > "$home/evidence/$note_file"
done

cat > "/opt/fmlab/validators/$levelToBuild" <<EOF
#!/bin/sh
home="/home/$levelToBuild"
if [ -f "$home/evidence/response_summary.txt" ]; then
    echo "Level complete. Completion code: $completion_code"
    echo "Run nextlevel when you are ready."
    exit 0
fi
echo "Not yet. The evidence directory still needs response_summary.txt."
exit 1
EOF

levelinstructions="The evidence directory needs a new file named response_summary.txt. The folder has other reference notes with normal filenames, but only response_summary.txt is required. This level practices touch. Run validate when finished."
format_block "$levelinstructions" >> "/home/$readMeLocation"
finish_level
