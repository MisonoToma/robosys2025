
// SPDX-FileCopyrightText: 2025 Toma Misono
// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

int main(void)
{
    double g;
    int a;

    if (scanf("%lf", &g) != 1) {

    return 1;
    }

    if (g < 0 || 100000000 <= g) {

    return 1;
    }

    a = (int)g;

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
            printf("%d", b);
        printf("\n");
    }

    return 0;
}
