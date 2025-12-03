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

out=$(printf "12345\n" | ./robosys1)
[ "$out" = "1万2345" ] || ng "$LINENO"

out=$(printf "10001\n" | ./robosys1)
[ "$out" = "1万1" ] || ng "$LINENO"

out=$(printf "90000\n" | ./robosys1)
[ "$out" = "9万" ] || ng "$LINENO"

out=$(printf "90500\n" | ./robosys1)
[ "$out" = "9万500" ] || ng "$LINENO"

out=$(printf "90009\n" | ./robosys1)
[ "$out" = "9万9" ] || ng "$LINENO"

out=$(printf "019278\n" | ./robosys1)
[ "$out" = "1万9278" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res
