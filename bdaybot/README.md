# L36 – Birthday Reminder Bot

Student: Falak Ansari | Roll: F22 | Division: G | Enrollment: 24004501210018

Bash shell scripting project for Ubuntu on WSL.

- `main.sh`: menu and command-line options
- `lib/functions.sh`: project functions
- `data/birthdays.csv`: birthday records
- `reports/`: generated reports
- `backups/`: compressed backups
- `logs/`: activity logs

Run:
```bash
chmod +x main.sh lib/functions.sh
./main.sh
```

Cron example:
```cron
1 0 * * * /bin/bash "$HOME/linux_project/bdaybot/main.sh" --cron >> "$HOME/linux_project/bdaybot/logs/cron.log" 2>&1
```

Note: feature_1 through feature_5 currently contain TODO placeholders. The cron function only logs that it ran; it does not yet calculate birthdays or create birthdays_today.txt.
