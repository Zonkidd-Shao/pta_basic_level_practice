/*
 * 题目：1022 D进制的A+B
 * 实现原理：
 *   计算两个整数A和B的和，并以D进制输出结果。
 *   算法步骤：
 *   1. 计算A+B的和
 *   2. 特殊处理：若和为0，直接输出0
 *   3. 使用除基取余法将十进制转换为D进制：
 *      - 不断用sum除以D，取余数
 *      - 余数逆序排列即为D进制结果
 *   4. 从高位到低位输出结果
 *   使用long long类型避免溢出。
 */
#include <stdio.h>

int main() {
    long long a, b;
    int d;                          // 目标进制
    scanf("%lld %lld %d", &a, &b, &d);
    long long sum = a + b;
    if (sum == 0) {                 // 和为 0 时直接输出 0
        printf("0\n");
        return 0;
    }
    int digits[32], len = 0;        // digits 逆序存放 D 进制各位，len 为位数
    while (sum > 0) {               // 除基取余法：反复除以 d 取余数
        digits[len++] = sum % d;    // 记录余数
        sum /= d;
    }
    for (int i = len - 1; i >= 0; i--) {   // 逆序输出，即从高位到低位
        printf("%d", digits[i]);
    }
    printf("\n");
    return 0;
}