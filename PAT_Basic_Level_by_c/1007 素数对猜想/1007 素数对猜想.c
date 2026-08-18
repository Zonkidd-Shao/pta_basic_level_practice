/*
 * 题目：1007 素数对猜想
 * 实现原理：
 *   统计不超过n的素数中，差值为2的素数对（即"孪生素数"）的个数。
 *   算法步骤：
 *   1. 实现is_prime函数判断一个数是否为素数：
 *      - 小于等于1不是素数
 *      - 2是唯一的偶素数
 *      - 偶数不是素数
 *      - 从3开始到sqrt(n)，步长为2检查是否能整除
 *   2. 遍历2到n的所有数，记录相邻素数的差值，统计差值为2的次数
 */
#include <stdio.h>
#include <math.h>

int is_prime(int n) {
    if (n <= 1) return 0;                   // 0、1 不是素数
    if (n == 2) return 1;                   // 2 是唯一的偶素数
    if (n % 2 == 0) return 0;               // 其他偶数都不是素数
    for (int i = 3; i <= sqrt(n); i += 2) { // 只检查奇数因子，到 sqrt(n) 为止
        if (n % i == 0) return 0;           // 能被整除说明不是素数
    }
    return 1;
}

int main() {
    int n;
    scanf("%d", &n);
    int count = 0, prev = 2;                // count 统计素数对个数，prev 记录上一个素数
    for (int i = 3; i <= n; i++) {
        if (is_prime(i)) {
            if (i - prev == 2) {            // 与上一个素数相差 2，构成一个素数对
                count++;
            }
            prev = i;                       // 更新上一个素数
        }
    }
    printf("%d\n", count);                  // 输出素数对个数
    return 0;
}