/*
 * 题目：1014 福尔摩斯的约会
 * 实现原理：
 *   根据两组字符串确定约会时间：星期、小时、分钟。
 *   算法规则：
 *   1. 从前两个字符串s1和s2中找第一个相同的大写字母(A-G)，确定星期几
 *   2. 在s1和s2中继续找第二个相同字符，若为0-9则为小时，若为A-N则小时=字母序号+10
 *   3. 从后两个字符串s3和s4中找第一个相同的字母(大小写均可)，其位置即为分钟
 *   输出格式：星期 小时:分钟（均为两位数）
 */
#include <stdio.h>
#include <string.h>

int main() {
    char s1[61], s2[61], s3[61], s4[61];
    scanf("%s %s %s %s", s1, s2, s3, s4);
    char days[7][4] = {"MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"};  // 星期一~星期日缩写
    int len1 = strlen(s1), len2 = strlen(s2);
    int min_len = len1 < len2 ? len1 : len2;    // 只需比较较短的字符串
    int found1 = 0, found2 = 0;                 // 是否已确定星期、小时
    int day = 0, hour = 0, minute = 0;
    for (int i = 0; i < min_len; i++) {
        if (!found1 && s1[i] == s2[i] && s1[i] >= 'A' && s1[i] <= 'G') {  // 第一对相同的 A-G 大写字母确定星期
            day = s1[i] - 'A';
            found1 = 1;
        } else if (found1 && !found2 && s1[i] == s2[i]) {   // 第二对相同字符确定小时
            if (s1[i] >= '0' && s1[i] <= '9') {             // 数字 0~9 对应 0~9 点
                hour = s1[i] - '0';
                found2 = 1;
            } else if (s1[i] >= 'A' && s1[i] <= 'N') {      // 字母 A~N 对应 10~23 点
                hour = s1[i] - 'A' + 10;
                found2 = 1;
            }
        }
        if (found1 && found2) break;            // 星期和小时都确定后即可退出
    }
    len1 = strlen(s3);
    len2 = strlen(s4);
    min_len = len1 < len2 ? len1 : len2;
    for (int i = 0; i < min_len; i++) {
        if (s3[i] == s4[i] && ((s3[i] >= 'a' && s3[i] <= 'z') || (s3[i] >= 'A' && s3[i] <= 'Z'))) {  // 第一对相同字母，其下标即分钟
            minute = i;
            break;
        }
    }
    printf("%s %02d:%02d\n", days[day], hour, minute);   // 小时、分钟各占两位，不足补 0
    return 0;
}