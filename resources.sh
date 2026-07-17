#!/bin/sh

hex_options="0 1 2 3 4 5 6 7 8 9 a b c d e f"

hex_line() {
    case "$1" in
        0) echo "1" ;;
        1) echo "2" ;;
        2) echo "3" ;;
        3) echo "4" ;;
        4) echo "5" ;;
        5) echo "6" ;;
        6) echo "7" ;;
        7) echo "8" ;;
        8) echo "9" ;;
        9) echo "10" ;;
        a) echo "11" ;;
        b) echo "12" ;;
        c) echo "13" ;;
        d) echo "14" ;;
        e) echo "15" ;;
        f) echo "16" ;;
    esac
}

case_name() {
    case "$1" in
        0) echo "aurora" ;;
        1) echo "beacon" ;;
        2) echo "cinder" ;;
        3) echo "drift" ;;
        4) echo "ember" ;;
        5) echo "falcon" ;;
        6) echo "harbor" ;;
        7) echo "ion" ;;
        8) echo "juniper" ;;
        9) echo "kestrel" ;;
        a) echo "lantern" ;;
        b) echo "maverick" ;;
        c) echo "nova" ;;
        d) echo "orbit" ;;
        e) echo "pulse" ;;
        f) echo "quartz" ;;
    esac
}

log_name() {
    case "$1" in
        0) echo "firewall" ;;
        1) echo "vpn" ;;
        2) echo "dns" ;;
        3) echo "proxy" ;;
        4) echo "mail" ;;
        5) echo "database" ;;
        6) echo "auth" ;;
        7) echo "endpoint" ;;
        8) echo "web" ;;
        9) echo "dhcp" ;;
        a) echo "ids" ;;
        b) echo "edr" ;;
        c) echo "storage" ;;
        d) echo "admin" ;;
        e) echo "wireless" ;;
        f) echo "cloud" ;;
    esac
}

download_name() {
    case "$1" in
        0) echo "browser_setup.exe" ;;
        1) echo "calendar_export.csv" ;;
        2) echo "driver_update.exe" ;;
        3) echo "employee_photo.jpg" ;;
        4) echo "expense_report.pdf" ;;
        5) echo "help_notes.txt" ;;
        6) echo "inventory.xlsx" ;;
        7) echo "meeting_agenda.docx" ;;
        8) echo "onboarding.pdf" ;;
        9) echo "printer_tool.exe" ;;
        a) echo "project_plan.txt" ;;
        b) echo "screenshot.png" ;;
        c) echo "service_manual.pdf" ;;
        d) echo "software_patch.zip" ;;
        e) echo "ticket_export.csv" ;;
        f) echo "vpn_client.exe" ;;
    esac
}

threat_name() {
    case "$1" in
        0) echo "keylogger.dll" ;;
        1) echo "credential_dump.exe" ;;
        2) echo "remote_shell.exe" ;;
        3) echo "packet_sniffer.bin" ;;
        4) echo "browser_hook.dll" ;;
        5) echo "dropper.exe" ;;
        6) echo "beacon_agent.dll" ;;
        7) echo "password_grabber.exe" ;;
        8) echo "macro_payload.docm" ;;
        9) echo "persistence_task.ps1" ;;
        a) echo "scraper.exe" ;;
        b) echo "backdoor.dll" ;;
        c) echo "token_stealer.exe" ;;
        d) echo "fake_update.exe" ;;
        e) echo "miner.bin" ;;
        f) echo "staging_payload.dll" ;;
    esac
}

summary_name() {
    case "$1" in
        0) echo "response_summary.txt" ;;
        1) echo "incident_summary.txt" ;;
        2) echo "triage_summary.txt" ;;
        3) echo "case_summary.txt" ;;
        4) echo "response_notes.txt" ;;
        5) echo "incident_notes.txt" ;;
        6) echo "case_brief.txt" ;;
        7) echo "triage_report.txt" ;;
        8) echo "response_report.txt" ;;
        9) echo "event_summary.txt" ;;
        a) echo "findings_summary.txt" ;;
        b) echo "action_summary.txt" ;;
        c) echo "review_notes.txt" ;;
        d) echo "case_review.txt" ;;
        e) echo "initial_report.txt" ;;
        f) echo "final_notes.txt" ;;
    esac
}

