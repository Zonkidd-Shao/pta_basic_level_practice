/*
 * 题目：1013 数素数
 * 实现原理：
 *   输出第m个到第n个素数，每行输出10个。
 *   算法步骤：
 *   1. 实现is_prime函数判断素数（优化：只检查奇数因子到sqrt(n)）
 *   2. 从2开始逐个检查每个数是否为素数
 *   3. 记录素数的序号，当序号在[m, n]范围内时输出
 *   4. 使用print_count控制每行输出10个素数，最后一个素数后不输出空格
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
    int m, n;
    scanf("%d %d", &m, &n);
    int count = 0, num = 2;     // count 为已找到素数的序号，num 为当前待判断的数
    int print_count = 0;        // 当前行已输出的素数个数（每行 10 个）
    while (count < n) {         // 一直找，直到找到第 n 个素数
        if (is_prime(num)) {
            count++;            // 素数序号加 1
            if (count >= m) {   // 序号在 [m, n] 区间内的才输出
                printf("%d", num);
                print_count++;
                if (print_count % 10 == 0) {    // 每输出 10 个换行
                    printf("\n");
                } else if (count < n) {         // 不是最后一个素数时用空格分隔
                    printf(" ");
                }
            }
        }
        num++;
    }
    if (print_count % 10 != 0) {    // 末行不足 10 个时补一个换行
        printf("\n");
    }
    return 0;
}