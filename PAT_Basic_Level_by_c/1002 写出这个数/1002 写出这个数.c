/*
 * 题目：1002 写出这个数
 * 实现原理：
 *   输入一个不超过100位的非负整数，计算其各位数字之和，并用拼音输出该和的每一位数字。
 *   算法步骤：
 *   1. 将输入作为字符串读取，避免整数溢出问题
 *   2. 遍历字符串，累加每位数字的数值（通过减去'0'字符）
 *   3. 将和的每一位数字存入数组（逆序存储）
 *   4. 从高位到低位输出对应的拼音
 *   特殊处理：如果和为0，直接输出"ling"
 */
#include <stdio.h>
#include <string.h>

int main() {
    char num[101];                                      // 以字符串存储输入的大整数（最长100位）
    char pinyin[10][5] = {"ling", "yi", "er", "san", "si", "wu", "liu", "qi", "ba", "jiu"};  // 数字0~9对应的拼音
    scanf("%s", num);
    int sum = 0;                                        // 各位数字之和
    for (int i = 0; i < strlen(num); i++) {
        sum += num[i] - '0';                            // 将字符数字转为数值并累加
    }
    int digits[10], len = 0;                            // digits 逆序存放和的各位数字，len 为位数
    if (sum == 0) {                                     // 和为 0 时特判，直接输出 ling
        printf("ling\n");
        return 0;
    }
    while (sum > 0) {
        digits[len++] = sum % 10;                       // 取出最低位存入数组
        sum /= 10;
    }
    for (int i = len - 1; i >= 0; i--) {                // 逆序输出，即从高位到低位
        printf("%s", pinyin[digits[i]]);
        if (i > 0) {                                    // 数字之间用空格分隔
            printf(" ");
        }
    }
    printf("\n");
    return 0;
}