user_log_name() {
    case "$1" in
        0) echo "admins.log" ;;
        1) echo "contractors.log" ;;
        2) echo "finance.log" ;;
        3) echo "hr.log" ;;
        4) echo "interns.log" ;;
        5) echo "managers.log" ;;
        6) echo "operations.log" ;;
        7) echo "research.log" ;;
        8) echo "sales.log" ;;
        9) echo "security.log" ;;
        a) echo "support.log" ;;
        b) echo "vendors.log" ;;
        c) echo "visitors.log" ;;
        d) echo "warehouse.log" ;;
        e) echo "webteam.log" ;;
        f) echo "users.log" ;;
    esac
}

backup_dir_name() {
    case "$1" in
        0) echo "case_backup" ;;
        1) echo "log_backup" ;;
        2) echo "evidence_backup" ;;
        3) echo "preserved_logs" ;;
        4) echo "backup_copy" ;;
        5) echo "case_archive" ;;
        6) echo "log_archive" ;;
        7) echo "review_backup" ;;
        8) echo "saved_logs" ;;
        9) echo "copied_evidence" ;;
        a) echo "preserved_evidence" ;;
        b) echo "case_records" ;;
        c) echo "backup_records" ;;
        d) echo "retained_logs" ;;
        e) echo "safe_copy" ;;
        f) echo "evidence_copy" ;;
    esac
}

archive_dir_name() {
    case "$1" in
        0) echo "evidence" ;;
        1) echo "archive" ;;
        2) echo "review" ;;
        3) echo "preserved" ;;
        4) echo "collected" ;;
        5) echo "records" ;;
        6) echo "casefiles" ;;
        7) echo "holding" ;;
        8) echo "log_archive" ;;
        9) echo "user_archive" ;;
        a) echo "activity_archive" ;;
        b) echo "saved_records" ;;
        c) echo "evidence_hold" ;;
        d) echo "review_queue" ;;
        e) echo "triage_files" ;;
        f) echo "collected_logs" ;;
    esac
}

investigation_dir_name() {
    case "$1" in
        0) echo "evidence" ;;
        1) echo "findings" ;;
        2) echo "artifacts" ;;
        3) echo "collected" ;;
        4) echo "casefiles" ;;
        5) echo "records" ;;
        6) echo "triage" ;;
        7) echo "review" ;;
        8) echo "materials" ;;
        9) echo "logs" ;;
        a) echo "notes" ;;
        b) echo "supporting" ;;
        c) echo "captures" ;;
        d) echo "timeline" ;;
        e) echo "scope" ;;
        f) echo "analysis" ;;
    esac
}

investigation_note_name() {
    case "$1" in
        0) echo "case_notes.txt" ;;
        1) echo "timeline_notes.txt" ;;
        2) echo "triage_notes.txt" ;;
        3) echo "finding_notes.txt" ;;
        4) echo "interview_notes.txt" ;;
        5) echo "scope_notes.txt" ;;
        6) echo "incident_notes.txt" ;;
        7) echo "review_notes.txt" ;;
        8) echo "evidence_notes.txt" ;;
        9) echo "activity_notes.txt" ;;
        a) echo "case_brief.txt" ;;
        b) echo "investigation_notes.txt" ;;
        c) echo "opening_notes.txt" ;;
        d) echo "analysis_notes.txt" ;;
        e) echo "handoff_notes.txt" ;;
        f) echo "summary_notes.txt" ;;
    esac
}

quarantine_dir_name() {
    case "$1" in
        0) echo "quarantine" ;;
        1) echo "isolated" ;;
        2) echo "contained" ;;
        3) echo "review_hold" ;;
        4) echo "restricted" ;;
        5) echo "holding_area" ;;
        6) echo "case_hold" ;;
        7) echo "segregated" ;;
        8) echo "locked" ;;
        9) echo "evidence_hold" ;;
        a) echo "triage_hold" ;;
        b) echo "safe_hold" ;;
        c) echo "review_queue" ;;
        d) echo "restricted_logs" ;;
        e) echo "contained_logs" ;;
        f) echo "quarantine_bin" ;;
    esac
}

note_name() {
    case "$1" in
        0) echo "timeline.txt" ;;
        1) echo "contacts.txt" ;;
        2) echo "devices.txt" ;;
        3) echo "accounts.txt" ;;
        4) echo "network_notes.txt" ;;
        5) echo "triage.txt" ;;
        6) echo "interview.txt" ;;
        7) echo "screenshots.txt" ;;
        8) echo "hashes.txt" ;;
        9) echo "owners.txt" ;;
        a) echo "alerts.txt" ;;
        b) echo "systems.txt" ;;
        c) echo "events.txt" ;;
        d) echo "scope.txt" ;;
        e) echo "todo.txt" ;;
        f) echo "summary_draft.txt" ;;
    esac
}

