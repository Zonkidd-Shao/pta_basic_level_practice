/*
 * 题目：1017 A除以B
 * 实现原理：
 *   计算高精度除法，A为不超过1000位的正整数，B为1位正整数，输出商和余数。
 *   算法步骤：
 *   1. 将A作为字符串读取，逐位进行除法运算
 *   2. 使用remainder记录当前余数，初始为0
 *   3. 对每一位数字：remainder = remainder * 10 + 当前位数字
 *   4. 计算当前位商：quotient = remainder / B
 *   5. 更新余数：remainder = remainder % B
 *   6. 使用first标志避免输出前导零
 *   特殊处理：若商为0（即A<B），需输出0。
 */
#include <stdio.h>
#include <string.h>

int main() {
    char a[1001];                   // A 最长 1000 位，用字符串存储
    int b;                          // 除数，为 1 位正整数
    scanf("%s %d", a, &b);
    int len = strlen(a);
    int first = 1;                  // 是否还未输出有效商位（用于去除前导零）
    int remainder = 0;              // 当前余数
    for (int i = 0; i < len; i++) { // 从高位到低位逐位做除法
        remainder = remainder * 10 + (a[i] - '0');   // 拼接当前位数字构成被除数
        int quotient = remainder / b;               // 当前位的商
        if (!first || quotient != 0) {              // 跳过商的前导零
            printf("%d", quotient);
            first = 0;
        }
        remainder %= b;                             // 更新余数
    }
    if (first) {                    // 商为 0（A < B 的情况），补输出 0
        printf("0");
    }
    printf(" %d\n", remainder);     // 输出余数
    return 0;
}