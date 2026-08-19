/*
 * 题目：1012 数字分类
 * 实现原理：
 *   将输入的数字按除以5的余数分为5类进行处理：
 *   - A1：被5整除的偶数之和
 *   - A2：模5余1的数，按顺序交替加减
 *   - A3：模5余2的数的个数
 *   - A4：模5余3的数的平均值（保留一位小数）
 *   - A5：模5余4的数中的最大值
 *   算法步骤：
 *   1. 使用flag数组标记每类是否有有效值
 *   2. 根据数字模5的结果进行相应处理
 *   3. 最后按格式输出各类结果，无有效值输出"N"
 */
#include <stdio.h>

int main() {
    int n;
    scanf("%d", &n);
    int a1 = 0, a2 = 0, a3 = 0, a5 = 0;   // A1、A2、A3、A5 的统计结果
    double a4 = 0;                        // A4 用 double 累加，最后求平均值
    int cnt2 = 0, cnt4 = 0;               // cnt2 记录 A2 项数（判断加减次序），cnt4 记录 A4 项数
    int flag1 = 0, flag2 = 0, flag3 = 0, flag4 = 0, flag5 = 0;  // 各分类是否出现过有效数字
    for (int i = 0; i < n; i++) {
        int num;
        scanf("%d", &num);
        int mod = num % 5;                // 按除以 5 的余数分类
        if (mod == 0 && num % 2 == 0) {   // A1：能被 5 整除的偶数求和
            a1 += num;
            flag1 = 1;
        } else if (mod == 1) {            // A2：交替加减
            if (cnt2 % 2 == 0) {          // 第奇数个（从1开始）做加法
                a2 += num;
            } else {                      // 第偶数个做减法
                a2 -= num;
            }
            cnt2++;
            flag2 = 1;
        } else if (mod == 2) {            // A3：统计个数
            a3++;
            flag3 = 1;
        } else if (mod == 3) {            // A4：累加，稍后除以个数求平均
            a4 += num;
            cnt4++;
            flag4 = 1;
        } else if (mod == 4) {            // A5：取最大值
            if (num > a5) {
                a5 = num;
            }
            flag5 = 1;
        }
    }
    if (!flag1) printf("N");              // 无有效数字时输出 N
    else printf("%d", a1);
    if (!flag2) printf(" N");
    else printf(" %d", a2);
    if (!flag3) printf(" N");
    else printf(" %d", a3);
    if (!flag4) printf(" N");
    else printf(" %.1f", a4 / cnt4);      // A4 平均值保留一位小数
    if (!flag5) printf(" N");
    else printf(" %d", a5);
    printf("\n");
    return 0;
}