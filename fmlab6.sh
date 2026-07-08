#!/bin/sh

cd "$origInstallDir" || exit 1
. ./resources.sh
home="/home/$levelToBuild"
old_id=$(echo "$level_HASH" | cut -c 5)
old_slug=$(case_name "$old_id")
target_old="old-$old_slug"
required_active=""
mkdir -p "$home/cases"
for hex in $hex_options; do
    slug=$(case_name "$hex")
    if [ "$slug" = "$old_slug" ]; then
        mkdir -p "$home/cases/$target_old"
    else
        active_dir="case-$slug"
        mkdir -p "$home/cases/$active_dir"
        echo "active investigation: $active_dir" > "$home/cases/$active_dir/notes.txt"
        required_active="$required_active $active_dir"
    fi
done

cat > "/opt/fmlab/validators/$levelToBuild" <<EOF
#!/bin/sh
home="/home/$levelToBuild"
ok=1
[ ! -e "$home/cases/$target_old" ] || ok=0
for required_dir in $required_active; do
    [ -f "$home/cases/\$required_dir/notes.txt" ] || ok=0
done
if [ "\$ok" -eq 1 ]; then
    echo "Level complete. Completion code: $completion_code"
    echo "Run nextlevel when you are ready."
    exit 0
fi
echo "Not yet. cases/$target_old should be gone, and the active case folders should still have their notes."
exit 1
EOF

levelinstructions="The cases directory contains readable case folders. The empty old case directory is cases/$target_old. That old case should be gone, while active cases with notes should stay. This level practices rmdir. Run validate when finished."
format_block "$levelinstructions" >> "/home/$readMeLocation"
finish_level
