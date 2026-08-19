/*
 * 题目：1019 数字黑洞
 * 实现原理：
 *   对一个4位数执行以下操作，直到结果为6174（卡普雷卡常数）或0：
 *   1. 将数字按降序排列得到最大数
 *   2. 将数字按升序排列得到最小数
 *   3. 计算差值：最大数 - 最小数
 *   4. 重复上述步骤
 *   算法步骤：
 *   - to_digits：将4位数拆分为4个数字
 *   - to_num：将4个数字组合为4位数
 *   - sort_desc/sort_asc：对数字数组进行降序/升序排序
 *   特殊处理：若4位数字全相同，直接输出0000。
 */
#include <stdio.h>

void sort_desc(int *digits) {           // 对 4 个数字降序排序
    for (int i = 0; i < 4; i++) {
        for (int j = i + 1; j < 4; j++) {
            if (digits[i] < digits[j]) {
                int temp = digits[i];
                digits[i] = digits[j];
                digits[j] = temp;
            }
        }
    }
}

void sort_asc(int *digits) {            // 对 4 个数字升序排序
    for (int i = 0; i < 4; i++) {
        for (int j = i + 1; j < 4; j++) {
            if (digits[i] > digits[j]) {
                int temp = digits[i];
                digits[i] = digits[j];
                digits[j] = temp;
            }
        }
    }
}

int to_num(int *digits) {               // 将 4 个数字拼成一个 4 位数
    return digits[0] * 1000 + digits[1] * 100 + digits[2] * 10 + digits[3];
}

void to_digits(int n, int *digits) {    // 将 4 位数拆成 4 个数字
    digits[0] = n / 1000;
    digits[1] = (n / 100) % 10;
    digits[2] = (n / 10) % 10;
    digits[3] = n % 10;
}

int main() {
    int n;
    scanf("%d", &n);
    int digits[4];
    while (1) {
        to_digits(n, digits);
        int all_same = 1;               // 判断 4 位数字是否全部相同
        for (int i = 1; i < 4; i++) {
            if (digits[i] != digits[0]) {
                all_same = 0;
                break;
            }
        }
        if (all_same) {                 // 四位全相同（如 1111），直接输出 0000
            printf("%04d - %04d = 0000\n", n, n);
            break;
        }
        int d1[4], d2[4];               // d1 用于降序排最大数，d2 用于升序排最小数
        for (int i = 0; i < 4; i++) {
            d1[i] = digits[i];
            d2[i] = digits[i];
        }
        sort_desc(d1);                  // 降序得到最大数
        sort_asc(d2);                   // 升序得到最小数
        int num1 = to_num(d1);
        int num2 = to_num(d2);
        n = num1 - num2;                // 求差值，作为下一轮运算的数
        printf("%04d - %04d = %04d\n", num1, num2, n);   // 输出本轮过程，各数占 4 位
        if (n == 6174) break;           // 得到卡普雷卡常数则终止
    }
    return 0;
}