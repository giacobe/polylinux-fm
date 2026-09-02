#!/bin/sh
set -eu
cd "$(dirname "$0")"
. ./polylinux-common.sh

LAB_ID=${LAB_ID:-polylinux-fm}
USER_ID=$(normalize_email '  Student@Example.EDU  ')
currentDate=2026-08-30
SYSTEM_PASSWORD='systemPassword'
levelPassword='levelPassword1'
levelnumber=1
export LAB_ID USER_ID currentDate SYSTEM_PASSWORD levelPassword levelnumber

[ "$USER_ID" = 'student@example.edu' ]
[ "$(exercise_code_from_date "$currentDate")" = '13527DE' ]
seed_a=$(level_seed_v1)
seed_b=$(level_seed_v1)
[ "$seed_a" = "$seed_b" ]

seen='|'
index=0
while [ "$index" -lt 16 ]; do
    THEME_INDEX=$index
    export THEME_INDEX
    id=$(theme_field id)
    case "$seen" in *"|$id|"*) echo "duplicate theme id: $id" >&2; exit 1 ;; esac
    seen="$seen$id|"
    for field in title org place system project asset event status service host file person; do
        [ -n "$(theme_field "$field")" ]
    done
    index=$((index + 1))
done

for level in 1 2 3 4 5 6 7 8 9 10; do
    sh -n "./level$level.sh"
done
sh -n ./install.sh ./resources.sh ./polylinux-common.sh ./polylinux-parallel-runtime.sh ./validate

if grep -n '/home/[$]readMeLocation' ./level*.sh; then
    echo 'legacy level script prepends /home to the absolute README path' >&2
    exit 1
fi

if grep -R -n -E 'record_answer|ANSWER_DIR|/answers|checklevel' . \
    --exclude-dir=.git --exclude-dir=provenance --exclude=README.md --exclude=LEVELS.md \
    --exclude=participant-guide.md --exclude=test.sh --exclude=verify.sh; then
    echo 'client-side answer-key reference remains' >&2
    exit 1
fi

validate_case=$(mktemp -d)
trap 'rm -rf "$validate_case"' EXIT HUP INT TERM
mkdir "$validate_case/evidence"
printf '%s\n' 'fixture' > "$validate_case/evidence/item.txt"
key_a=$(POLYLINUX_VALIDATE_HOME="$validate_case" USER=level1 sh ./validate | awk '{print $4}')
key_b=$(POLYLINUX_VALIDATE_HOME="$validate_case" USER=level1 sh ./validate | awk '{print $4}')
[ "$key_a" = "$key_b" ]
case "$key_a" in
    ??????????) ;;
    *) echo "validate returned a noncanonical key: $key_a" >&2; exit 1 ;;
esac
printf '%s\n' 'changed-size' >> "$validate_case/evidence/item.txt"
key_changed=$(POLYLINUX_VALIDATE_HOME="$validate_case" USER=level1 sh ./validate | awk '{print $4}')
[ "$key_a" != "$key_changed" ] || {
    echo 'validate key did not change with filesystem state' >&2
    exit 1
}
grep -F 'cp "$INSTALL_ROOT/validate" /usr/bin/validate' ./install.sh >/dev/null
echo 'Contract, theme catalog, and shell syntax checks passed.'
