#!/bin/bash
res=0
ng() {
  echo "NG at line $1"
  res=1
}

out=$(echo 9999 | ./robosys1)
[ "${out}" = "9999" ] || ng "$LINENO"

out=$(echo 12345 | ./robosys1)
[ "${out}" = "1万2345" ] || ng "$LINENO"

out=$(echo 10000 | ./robosys1)
[ "${out}" = "1万0" ] || ng "$LINENO"

out=$(echo 5006007 | ./robosys1)
[ "${out}" = "500万6007" ] || ng "$LINENO"

out=$(echo あ | ./robosys1)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./robosys1)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
