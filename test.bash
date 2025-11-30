#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Toma Misono
# SPDX-License-Identifier: GPL-3.0-only

# スクリプト自身のディレクトリに移動
cd "$(dirname "$0")" || exit 1

# robosys1 が存在しなければコンパイル
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

### CONTENT TEST（10000以上）
# 12345 → 1万2345
out=$(printf "12345\n" | ./robosys1)
[ "$out" = "1万2345" ] || ng "$LINENO"

# 10001 → 1万1
out=$(printf "10001\n" | ./robosys1)
[ "$out" = "1万1" ] || ng "$LINENO"

# 90000 → 9万
out=$(printf "90000\n" | ./robosys1)
[ "$out" = "9万" ] || ng "$LINENO"

# 90500 → 9万500
out=$(printf "90500\n" | ./robosys1)
[ "$out" = "9万500" ] || ng "$LINENO"

# 90009 → 9万9
out=$(printf "90009\n" | ./robosys1)
[ "$out" = "9万9" ] || ng "$LINENO"

### VALIDATION（万表記の形式チェック）
# 出力が「数字 + 万 + 任意の数字」形式か？
# 例: 1万2345, 9万500 など
out=$(printf "12345\n" | ./robosys1)
echo "$out" | grep -qE '^[0-9]+万[0-9]*$' || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res
