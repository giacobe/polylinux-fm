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
wordbank_root="$origInstallDir/words"
target_dir=$(sed -n "${category_line}p" "$wordbank_root/categories.txt" | tr -d '\r')

if [ "$bad_category_line" = "$category_line" ]; then
    bad_category_line=$((bad_category_line % 16 + 1))
fi
bad_source=$(sed -n "${bad_category_line}p" "$wordbank_root/categories.txt" | tr -d '\r')
target_bad=$(sed -n "${bad_item_line}p" "$wordbank_root/$bad_source.txt" | tr -d '\r')
required_files=""

mkdir -p "$home/$target_dir"
while IFS= read -r good_file; do
    good_file=$(printf "%s" "$good_file" | tr -d '\r')
    [ -n "$good_file" ] || continue
    echo "expected $target_dir item" > "$home/$target_dir/$good_file"
    required_files="$required_files $good_file"
done < "$wordbank_root/$target_dir.txt"

echo "out-of-place item from $bad_source" > "$home/$target_dir/$target_bad"

levelinstructions="The $target_dir directory contains files that belong together. One file came from a different category and does not fit. Remove the out-of-place file, and leave the correct files in place. This level practices rm. Record the requested filename or directory name for the external answer form."
format_block "$levelinstructions" >> "/home/$readMeLocation"

finish_level
