#!/bin/sh

cd "$origInstallDir" || exit 1
. ./resources.sh
home="/home/$levelToBuild"
category_id=$(echo "$level_HASH" | cut -c 4)
bad_category_id=$(echo "$level_HASH" | cut -c 5)
bad_item_id=$(echo "$level_HASH" | cut -c 6)
category_line=$(hex_line "$category_id")
bad_category_line=$(hex_line "$bad_category_id")
bad_item_line=$(hex_line "$bad_item_id")
wordbank_root="$origInstallDir/wordbanks/remove_level"
target_dir=$(sed -n "${category_line}p" "$wordbank_root/categories.txt")

if [ "$bad_category_line" = "$category_line" ]; then
    bad_category_line=$((bad_category_line % 16 + 1))
fi
bad_source=$(sed -n "${bad_category_line}p" "$wordbank_root/categories.txt")
target_bad=$(sed -n "${bad_item_line}p" "$wordbank_root/$bad_source.txt")
required_files=""

mkdir -p "$home/$target_dir"
while IFS= read -r good_file; do
    [ -n "$good_file" ] || continue
    echo "expected $target_dir item" > "$home/$target_dir/$good_file"
    required_files="$required_files $good_file"
done < "$wordbank_root/$target_dir.txt"

echo "out-of-place item from $bad_source" > "$home/$target_dir/$target_bad"

cat > "/opt/fmlab/validators/$levelToBuild" <<EOF
#!/bin/sh
home="/home/$levelToBuild"
target_dir="$target_dir"
target_bad="$target_bad"
ok=1
[ ! -e "$home/$target_dir/$target_bad" ] || ok=0
for required_file in $required_files; do
    [ -f "$home/$target_dir/\$required_file" ] || ok=0
done
if [ "\$ok" -eq 1 ]; then
    echo "Level complete. Completion code: $completion_code"
    echo "Run nextlevel when you are ready."
    exit 0
fi
echo "Not yet. The out-of-place file should be gone from $target_dir, while the correct files stay."
exit 1
EOF

levelinstructions="The $target_dir directory contains files that belong together. One file came from a different category and does not fit. The out-of-place file should be gone, and the correct files should stay. This level practices rm. Run validate when finished."
format_block "$levelinstructions" >> "/home/$readMeLocation"
finish_level