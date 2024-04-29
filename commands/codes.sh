#!/data/data/com.termux/files/usr/bin/sh
number="$1"
codes="$(IFS='' cat data/account-codes.txt)"
echo "$codes"
termux-sms-send -n "$number" "$codes"
