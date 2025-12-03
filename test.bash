#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Toma Misono
# SPDX-License-Identifier: GPL-3.0-only

cd "$(dirname "$0")" || exit 1

if [ ! -x ./robosys1 ]; then
    if [ ! -f ./robosys1.c ]; then
        echo "Error: robosys1.c が見つかりません"
        exit 1
    fi
    gcc robosys1.c -o robosys1 || exit 1
    chmod +x ./robosys1
fi

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

out=$(printf "63828\n" | ./robosys1)
[ "$out" = "6万3828" ] || ng "$LINENO"

out=$(printf "10008\n" | ./robosys1)
[ "$out" = "1万8" ] || ng "$LINENO"

out=$(printf "10000\n" | ./robosys1)
[ "$out" = "1万" ] || ng "$LINENO"

out=$(printf "90500\n" | ./robosys1)
[ "$out" = "9万500" ] || ng "$LINENO"

out=$(printf "80060\n" | ./robosys1)
[ "$out" = "8万60" ] || ng "$LINENO"

out=$(printf "609382\n" | ./robosys1)
[ "$out" = "60万9382" ] || ng "$LINENO"

out=$(printf "6009382\n" | ./robosys1)
[ "$out" = "600万9382" ] || ng "$LINENO"

out=$(printf "60009382\n" | ./robosys1)
[ "$out" = "6000万9382" ] || ng "$LINENO"

out=$(printf "019278\n" | ./robosys1)
[ "$out" = "1万9278" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res
