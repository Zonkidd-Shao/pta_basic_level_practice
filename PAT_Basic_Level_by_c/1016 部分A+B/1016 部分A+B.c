/*
 * 题目：1016 部分A+B
 * 实现原理：
 *   从整数A中提取所有数字da，组成新数Pa；同理从B中提取所有数字db组成Pb，输出Pa+Pb。
 *   算法步骤：
 *   1. 定义get_p函数：逐位取出数字，若等于目标数字则累加到结果中
 *   2. 调用get_p分别计算Pa和Pb
 *   3. 输出两数之和
 *   例如：A=3862767, da=6，则Pa=66
 */
#include <stdio.h>

int get_p(long long a, int da) {    // 从 a 中提取所有等于 da 的数字组成新数
    int p = 0;
    while (a > 0) {                 // 逐位检查
        if (a % 10 == da) {         // 当前位等于 da 则将其追加到结果末尾
            p = p * 10 + da;
        }
        a /= 10;                    // 去掉最低位
    }
    return p;
}

int main() {
    long long a, b;
    int da, db;
    scanf("%lld %d %lld %d", &a, &da, &b, &db);
    printf("%d\n", get_p(a, da) + get_p(b, db));   // 输出 Pa + Pb
    return 0;
}