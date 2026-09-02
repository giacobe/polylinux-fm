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

levelinstructions="The workspace directory is missing one case directory named $target_case. Create that directory inside workspace. This level practices mkdir. Run validate when finished and submit the printed key to the exercise grading form."
format_block "$levelinstructions" >> "$readMeLocation"

finish_level
