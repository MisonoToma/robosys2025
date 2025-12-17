#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Toma Misono
# SPDX-License-Identifier: GPL-3.0-only

cd "$(dirname "$0")" || exit 1

if [ ! -x ./unit_conversion ]; then
    if [ ! -f ./unit_conversion.c ]; then
        echo "Error: unit_conversion.c が見つかりません"
        exit 1
    fi
    gcc unit_conversion.c -o unit_conversion || exit 1
    chmod +x ./unit_conversion
fi

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

out=$(printf "63828\n" | ./unit_conversion)
[ "$out" = "6万3828" ] || ng "$LINENO"

out=$(printf "10008\n" | ./unit_conversion)
[ "$out" = "1万8" ] || ng "$LINENO"

out=$(printf "10000\n" | ./unit_conversion)
[ "$out" = "1万" ] || ng "$LINENO"

out=$(printf "90500\n" | ./unit_conversion)
[ "$out" = "9万500" ] || ng "$LINENO"

out=$(printf "80060\n" | ./unit_conversion)
[ "$out" = "8万60" ] || ng "$LINENO"

out=$(printf "609382\n" | ./unit_conversion)
[ "$out" = "60万9382" ] || ng "$LINENO"

out=$(printf "6009382\n" | ./unit_conversion)
[ "$out" = "600万9382" ] || ng "$LINENO"

out=$(printf "60009382\n" | ./unit_conversion)
[ "$out" = "6000万9382" ] || ng "$LINENO"

out=$(printf "019278\n" | ./unit_conversion)
[ "$out" = "1万9278" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res
