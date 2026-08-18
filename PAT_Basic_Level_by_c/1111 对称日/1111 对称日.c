/*
 * 题目：1111 对称日
 * 实现原理：
 *   判断给定日期是否为对称日（即日期字符串是回文串）。
 *   日期格式："Month Day, Year"（如"Jan 1, 2019"）
 *   算法步骤：
 *   1. 读取月份英文缩写，转换为数字（1-12）
 *   2. 将日期格式化为"YYYYMMDD"字符串
 *   3. 判断该字符串是否为回文（正读和反读相同）
 *   4. 输出结果（Y表示是对称日，N表示不是）
 */
#include <stdio.h>
#include <string.h>

int main() {
    int N;
    scanf("%d", &N);        // 测试用例个数
    while (N--) {
        char month[4], day_str[10], year_str[10];
        int day, year;
        scanf("%s %d, %d", month, &day, &year);     // 读入月份缩写、日、年
        int m;
        if (strcmp(month, "Jan") == 0) m = 1;       // 月份英文缩写转数字
        else if (strcmp(month, "Feb") == 0) m = 2;
        else if (strcmp(month, "Mar") == 0) m = 3;
        else if (strcmp(month, "Apr") == 0) m = 4;
        else if (strcmp(month, "May") == 0) m = 5;
        else if (strcmp(month, "Jun") == 0) m = 6;
        else if (strcmp(month, "Jul") == 0) m = 7;
        else if (strcmp(month, "Aug") == 0) m = 8;
        else if (strcmp(month, "Sep") == 0) m = 9;
        else if (strcmp(month, "Oct") == 0) m = 10;
        else if (strcmp(month, "Nov") == 0) m = 11;
        else m = 12;
        char date[20];
        sprintf(date, "%04d%02d%02d", year, m, day);    // 格式化为 YYYYMMDD 便于回文判断
        int len = strlen(date);
        int is_palindrome = 1;      // 是否为对称日
        for (int i = 0; i < len / 2; i++) {     // 首尾字符逐一比较判断回文
            if (date[i] != date[len - 1 - i]) {
                is_palindrome = 0;
                break;
            }
        }
        printf("%c %s\n", is_palindrome ? 'Y' : 'N', date);
    }
    return 0;
}