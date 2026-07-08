#!/bin/sh

cd "$origInstallDir" || exit 1
. ./resources.sh
home="/home/$levelToBuild"
cleanup_id=$(echo "$level_HASH" | cut -c 9)
unrelated_file=$(unrelated_name "$cleanup_id")
mkdir -p "$home/incident"
cat > "$home/incident/network.log" <<DATA
10.1.4.8 connected to 203.0.113.50
10.1.4.9 connected to 198.51.100.10
DATA
echo "user export log" > "$home/incident/users.log"
for hex in $hex_options; do
    unrelated=$(unrelated_name "$hex")
    echo "unrelated file: $unrelated" > "$home/incident/$unrelated"
done

cat > "/opt/fmlab/validators/$levelToBuild" <<EOF
#!/bin/sh
home="/home/$levelToBuild"
ok=1
[ -d "$home/incident/backup" ] || ok=0
[ -d "$home/incident/quarantine" ] || ok=0
[ -f "$home/incident/network.log" ] || ok=0
[ -f "$home/incident/backup/network.log" ] || ok=0
cmp -s "$home/incident/network.log" "$home/incident/backup/network.log" || ok=0
[ -f "$home/incident/quarantine/users.log" ] || ok=0
[ ! -e "$home/incident/users.log" ] || ok=0
[ ! -e "$home/incident/$unrelated_file" ] || ok=0
if [ "\$ok" -eq 1 ]; then
    echo "Level complete. Completion code: $completion_code"
    echo "You finished the File Manipulation Lab."
    exit 0
fi
echo "Not yet. The incident folder needs a network log backup, users.log in quarantine, and $unrelated_file removed."
exit 1
EOF

levelinstructions="Complete the incident response workflow inside incident. The network log needs a matching backup copy, users.log should be quarantined, and $unrelated_file should be removed because it is unrelated to the incident. Run validate when finished."
format_block "$levelinstructions" >> "/home/$readMeLocation"
finish_level
