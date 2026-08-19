/*
 * 题目：1084 外观数列
 * 实现原理：
 *   外观数列是一种描述前一项数字外观的数列。
 *   例如：1, 11, 21, 1211, 111221...
 *   第n项描述第n-1项：从左到右依次描述数字和其连续出现的次数。
 *   算法步骤：
 *   1. 如果n=1，直接输出初始字符
 *   2. 从第2项开始，逐次生成外观数列
 *   3. 遍历当前字符串，统计连续相同字符的个数
 *   4. 将"字符+个数"写入结果字符串
 */
#include <stdio.h>
#include <string.h>

int main() {
    char a[100000] = {0}, b[100000] = {0};  // a:当前项; b:下一项
    int n;
    scanf("%c %d", &a[0], &n);      // a[0]为初始字符
    if (n == 1) {                   // 第1项就是初始字符
        printf("%c\n", a[0]);
        return 0;
    }
    for (int i = 2; i <= n; i++) {  // 从第2项生成到第n项
        int len = strlen(a);
        int cnt = 1, idx = 0;
        for (int j = 1; j <= len; j++) {
            if (j < len && a[j] == a[j - 1]) {      // 与前一字符相同，计数加1
                cnt++;
            } else {                                // 连续段结束：输出"字符+个数"
                b[idx++] = a[j - 1];
                b[idx++] = cnt + '0';
                cnt = 1;                            // 重置计数
            }
        }
        b[idx] = '\0';
        strcpy(a, b);           // 把生成结果作为当前项
        memset(b, 0, sizeof(b));
    }
    printf("%s\n", a);
    return 0;
}