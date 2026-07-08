#!/bin/sh

cd "$origInstallDir" || exit 1
. ./resources.sh
home="/home/$levelToBuild"
threat_id=$(echo "$level_HASH" | cut -c 3)
target_threat=$(threat_name "$threat_id")
mkdir -p "$home/downloads" "$home/quarantine"
for hex in $hex_options; do
    decoy_file=$(download_name "$hex")
    echo "normal download: $decoy_file" > "$home/downloads/$decoy_file"
done
echo "suspicious binary sample" > "$home/downloads/$target_threat"

cat > "/opt/fmlab/validators/$levelToBuild" <<EOF
#!/bin/sh
home="/home/$levelToBuild"
if [ -f "$home/quarantine/$target_threat" ] && [ ! -e "$home/downloads/$target_threat" ] && [ -f "$home/downloads/browser_setup.exe" ] && [ -f "$home/downloads/vpn_client.exe" ]; then
    echo "Level complete. Completion code: $completion_code"
    echo "Run nextlevel when you are ready."
    exit 0
fi
echo "Not yet. $target_threat should be in quarantine, no longer in downloads, and the normal downloads should remain."
exit 1
EOF

levelinstructions="The downloads folder contains normal-looking files and one suspicious file: $target_threat. That suspicious file should end up in quarantine, and the other downloads should stay in place. This level practices mv. Run validate when finished."
format_block "$levelinstructions" >> "/home/$readMeLocation"
finish_level