unrelated_name() {
    case "$1" in
        0) echo "lunch_menu.txt" ;;
        1) echo "parking_map.txt" ;;
        2) echo "birthday_list.txt" ;;
        3) echo "cafeteria_hours.txt" ;;
        4) echo "vacation_photo.jpg" ;;
        5) echo "recipe_notes.txt" ;;
        6) echo "office_playlist.txt" ;;
        7) echo "team_bracket.xlsx" ;;
        8) echo "travel_poster.pdf" ;;
        9) echo "wallpaper.png" ;;
        a) echo "snack_order.txt" ;;
        b) echo "movie_list.txt" ;;
        c) echo "desk_layout.txt" ;;
        d) echo "holiday_card.txt" ;;
        e) echo "printer_coupon.pdf" ;;
        f) echo "coffee_menu.txt" ;;
    esac
}

cleanup_dir_name() {
    case "$1" in
        0) echo "empty_review" ;;
        1) echo "stale_review" ;;
        2) echo "old_review" ;;
        3) echo "unused_review" ;;
        4) echo "retired_review" ;;
        5) echo "closed_review" ;;
        6) echo "blank_review" ;;
        7) echo "orphan_review" ;;
        8) echo "archived_review" ;;
        9) echo "hold_review" ;;
        a) echo "parked_review" ;;
        b) echo "cleared_review" ;;
        c) echo "quiet_review" ;;
        d) echo "spare_review" ;;
        e) echo "dormant_review" ;;
        f) echo "review_scratch" ;;
    esac
}

completion_marker_name() {
    case "$1" in
        0) echo "response_complete.txt" ;;
        1) echo "triage_complete.txt" ;;
        2) echo "review_complete.txt" ;;
        3) echo "incident_complete.txt" ;;
        4) echo "cleanup_complete.txt" ;;
        5) echo "case_complete.txt" ;;
        6) echo "archive_complete.txt" ;;
        7) echo "quarantine_complete.txt" ;;
        8) echo "backup_complete.txt" ;;
        9) echo "workflow_complete.txt" ;;
        a) echo "handoff_complete.txt" ;;
        b) echo "evidence_complete.txt" ;;
        c) echo "closure_marker.txt" ;;
        d) echo "final_marker.txt" ;;
        e) echo "response_marker.txt" ;;
        f) echo "done_marker.txt" ;;
    esac
}

format_block() {
    input="$1"
    divline="*************************************************************************"
    printf "%s\n" "$divline"
    printf "%s\n" "$input" | fold -s -w 70 | while IFS= read -r line; do
        printf "* %-70s*\n" "$line"
    done
    printf "%s\n" "$divline"
}

prepare_level_home() {
    chown -R "$levelToBuild:$levelToBuild" "/home/$levelToBuild"
    chmod -R o-rx "/home/$levelToBuild"
}

run_as_level_user() {
    su "$levelToBuild" -c "$1"
}

state_hash() {
    target_dir="$1"

    (
        cd "$target_dir" || exit 1
        find . ! -name ".ash_history" -exec ls -ld {} \; |
        grep -v '\.ash_history' |
        awk '{
            item_mode = $1
            item_owner = $3
            item_group = $4
            item_size = $5
            item_name = $9
            if (substr(item_mode, 1, 1) == "d") {
                item_size = 0
            }
            print item_mode, item_owner, item_group, item_size, item_name
        }' |
        sed 's# \./# #' |
        sort |
        sha256sum |
        awk '{print $1}' |
        base64 |
        tr -d '\n' |
        cut -c 1-10
    )
}

write_hash_validator() {
    cat > "/opt/fmlab/validators/$levelToBuild" <<EOF
#!/bin/sh

state_hash() {
    target_dir="\$1"

    (
        cd "\$target_dir" || exit 1
        find . ! -name ".ash_history" -exec ls -ld {} \; |
        grep -v '\.ash_history' |
        awk '{
            item_mode = \$1
            item_owner = \$3
            item_group = \$4
            item_size = \$5
            item_name = \$9
            if (substr(item_mode, 1, 1) == "d") {
                item_size = 0
            }
            print item_mode, item_owner, item_group, item_size, item_name
        }' |
        sed 's# \./# #' |
        sort |
        sha256sum |
        awk '{print \$1}' |
        base64 |
        tr -d '\n' |
        cut -c 1-10
    )
}

home="/home/$levelToBuild"
actual_hash=\$(state_hash "\$home")

echo "Your key is: \$actual_hash"
exit 0
EOF
}

finish_level() {
    prepare_level_home
    chmod 755 "/opt/fmlab/validators/$levelToBuild"
}
