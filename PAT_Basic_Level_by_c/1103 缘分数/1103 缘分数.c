/*
 * 题目：1103 缘分数
 * 实现原理：
 *   找出满足条件的数对(a, b)。a^3 - (a-1)^3 是 c^2，且 c=b^2+(b-1)^2。
 */
#include <stdio.h>
#include <math.h>

int main(void)
{
    int m, n;
    scanf("%d %d", &m, &n);
    int found = 0;
    for (int a = m; a <= n; a++) {
        long long value = (long long)a * a * a
                        - (long long)(a - 1) * (a - 1) * (a - 1);
        int c = (int)sqrt((double)value);
        if ((long long)c * c != value || a == c)
            continue;

        /* 2b^2 - 2b + 1 = c; its discriminant is 2c-1. */
        long long discriminant = 2LL * c - 1;
        long long root = (long long)sqrt((double)discriminant);
        while ((root + 1) * (root + 1) <= discriminant) root++;
        while (root * root > discriminant) root--;
        if (root * root == discriminant && (root & 1LL)) {
            int b = (int)((root + 1) / 2);
            if (b >= 2) {
                printf("%d %d\n", a, b);
                found = 1;
            }
        }
    }
    if (!found)
        printf("No Solution\n");
    return 0;
}
