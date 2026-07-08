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

fruit_name() {
    case "$1" in
        0) echo "apple" ;;
        1) echo "banana" ;;
        2) echo "orange" ;;
        3) echo "pear" ;;
        4) echo "grape" ;;
        5) echo "melon" ;;
        6) echo "peach" ;;
        7) echo "plum" ;;
        8) echo "mango" ;;
        9) echo "kiwi" ;;
        a) echo "lemon" ;;
        b) echo "lime" ;;
        c) echo "cherry" ;;
        d) echo "papaya" ;;
        e) echo "apricot" ;;
        f) echo "fig" ;;
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

format_block() {
    input="$1"
    divline="*************************************************************************"
    printf "%s\n" "$divline"
    printf "%s\n" "$input" | fold -s -w 70 | while IFS= read -r line; do
        printf "* %-70s*\n" "$line"
    done
    printf "%s\n" "$divline"
}

finish_level() {
    chown -R "$levelToBuild:$levelToBuild" "/home/$levelToBuild"
    chmod -R o-rx "/home/$levelToBuild"
    chmod 755 "/opt/fmlab/validators/$levelToBuild"
}
