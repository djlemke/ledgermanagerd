#!/data/data/com.termux/files/usr/bin/sh
number="$1"
args="$2"

if [ $# -eq 1 ]; then
	response="$(cat <<EOF
Not enough arguments. Do it like this:
received <account code> <amount>
\nFor example:
received J 20
EOF
)"
	echo "$response"
	termux-sms-send -n "$number" "$response"
else
	account="$(echo "$args" | cut -d " " -f1)"
	amount="$(echo "$args" | cut -d " " -s -f2)"
	valid_account="$(grep -i -w "$account" data/account-codes.txt)"
	
	if [ ! -z "$valid_account" -a "$valid_account" != " " ]; then
		if [ ! -z "$amount" -a "$amount" != " " ]; then
			response="$(cat <<EOF
Balance updated for $account with $amount.
EOF
)"
			echo "$response"
			./commands/increase-balance.sh "$account" "$amount"
			termux-sms-send -n "$number" "$response"
		else
			response="$(cat <<EOF
You forgot the amount! Try again.
EOF
)"
			echo "$response"
			termux-sms-send -n "$number" "$response"
		fi
	else
		response="$(cat <<EOF
That is an invalid account. Type "codes" to see account codes."
EOF
)"
		echo "$response"
		termux-sms-send -n "$number" "$response"
	fi
fi
