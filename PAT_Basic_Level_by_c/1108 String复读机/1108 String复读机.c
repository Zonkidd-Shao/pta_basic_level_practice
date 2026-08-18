/*
 * 题目：1108 String复读机
 * 实现原理：
 *   统计字符串中'S'、't'、'r'、'i'、'n'、'g'每个字符出现的次数，
 *   然后按"S t r i n g"的顺序循环输出这些字符，直到所有字符都输出完毕。
 *   算法步骤：
 *   1. 读取输入字符串
 *   2. 使用count数组统计每个目标字符的出现次数
 *   3. 循环输出：每次按顺序输出一个非零计数的字符，计数减1
 *   4. 当所有计数都为0时停止
 */
#include <stdio.h>
#include <string.h>

int main() {
    char str[10001];        // 输入字符串
    gets(str);
    int count[6] = {0};     // 统计 'S' 't' 'r' 'i' 'n' 'g' 各字符出现次数
    char target[] = "String";
    int len = strlen(str);
    for (int i = 0; i < len; i++) {     // 统计每个目标字符的出现次数
        for (int j = 0; j < 6; j++) {
            if (str[i] == target[j]) {
                count[j]++;
                break;
            }
        }
    }
    while (1) {
        int done = 1;       // 标记是否已全部输出完毕
        for (int i = 0; i < 6; i++) {   // 每轮按 "String" 顺序各输出一个字符
            if (count[i] > 0) {
                done = 0;
                printf("%c", target[i]);
                count[i]--;
            }
        }
        if (done) break;    // 所有字符输出完毕则结束
    }
    printf("\n");
    return 0;
}