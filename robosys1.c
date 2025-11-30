#!/usr/bin/python3
# SPDX-FileCopyrightText: 2025 Kaito Shima
# SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

int main(void)
{
    int a;

    scanf("%d", &a);
    if (a < 10000)
        printf("%d\n", a);
    
    int quotient, b, c, d, e, f;
    if (10000 <= a && a < 100000000) {
        quotient = a / 10000;
        b = a % 10;
        a /= 10;
        c = a % 10;
        a /= 10;
        d = a % 10;
        a /= 10;
        e = a % 10;
        a /= 10;
        printf("%d万", quotient);
        if (e != 0)
            printf("%d", e);
        if (e != 0 || d != 0)
            printf("%d", d);
        if (e != 0 || d != 0 || c != 0)
            printf("%d", c);
        if (e != 0 || d != 0 || c != 0 || b != 0)
            printf("%d\n", b);
        
    }

    return 0;
}
