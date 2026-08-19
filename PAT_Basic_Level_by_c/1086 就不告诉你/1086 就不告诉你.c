/*
 * 题目：1086 就不告诉你
 * 实现原理：
 *   计算两个数的乘积，并将乘积的数字逆序输出。
 *   算法步骤：
 *   1. 读取两个整数a和b
 *   2. 计算乘积product = a * b
 *   3. 将product的各位数字逆序：c = c * 10 + product % 10
 *   4. 输出逆序后的结果（前导零自动忽略）
 */
#include <stdio.h>

int main() {
    int a, b, c = 0;
    scanf("%d %d", &a, &b);
    int product = a * b;
    while (product > 0) {       // 逐位取出乘积的个位
        c = c * 10 + product % 10;  // 累加实现逆序（前导0自动被丢弃）
        product /= 10;
    }
    printf("%d\n", c);
    return 0;
}