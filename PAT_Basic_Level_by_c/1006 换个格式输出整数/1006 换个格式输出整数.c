/*
 * 题目：1006 换个格式输出整数
 * 实现原理：
 *   将一个小于1000的整数按特定格式输出：
 *   - 百位数字n，输出n个'B'
 *   - 十位数字m，输出m个'S'
 *   - 个位数字k，输出"12...k"
 *   算法步骤：
 *   1. 通过整除和取模运算分别提取百、十、个位数字
 *   2. 使用循环输出对应数量的字符
 */
#include <stdio.h>

int main() {
    int n;
    scanf("%d", &n);
    int bai = n / 100;          // 百位数字
    int shi = (n / 10) % 10;    // 十位数字
    int ge = n % 10;            // 个位数字
    for (int i = 0; i < bai; i++) {     // 百位是几就输出几个 B
        printf("B");
    }
    for (int i = 0; i < shi; i++) {     // 十位是几就输出几个 S
        printf("S");
    }
    for (int i = 1; i <= ge; i++) {     // 个位是 k 则输出 1 到 k
        printf("%d", i);
    }
    printf("\n");
    return 0;
}