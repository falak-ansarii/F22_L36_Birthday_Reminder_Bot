#!/bin/bash
DATA="data/birthdays.csv"
LOG="logs/activity.log"
log() { echo "$(date '+%Y-%m-%d %H:%M:%S') | $*" >> "$LOG"; }
check_data() { if [ ! -e "$DATA" ]; then echo "Data not found: $DATA"; return 1; fi; }
show_help() { echo "Usage: ./main.sh"; echo "./main.sh --help"; echo "./main.sh --backup"; echo "./main.sh --cron"; }
view_data() { check_data || return; if [ -d "$DATA" ]; then ls -l "$DATA"; else cat -n "$DATA" | more; fi; }
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
cron_task() { echo "$(date '+%Y-%m-%d %H:%M') cron task ran" >> reports/cron_output.txt; log "cron task ran"; }
