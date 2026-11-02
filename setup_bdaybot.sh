#!/bin/bash
# L36 Birthday Reminder Bot Starter Kit
P="$HOME/linux_project/bdaybot"
if [ -d "$P" ]; then echo "Folder $P already exists. Rename or delete it first."; exit 1; fi
mkdir -p "$P"/lib "$P"/data "$P"/reports "$P"/backups "$P"/logs
cd "$P" || exit 1
cat > data/birthdays.csv <<'KIT_DATA'
name,dob
RIYA,2005-11-02
AMAN,2004-10-30
KIT_DATA
cat > lib/functions.sh <<'KIT_FUNCS'
#!/bin/bash
DATA="data/birthdays.csv"
LOG="logs/activity.log"
log() { echo "$(date '+%Y-%m-%d %H:%M:%S') | $*" >> "$LOG"; }
check_data() { if [ ! -e "$DATA" ]; then echo "Data not found: $DATA"; return 1; fi; }
show_help() {
 echo "Usage: ./main.sh"
 echo "       ./main.sh --help"
 echo "       ./main.sh --backup"
 echo "       ./main.sh --cron"
}
view_data() {
 check_data || return
 if [ -d "$DATA" ]; then ls -l "$DATA"; else cat -n "$DATA" | more; fi
}
do_backup() {
 f="backups/data_$(date +%Y%m%d_%H%M%S).tar.gz"
 tar -czf "$f" data/
 echo "Backup saved: $f ($(du -h "$f" | cut -f1))"
 log "backup created $f"
}
view_log() { if [ -f "$LOG" ]; then tail -n 15 "$LOG"; else echo "No activity yet."; fi; }
feature_1() { echo "== Today's birthdays =="; echo "TODO: implement feature"; log "feature_1 used"; }
feature_2() { echo "== Upcoming birthdays in 30 days =="; echo "TODO: implement feature"; log "feature_2 used"; }
feature_3() { echo "== Age calculation =="; echo "TODO: implement feature"; log "feature_3 used"; }
feature_4() { echo "== Add / delete a person =="; echo "TODO: implement feature"; log "feature_4 used"; }
feature_5() { echo "== Daily crontab check =="; echo "TODO: implement feature"; log "feature_5 used"; }
cron_task() {
 echo "$(date '+%Y-%m-%d %H:%M') cron task ran" >> reports/cron_output.txt
 log "cron task ran"
}
KIT_FUNCS
cat > main.sh <<'KIT_MAIN'
#!/bin/bash
cd "$(dirname "$0")" || exit 1
source lib/functions.sh
case "$1" in
 --help) show_help; exit 0 ;;
 --backup) do_backup; exit 0 ;;
 --cron) cron_task; exit 0 ;;
esac
while true; do
 echo
 echo '========== BIRTHDAY REMINDER BOT =========='
 echo "1) Today's birthdays"
 echo "2) Upcoming birthdays in 30 days"
 echo "3) Age calculation"
 echo "4) Add / delete a person"
 echo "5) Daily crontab check"
 echo "6) View data"
 echo "7) Backup data (tar.gz)"
 echo "8) View activity log"
 echo "0) Exit"
 read -p "Choose an option: " ch
 case "$ch" in
  1) feature_1 ;;
  2) feature_2 ;;
  3) feature_3 ;;
  4) feature_4 ;;
  5) feature_5 ;;
  6) view_data ;;
  7) do_backup ;;
  8) view_log ;;
  0) echo "Bye!"; break ;;
  *) echo "Invalid choice, try again." ;;
 esac
done
KIT_MAIN
cat > README.md <<'KIT_README'
# L36 – Birthday Reminder Bot
Student: Falak Ansari | Roll: F22 | Division: G | Enrollment: 24004501210018

Bash shell scripting project for Ubuntu on WSL.

Folders:
- main.sh: menu and command-line options
- lib/functions.sh: project functions
- data/birthdays.csv: birthday records
- reports/: generated reports
- backups/: compressed backups
- logs/: activity logs

Run:
    chmod +x main.sh lib/functions.sh
    ./main.sh

Cron example (daily at 00:01):
    1 0 * * * /bin/bash "$HOME/linux_project/bdaybot/main.sh" --cron >> "$HOME/linux_project/bdaybot/logs/cron.log" 2>&1

IMPORTANT: feature_1 through feature_5 currently contain TODO placeholders. cron_task only logs that it ran; it does not yet calculate birthdays or create birthdays_today.txt.
KIT_README
chmod +x main.sh lib/functions.sh
touch logs/activity.log
echo "Starter kit ready: $P"
ls -R "$P"
