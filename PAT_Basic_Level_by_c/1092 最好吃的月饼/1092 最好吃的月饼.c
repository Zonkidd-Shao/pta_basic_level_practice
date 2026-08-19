/*
 * 题目：1092 最好吃的月饼
 * 实现原理：
 *   统计各种月饼在m个商店的销量，找出销量最高的月饼种类。
 *   算法步骤：
 *   1. 读取月饼种类数n和商店数m
 *   2. 使用cake数组累加每种月饼在各商店的销量
 *   3. 找出最大销量max
 *   4. 输出最大销量和所有销量等于max的月饼种类编号
 */
#include <stdio.h>

int main() {
    int n, m;           // n:月饼种类数; m:城市数
    scanf("%d %d", &n, &m);
    int cake[1005] = {0};   // cake[j]为第j种月饼的总销量
    for (int i = 0; i < m; i++) {
        for (int j = 1; j <= n; j++) {
            int x;
            scanf("%d", &x);
            cake[j] += x;   // 累加各城市销量
        }
    }
    int max = 0;
    for (int i = 1; i <= n; i++) {      // 找出最大销量
        if (cake[i] > max) max = cake[i];
    }
    printf("%d\n", max);
    int first = 1;                      // 控制输出空格
    for (int i = 1; i <= n; i++) {
        if (cake[i] == max) {           // 并列第一的种类都要输出
            if (!first) printf(" ");
            printf("%d", i);
            first = 0;
        }
    }
    printf("\n");
    return 0;
}