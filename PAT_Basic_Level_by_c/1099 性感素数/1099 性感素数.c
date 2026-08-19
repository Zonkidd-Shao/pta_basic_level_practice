/*
 * 题目：1099 性感素数
 * 实现原理：
 *   性感素数是指相差为6的两个素数。例如(5,11)、(7,13)等。
 *   算法步骤：
 *   1. 判断n是否为素数，且n-6或n+6也是素数
 *   2. 如果是，输出"Yes"和对应的另一个素数
 *   3. 如果不是，从n+1开始查找下一个性感素数
 */
#include <stdio.h>
#include <math.h>

int is_prime(int n) {
    if (n <= 1) return 0;
    if (n == 2) return 1;
    if (n % 2 == 0) return 0;
    for (int i = 3; i * i <= n; i += 2) {   // 只试除奇数因子到sqrt(n)
        if (n % i == 0) return 0;
    }
    return 1;
}

int main() {
    int n;
    scanf("%d", &n);
    if (is_prime(n) && is_prime(n - 6)) {   // n与n-6构成性感素数对，输出较小者
        printf("Yes\n%d\n", n - 6);
        return 0;
    }
    if (is_prime(n) && is_prime(n + 6)) {   // n与n+6构成性感素数对，输出较大者
        printf("Yes\n%d\n", n + 6);
        return 0;
    }
    printf("No\n");
    while (1) {                             // 从n+1起向后找下一个性感素数
        n++;
        if (is_prime(n) && (is_prime(n - 6) || is_prime(n + 6))) {
            printf("%d\n", n);
            break;
        }
    }
    return 0;
}