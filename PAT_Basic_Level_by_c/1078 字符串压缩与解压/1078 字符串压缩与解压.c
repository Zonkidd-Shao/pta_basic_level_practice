/*
 * 题目：1078 字符串压缩与解压
 * 实现原理：
 *   支持两种操作：
 *   压缩(C)：将连续重复的字符替换为"数字+字符"的形式（数字为1时省略）
 *   解压(D)：将"数字+字符"的形式展开为对应的字符序列
 *   算法步骤（压缩）：
 *   1. 遍历字符串，统计连续相同字符的个数
 *   2. 如果个数大于1，先输出个数再输出字符；否则直接输出字符
 *   算法步骤（解压）：
 *   1. 遍历字符串，遇到数字时累积数字
 *   2. 遇到非数字字符时，根据累积的数字重复输出该字符（数字为0或1时输出一次）
 */
#include <stdio.h>
#include <string.h>

int main() {
    char op, str[1001];     // op:操作类型(C压缩/D解压); str:待处理的字符串
    scanf(" %c", &op);
    getchar();              // 吃掉操作符后的换行符
    fgets(str, sizeof(str), stdin);
    str[strcspn(str, "\n")] = '\0';
    if (op == 'C') {        // 压缩：把连续重复字符写成"个数+字符"
        int len = strlen(str);
        for (int i = 0; i < len; i++) {
            int cnt = 1;
            while (i + 1 < len && str[i] == str[i + 1]) {   // 统计连续相同字符的个数
                cnt++;
                i++;
            }
            if (cnt > 1) {          // 个数大于1时才输出数字前缀
                printf("%d", cnt);
            }
            printf("%c", str[i]);
        }
    } else if (op == 'D') { // 解压：把"个数+字符"展开为字符序列
        int len = strlen(str);
        for (int i = 0; i < len; i++) {
            int cnt = 0;
            while (str[i] >= '0' && str[i] <= '9') {    // 连续读数字，得到重复次数
                cnt = cnt * 10 + str[i] - '0';
                i++;
            }
            if (cnt == 0) {         // 无数字前缀，原样输出一个字符
                printf("%c", str[i]);
            } else {
                for (int j = 0; j < cnt; j++) {         // 按次数重复输出该字符
                    printf("%c", str[i]);
                }
            }
        }
    }
    printf("\n");
    return 0;
}
