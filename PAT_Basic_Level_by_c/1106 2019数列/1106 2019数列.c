/*
 * 题目：1106 2019数列
 * 实现原理：
 *   构造一个特殊数列，前4项为2、0、1、9，从第5项开始，每一项等于前4项之和的个位数。
 *   算法步骤：
 *   1. 初始化数列前4项：seq[0]=2, seq[1]=0, seq[2]=1, seq[3]=9
 *   2. 从第5项开始，seq[i] = (seq[i-1] + seq[i-2] + seq[i-3] + seq[i-4]) % 10
 *   3. 输出数列的前n项
 */
#include <stdio.h>

int main() {
    int n;
    scanf("%d", &n);        // 需要输出的项数
    int seq[1000];          // 存储数列各项
    seq[0] = 2;
    seq[1] = 0;
    seq[2] = 1;
    seq[3] = 9;
    for (int i = 4; i < n; i++) {   // 从第5项起生成：前4项之和的个位数
        seq[i] = (seq[i - 1] + seq[i - 2] + seq[i - 3] + seq[i - 4]) % 10;
    }
    for (int i = 0; i < n; i++) {   // 依次输出前 n 项
        printf("%d", seq[i]);
    }
    printf("\n");
    return 0;
}