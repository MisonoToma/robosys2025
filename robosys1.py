#!/usr/bin/python3
# SPDX-FileCopyrightText: 2025 Toma Misono
# SPDX-License-Identifier: BSD-3-Clause

a = int(input())

if a < 10000:
    print(a)
    exit()

if 10000 <= a < 100000000:
    quotient = a // 10000
    b = a % 10
    a //= 10
    c = a % 10
    a //= 10
    d = a % 10
    a //= 10
    e = a % 10
    a //= 10
    print(f"{quotient}万", end="")
    if e != 0:
        print(e, end="")
    if e != 0 or d != 0:
        print(d, end="")
    if e != 0 or d != 0 or c != 0:
        print(c, end="")
    if e != 0 or d != 0 or c != 0 or b != 0:
        print(b, end="")
    print()
