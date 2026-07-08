#!/bin/sh

cd "$origInstallDir" || exit 1
. ./resources.sh
home="/home/$levelToBuild"
case_id=$(echo "$level_HASH" | cut -c 1)
case_slug=$(case_name "$case_id")
target_case="case2026-$case_slug"
mkdir -p "$home/workspace"
for hex in $hex_options; do
    slug=$(case_name "$hex")
    if [ "$slug" != "$case_slug" ]; then
        mkdir -p "$home/workspace/case2026-$slug"
    fi
done

cat > "/opt/fmlab/validators/$levelToBuild" <<EOF
#!/bin/sh
home="/home/$levelToBuild"
target_case="$target_case"
if [ -d "$home/workspace/$target_case" ]; then
    echo "Level complete. Completion code: $completion_code"
    echo "Run nextlevel when you are ready."
    exit 0
fi
echo "Not yet. The workspace directory is still missing $target_case."
exit 1
EOF

levelinstructions="The workspace directory is missing one case folder named $target_case. Add that folder to workspace, then run validate. This level practices mkdir."
format_block "$levelinstructions" >> "/home/$readMeLocation"
finish_level
