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

out=$(echo 63828 | ./unit_conversion)
[ "${out}" = 6万3828 ] || ng "$LINENO"

out=$(echo 10008 | ./unit_conversion)
[ "${out}" = 1万8 ] || ng "$LINENO"

out=$(echo 10000 | ./unit_conversion)
[ "${out}" = 1万 ] || ng "$LINENO"

out=$(echo 90500 | ./unit_conversion)
[ "${out}" = 9万500 ] || ng "$LINENO"

out=$(echo 80060 | ./unit_conversion)
[ "${out}" = 8万60 ] || ng "$LINENO"

out=$(echo 609382 | ./unit_conversion)
[ "${out}" = 60万9382 ] || ng "$LINENO"

out=$(echo 6009382 | ./unit_conversion)
[ "${out}" = 600万9382 ] || ng "$LINENO"

out=$(echo 60009382 | ./unit_conversion)
[ "${out}" = 6000万9382 ] || ng "$LINENO"

out=$(echo 019278 | ./unit_conversion)
[ "${out}" = 1万9278 ] || ng "$LINENO"

out=$(echo 1 | ./unit_conversion)
[ "${out}" = 1 ] || ng "$LINENO"

out=$(echo 10 | ./unit_conversion)
[ "${out}" = 10 ] || ng "$LINENO"

out=$(echo 379 | ./unit_conversion)
[ "${out}" = 379 ] || ng "$LINENO"

out=$(echo 9290 | ./unit_conversion)
[ "${out}" = 9290 ] || ng "$LINENO"

out=$(echo 0 | ./unit_conversion)
[ "${out}" = 0 ] || ng "$LINENO"

out=$(echo あ | ./unit_conversion)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo -1 | ./unit_conversion)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo 100000000 | ./unit_conversion)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo a | ./unit_conversion)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./unit_conversion)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res
