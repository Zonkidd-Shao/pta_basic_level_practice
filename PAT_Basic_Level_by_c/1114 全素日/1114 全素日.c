/*
 * 题目：1114 全素日
 * 实现原理：
 *   判断日期字符串是否为全素日。全素日定义：日期的每一位前缀都是素数。
 *   例如：23332，依次检查2、23、233、2333、23332是否都是素数。
 *   算法步骤：
 *   1. is_prime函数：判断一个数是否为素数
 *   2. 读取日期字符串
 *   3. 依次检查从最长到最短的前缀是否为素数
 *   4. 如果所有前缀都是素数，输出"All Prime!"
 */
#include <stdio.h>
#include <string.h>
#include <math.h>

int is_prime(int x) {       // 判断 x 是否为素数
    if (x < 2) return 0;
    for (int i = 2; i * i <= x; i++) {
        if (x % i == 0) return 0;
    }
    return 1;
}

int main() {
    char s[20];
    scanf("%s", s);         // 读入日期字符串
    int len = strlen(s);
    int all_prime = 1;      // 标记所有前缀是否都为素数
    while (len > 0) {       // 依次检查从最长到最短的前缀
        int num = 0;
        for (int i = 0; i < len; i++) {     // 将当前前缀转为整数
            num = num * 10 + (s[i] - '0');
        }
        printf("%s %s\n", s, is_prime(num) ? "Yes" : "No");
        if (!is_prime(num)) all_prime = 0;
        for (int i = 0; i < len - 1; i++) { // 去掉首字符，得到下一个更短的前缀
            s[i] = s[i + 1];
        }
        s[len - 1] = '\0';
        len--;
    }
    if (all_prime) printf("All Prime!\n");  // 所有前缀均为素数
    return 0;
}