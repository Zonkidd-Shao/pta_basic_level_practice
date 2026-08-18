/*
 * 题目：1087 有多少不同的值
 * 实现原理：
 *   计算表达式floor(i/2) + floor(i/3) + floor(i/5)在i从1到n范围内有多少个不同的值。
 *   算法步骤：
 *   1. 使用flag数组标记已经出现过的值
 *   2. 遍历i从1到n，计算表达式的值
 *   3. 如果该值未出现过，标记并计数
 *   4. 输出不同值的个数
 */
#include <stdio.h>

int main() {
    int n;
    scanf("%d", &n);
    int flag[1000000] = {0};    // flag[v]标记表达式值v是否已出现
    int count = 0;              // 不同值的个数
    for (int i = 1; i <= n; i++) {
        int val = i / 2 + i / 3 + i / 5;    // 整数除法即向下取整
        if (flag[val] == 0) {   // 该值首次出现
            flag[val] = 1;
            count++;
        }
    }
    printf("%d\n", count);
    return 0;
}