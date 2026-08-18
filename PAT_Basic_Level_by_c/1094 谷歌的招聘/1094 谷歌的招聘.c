/*
 * 题目：1094 谷歌的招聘
 * 实现原理：
 *   在一个长度为L的数字串中找出第一个长度为K的素数。
 *   算法步骤：
 *   1. is_prime函数：判断一个数是否为素数
 *      - 小于等于1不是素数
 *      - 2是素数
 *      - 偶数不是素数
 *      - 从3开始，只检查奇数因子直到sqrt(x)
 *   2. 遍历数字串，每次取长度为K的子串
 *   3. 将子串转换为整数，检查是否为素数
 *   4. 找到第一个素数后立即输出，否则输出"404"
 */
#include <stdio.h>
#include <string.h>
#include <math.h>

int is_prime(int x) {
    if (x <= 1) return 0;
    if (x == 2) return 1;
    if (x % 2 == 0) return 0;
    for (int i = 3; i * i <= x; i += 2) {   // 只需检查奇数因子到sqrt(x)
        if (x % i == 0) return 0;
    }
    return 1;
}

int main() {
    int l, k;           // l:数字串长度; k:要找的素数位数
    char s[1003];
    scanf("%d %d", &l, &k);
    getchar();          // 吃掉换行符
    gets(s);
    for (int i = 0; i <= l - k; i++) {      // 依次取每个长度为k的连续子串
        char temp[10];
        strncpy(temp, s + i, k);
        temp[k] = '\0';
        int num = 0;
        for (int j = 0; j < k; j++) {       // 把子串转换成整数（保留前导0）
            num = num * 10 + (temp[j] - '0');
        }
        if (is_prime(num)) {
            printf("%s\n", temp);           // 输出原始子串（含前导0）
            return 0;
        }
    }
    printf("404\n");        // 未找到则输出404
    return 0;
}