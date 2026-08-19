/*
 * 题目：1029 旧键盘
 * 实现原理：
 *   找出旧键盘上坏掉的键。输入两行字符串，第一行是预期输入，第二行是实际输入。
 *   算法步骤：
 *   1. 标记第二行中出现的所有字符（包括大小写）
 *   2. 遍历第一行，输出所有未在第二行出现的字符（转换为大写）
 *   3. 使用output数组确保每个坏键只输出一次
 *   注意：大小写视为同一个键，输出时统一为大写。
 */
#include <stdio.h>
#include <string.h>
#include <ctype.h>

int main() {
    char s1[1001], s2[1001];  // s1：应输出的文本；s2：实际输出的文本
    scanf("%s %s", s1, s2);
    int len1 = strlen(s1), len2 = strlen(s2);
    int flag[128] = {0};      // 按 ASCII 码标记实际输出中出现过的字符
    for (int i = 0; i < len2; i++) {
        flag[(unsigned char)s2[i]] = 1;
        if (isalpha(s2[i])) {  // 字母键大小写视为同一个键，两种写法都标记
            flag[toupper(s2[i])] = 1;
            flag[tolower(s2[i])] = 1;
        }
    }
    int output[128] = {0};    // 标记已输出的坏键，保证每个键只输出一次
    for (int i = 0; i < len1; i++) {
        char c = toupper(s1[i]);  // 坏键统一按大写输出
        if (!flag[(unsigned char)s1[i]] && !output[(unsigned char)c]) {  // 该键未在s2出现且尚未输出 → 坏键
            printf("%c", c);
            output[(unsigned char)c] = 1;
        }
    }
    printf("\n");
    return 0;
}