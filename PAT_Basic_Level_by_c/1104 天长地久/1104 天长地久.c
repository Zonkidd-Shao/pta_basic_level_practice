/*
 * 题目：1104 天长地久
 * 实现原理：
 *   寻找满足条件的数A，条件为：
 *   1. A是K位数，且A的个位是9
 *   2. A的各位数字之和等于m
 *   3. 设n为A+1的各位数字之和，gcd(m, n)是大于2的素数
 *   算法步骤：
 *   1. 遍历所有K位且个位为9的数
 *   2. 检查各位数字之和是否等于m
 *   3. 计算n = digit_sum(A+1)，检查gcd(m, n)是否为大于2的素数
 *   4. 按n升序、A升序排序后输出
 */
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

typedef struct {
    int n;
    long long A;
} Result;

int gcd(int a, int b) {     // 欧几里得算法求最大公约数
    while (b) {
        int t = a % b;
        a = b;
        b = t;
    }
    return a;
}

int is_prime(int x) {       // 判断 x 是否为素数
    if (x <= 2) return 0;
    for (int i = 2; i * i <= x; i++) {
        if (x % i == 0) return 0;
    }
    return 1;
}

int digit_sum(long long x) {    // 计算 x 的各位数字之和
    int sum = 0;
    while (x) {
        sum += x % 10;
        x /= 10;
    }
    return sum;
}

int cmp(const void *a, const void *b) {     // 排序：先按 n 升序，再按 A 升序
    Result *pa = (Result *)a;
    Result *pb = (Result *)b;
    if (pa->n != pb->n) return pa->n - pb->n;
    if (pa->A != pb->A) return pa->A > pb->A ? 1 : -1;
    return 0;
}

int main() {
    int N;
    scanf("%d", &N);    // 测试用例个数
    for (int case_num = 1; case_num <= N; case_num++) {
        int K, m;
        scanf("%d %d", &K, &m);     // 位数 K 和各位数字之和 m
        printf("Case %d\n", case_num);
        Result res[10000];          // 存储所有满足条件的结果
        int cnt = 0;                // 结果个数
        long long start = 1;        // 计算 K 位数的最小值 10^(K-1)
        for (int i = 0; i < K - 1; i++) start *= 10;
        long long end = start * 10; // K 位数的上界
        for (long long i = start + 9; i < end; i += 10) {   // 只遍历个位为 9 的 K 位数
            if (digit_sum(i) == m) {            // 检查 A 的各位和是否为 m
                int n = digit_sum(i + 1);       // 计算 A+1 的各位数字之和
                int g = gcd(m, n);              // 求 m 与 n 的最大公约数
                if (g > 2 && is_prime(g)) {     // gcd 需为大于 2 的素数
                    res[cnt].n = n;
                    res[cnt].A = i;
                    cnt++;
                }
            }
        }
        if (cnt == 0) {
            printf("No Solution\n");
        } else {
            qsort(res, cnt, sizeof(Result), cmp);   // 按 n、A 升序排序
            for (int i = 0; i < cnt; i++) {
                printf("%d %lld\n", res[i].n, res[i].A);
            }
        }
    }
    return 0;
}