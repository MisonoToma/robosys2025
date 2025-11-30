#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Kaito Shima
# SPDX-License-Identifier: BSD-3-Clause

# ① スクリプト自身のディレクトリに移動
cd "$(dirname "$0")" || exit 1

# ② robosys1 が存在しなければコンパイル
if [ ! -x ./robosys1 ]; then
    gcc robosys1.c -o robosys1 || exit 1
    chmod +x ./robosys1
fi

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

### EXECUTION TEST ###
# 正常終了するか？
out=$(printf "9999\n" | ./robosys1)
[ "$?" = 0 ] || ng "$LINENO"

### LINE COUNT TEST ###
# 出力行数は1行か？
lines=$(echo "$out" | wc -l)
[ "$lines" = 1 ] || ng "$LINENO"

### CONTENT TEST（10000未満）###
out=$(printf "9999\n" | ./robosys1)
[ "$out" = "9999" ] || ng "$LINENO"

### 10000以上のテスト ###
# 10000 → 1万
out=$(printf "10000\n" | ./robosys1)
[ "$out" = "1万" ] || ng "$LINENO"

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

### VALIDATION（万表記の形式チェック）###
# 出力が「数字 + 万 + 任意の数字」形式か？
# 例: 1万2345, 9万500 など
out=$(printf "12345\n" | ./robosys1)
echo "$out" | grep -qE '^[0-9]+万[0-9]*$' || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res
