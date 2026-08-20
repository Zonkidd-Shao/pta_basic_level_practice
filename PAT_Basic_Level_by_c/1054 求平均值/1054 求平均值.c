/*
 * 题目：1054 求平均值
 * 实现原理：
 *   判断输入的数字是否合法，计算合法数字的平均值。
 *   合法条件：
 *   1. 数值范围在[-1000, 1000]
 *   2. 最多保留两位小数
 *   算法步骤：
 *   1. 使用sscanf将字符串转换为double
 *   2. 使用sprintf将double格式化保留两位小数
 *   3. 比较原字符串和格式化后的字符串是否一致
 *   4. 统计合法数字的个数和总和，计算平均值
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

static int is_legal_number(const char *s, double *value) {
    int i = 0, digits = 0, fraction_digits = 0;
    if (s[i] == '-') i++;
    if (s[i] == '\0') return 0;

    while (s[i] >= '0' && s[i] <= '9') {
        digits++;
        i++;
    }
    if (s[i] == '.') {
        i++;
        while (s[i] >= '0' && s[i] <= '9') {
            fraction_digits++;
            i++;
        }
    }
    if (digits == 0 && fraction_digits == 0) return 0;
    if (fraction_digits > 2 || s[i] != '\0') return 0;

    char *end;
    *value = strtod(s, &end);
    return *end == '\0' && isfinite(*value) && *value >= -1000.0 && *value <= 1000.0;
}

int main() {
    int N, cnt = 0;   // N: 输入个数; cnt: 合法数字个数
    char a[205];         // 题面允许数字总长度不超过 200
    double temp = 0.0, sum = 0.0;  // temp: 解析出的数值; sum: 合法数字总和
    scanf("%d", &N);
    
    for (int i = 0; i < N; i++) {
        scanf("%204s", a);
        int legal = is_legal_number(a, &temp);
        if (!legal) {
            printf("ERROR: %s is not a legal number\n", a);
        } else {  // 合法：累加总和并计数
            sum += temp;
            cnt++;
        }
    }
    
    if (cnt == 0) {  // 按合法个数分类输出平均值
        printf("The average of 0 numbers is Undefined\n");
    } else if (cnt == 1) {
        printf("The average of 1 number is %.2lf\n", sum);
    } else {
        printf("The average of %d numbers is %.2lf\n", cnt, sum / cnt);
    }
    return 0;
}
