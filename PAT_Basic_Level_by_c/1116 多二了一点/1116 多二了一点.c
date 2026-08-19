/*
 * 题目：1116 多二了一点
 * 实现原理：
 *   判断一个偶数位数字是否满足"多二了一点"的条件。
 *   条件：将数字分成前后两半X和Y，前n-1位相同，且X的最后一位比Y的最后一位大2。
 *   算法步骤：
 *   1. 检查数字位数是否为偶数，否则输出错误
 *   2. 将数字分成X（后半部分）和Y（前半部分）
 *   3. 检查前n-1位是否相同
 *   4. 检查X最后一位 - Y最后一位是否等于2
 *   5. 输出结果
 */
#include <stdio.h>
#include <string.h>

int main() {
    char s[1005];
    scanf("%s", s);         // 读入数字字符串
    int len = strlen(s);
    if (len % 2 != 0) {     // 位数不是偶数则输出错误
        printf("Error: %d digit(s)\n", len);
        return 0;
    }
    int n = len / 2;
    char *X = s + n;        // X 为后半部分（较大的数）
    char *Y = s;            // Y 为前半部分
    int flag = 1;           // 前 n-1 位是否完全相同的标记
    for (int i = 0; i < n - 1; i++) {   // 比较 X 与 Y 的前 n-1 位
        if (X[i] != Y[i]) {
            flag = 0;
            break;
        }
    }
    int X_last = X[n - 1] - '0';    // X 最后一位数字
    int Y_last = Y[n - 1] - '0';    // Y 最后一位数字
    if (X_last - Y_last == 2 && flag) {     // 前 n-1 位相同且差为 2
        printf("Yes: %s - %s = 2\n", X, Y);
    } else {
        printf("No: %s - %s != 2\n", X, Y);
    }
    return 0;
}