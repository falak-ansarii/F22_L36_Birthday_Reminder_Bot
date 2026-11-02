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
  1) feature_1 ;; 2) feature_2 ;; 3) feature_3 ;; 4) feature_4 ;;
  5) feature_5 ;; 6) view_data ;; 7) do_backup ;; 8) view_log ;;
  0) echo "Bye!"; break ;;
  *) echo "Invalid choice, try again." ;;
 esac
done
