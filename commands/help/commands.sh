#!/data/data/com.termux/files/usr/bin/sh
number="$1"
response=$(cat <<EOF
Full list of commands:
\thelp
\tbalance
\tcodes
\treceived
\tspent
EOF
)

echo "$response"
termux-sms-send -n "$number" "$response"
