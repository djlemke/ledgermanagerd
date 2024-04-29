#!/data/data/com.termux/files/usr/bin/sh
account="$1"
account="$(echo $account | tr '[:lower:]' '[:upper:]')"
amount="$2"
total="$(grep -i -w "$account" data/account-balances.txt)"
total="$(echo "$total" | cut -f2)"
new_total="$(echo 2 k "$total" "$amount" - p | dc)"
sed -i "s/$account\t$total/$account\t$new_total/g" data/account-balances.txt
