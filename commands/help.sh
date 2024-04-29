#!/data/data/com.termux/files/usr/bin/sh
number="$1"
# Just "help" was sent.
if [ $# -eq 1 ]; then
	response="$(cat <<EOF
Type "help commands" to see a full list of commands.
\nSome useful commands:
\tbalance
\tcodes
\treceived
\tspent
EOF
)"
	termux-sms-send -n "$number" "$response"
# "help" was sent with an arg, such as "help commands".
elif [ $# -eq 2 -o $# -gt 2 ]; then
	help_arg="$2"
	valid="$(ls commands/help/ | grep -i "$help_arg")"
	echo $help_arg

	if [ ! -z "$valid" -a "$valid" != " " ]; then
		"./commands/help/$help_arg.sh" "$number"
	else
		response="Command not found. Try \"help commands\"."
		echo "$response"
		termux-sms-send -n "$number" "$response"
	fi
fi
