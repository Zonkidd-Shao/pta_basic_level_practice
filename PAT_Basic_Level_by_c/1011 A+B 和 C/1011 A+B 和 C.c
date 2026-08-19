/*
 * 题目：1011 A+B 和 C
 * 实现原理：
 *   判断A+B是否大于C，处理多组测试用例。
 *   注意：输入范围为[-2^63, 2^63]，需要使用long long类型存储以避免溢出。
 *   算法步骤：
 *   1. 读取测试用例数量t
 *   2. 对每个测试用例，读取三个long long整数a、b、c
 *   3. 判断a+b是否大于c，输出相应结果
 *   4. 输出格式为"Case #x: true/false"
 */
#include <stdio.h>

int main() {
    int t;
    scanf("%d", &t);                       // 测试用例个数
    for (int i = 1; i <= t; i++) {         // 逐个处理每个测试用例
        long long a, b, c;                 // 范围达 ±2^63，必须用 long long
        scanf("%lld %lld %lld", &a, &b, &c);
        printf("Case #%d: %s\n", i, a + b > c ? "true" : "false");   // 判断 A+B 是否大于 C
    }
    return 0;
}