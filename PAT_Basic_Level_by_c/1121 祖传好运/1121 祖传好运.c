/*
 * 题目：1121 祖传好运
 * 实现原理：
 *   判断一个数字是否为"祖传好运"数。规则：对数字的前i位（i从1到len），都能被i整除。
 *   例如：1236，检查1%1==0, 12%2==0, 123%3==0, 1236%4==0。
 *   算法步骤：
 *   1. 读取数字字符串
 *   2. 如果长度为1，直接输出"Yes"
 *   3. 否则，依次检查前i位数字是否能被i整除
 *   4. 如果全部满足输出"Yes"，否则输出"No"
 */
#include <stdio.h>
#include <string.h>

int main() {
    int K;
    scanf("%d", &K);        // 测试用例个数
    while (K--) {
        char s[20];
        scanf("%s", s);     // 读入待判断的数字
        int len = strlen(s);
        if (len == 1) {     // 一位数必然满足条件
            printf("Yes\n");
            continue;
        }
        int flag = 1;
        for (int i = 2; i <= len; i++) {    // 依次检查前 i 位是否能被 i 整除
            int num = 0;
            for (int j = 0; j < i; j++) {   // 取前 i 位组成的数字
                num = num * 10 + (s[j] - '0');
            }
            if (num % i != 0) {
                flag = 0;
                break;
            }
        }
        printf("%s\n", flag ? "Yes" : "No");
    }
    return 0;
}