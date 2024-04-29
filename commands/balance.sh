#!/data/data/com.termux/files/usr/bin/sh
number="$1"
balances="$(IFS='' cat data/account-balances.txt)"
echo "$balances"
termux-sms-send -n "$number" "$balances"
