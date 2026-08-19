/*
 * 题目：1057 数零壹
 * 实现原理：
 *   将英文字母转换为数字（a/A=1, b/B=2, ..., z/Z=26），求和后转换为二进制，统计0和1的个数。
 *   算法步骤：
 *   1. 遍历输入字符串，累加字母对应的数值
 *   2. 将和转换为二进制，统计0和1的个数
 *   3. 输出0的个数和1的个数
 *   注意：只处理英文字母，其他字符忽略。
 */
#include <stdio.h>

int main() {
    char ch;
    int sum = 0, zero = 0, one = 0;  // sum: 字母序号累加和; zero/one: 二进制中 0/1 的个数
    while ((ch = getchar()) != '\n') {  // 逐字符读入一行
        if (ch >= 'a' && ch <= 'z') {       // 小写字母 a~z 对应 1~26
            sum += ch - 'a' + 1;
        } else if (ch >= 'A' && ch <= 'Z') {  // 大写字母同样处理
            sum += ch - 'A' + 1;
        }
    }
    while (sum) {  // 不断除 2 取余，统计二进制位
        if (sum % 2 == 0) {
            zero++;
        } else {
            one++;
        }
        sum /= 2;
    }
    printf("%d %d\n", zero, one);  // 依次输出 0 和 1 的个数
    return 0;
}