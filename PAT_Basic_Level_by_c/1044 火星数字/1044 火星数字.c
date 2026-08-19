/*
 * 题目：1044 火星数字
 * 实现原理：
 *   将地球数字与火星数字互相转换。火星数字采用13进制：
 *   - 低位（0-12）：tret, jan, feb, mar, apr, may, jun, jly, aug, sep, oct, nov, dec
 *   - 高位（1-12）：tam, hel, maa, huh, tou, kes, hei, elo, syy, lok, mer, jou
 *   算法步骤：
 *   1. 地球→火星：除以13得到高位，取余得到低位
 *   2. 火星→地球：解析字符串，查找对应索引，计算h*13 + l
 *   注意：高位为0时不输出高位部分；低位为0且有高位时不输出低位。
 */
#include <stdio.h>
#include <string.h>

char low[13][5] = {"tret", "jan", "feb", "mar", "apr", "may", "jun",  // 低位（0~12）的火星文
                   "jly", "aug", "sep", "oct", "nov", "dec"};
char high[13][5] = {"", "tam", "hel", "maa", "huh", "tou", "kes",  // 高位（1~12）的火星文，下标0为空
                    "hei", "elo", "syy", "lok", "mer", "jou"};

int find_index(char *s, char arr[][5], int size) {  // 在字符串数组中查找 s，返回下标
    for (int i = 0; i < size; i++) {
        if (strcmp(arr[i], s) == 0) {
            return i;
        }
    }
    return -1;
}

int main() {
    int N;
    scanf("%d", &N);
    getchar();  // 吃掉第一行末尾的换行符
    
    for (int i = 0; i < N; i++) {
        char s[20];
        fgets(s, 20, stdin);
        s[strcspn(s, "\n")] = '\0';  // 去掉行尾换行符
        
        if (s[0] >= '0' && s[0] <= '9') {  // 地球数字 → 火星数字
            int num = 0;
            for (int j = 0; s[j] != '\0'; j++) {  // 字符串转整数
                num = num * 10 + (s[j] - '0');
            }
            
            if (num / 13 != 0) {  // 有高位（>=13）时先输出高位词
                printf("%s", high[num / 13]);
                if (num % 13 != 0) {  // 低位不为 0 时再输出低位词
                    printf(" %s", low[num % 13]);
                }
            } else {  // 小于 13 只输出低位词
                printf("%s", low[num % 13]);
            }
        } else {  // 火星数字 → 地球数字
            char part1[5] = "", part2[5] = "";  // 按空格拆分出的两个火星词
            int len = strlen(s);
            int space_pos = -1;  // 空格所在位置（-1 表示没有空格）
            
            for (int j = 0; j < len; j++) {
                if (s[j] == ' ') {
                    space_pos = j;
                    break;
                }
            }
            
            if (space_pos == -1) {  // 只有一个词（可能是低位词或单独的高位词）
                strcpy(part1, s);
            } else {  // 两个词：前一个为高位，后一个为低位
                strncpy(part1, s, space_pos);
                part1[space_pos] = '\0';
                strcpy(part2, s + space_pos + 1);
            }
            
            int h = 0, l = 0;  // 高位值、低位值
            h = find_index(part1, high, 13);
            if (h == -1) {  // 第一个词不在高位表中 → 整个是低位词
                l = find_index(part1, low, 13);
            } else {  // 第一个词是高位，第二个词是低位
                l = find_index(part2, low, 13);
            }
            
            printf("%d", h * 13 + l);
        }
        printf("\n");
    }
    
    return 0;
}