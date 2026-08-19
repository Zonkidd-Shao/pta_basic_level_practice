/*
 * 题目：1009 说反话
 * 实现原理：
 *   将一句英语句子中的单词顺序颠倒后输出。
 *   算法步骤：
 *   1. 使用fgets函数读取整行输入（包含空格）
 *   2. 从字符串末尾向前扫描，记录每个单词的起始位置
 *   3. 将单词位置存入words数组（从后往前）
 *   4. 按照数组中的位置信息，从前往后输出每个单词
 *   注意：words数组首元素为字符串长度（最后一个单词的结束位置），
 *         后续元素为从后往前每个单词的起始位置。
 *         输出时，第一个输出的单词（原最后一个单词）结束位置为len，
 *         其余单词的结束位置为后一个单词起始位置减1（即空格位置）。
 */
#include <stdio.h>
#include <string.h>

int main() {
    char str[81];
    fgets(str, 81, stdin);                      // 读取整行句子（含空格）
    int len = strlen(str);
    while (len > 0 && (str[len - 1] == '\n' || str[len - 1] == '\r')) {  // 去掉行尾的换行符
        str[--len] = '\0';
    }
    int words[80], wlen = 0;                    // words 记录各单词的起始位置
    words[wlen++] = len;                        // 首元素存字符串长度（末尾边界）
    for (int i = len - 1; i >= 0; i--) {        // 从后往前扫描
        if (str[i] == ' ') {                    // 遇到空格，空格后一位即单词起始
            words[wlen++] = i + 1;
        }
    }
    words[wlen++] = 0;                          // 最后补上第一个单词的起始位置 0
    for (int i = 1; i < wlen; i++) {            // 按记录依次输出每个单词（原序逆置）
        int start = words[i];                   // 当前单词的起始位置
        int end = (i == 1) ? words[i - 1] : words[i - 1] - 1;  // 结束位置：末尾或前一单词前的空格
        for (int j = start; j < end; j++) {
            printf("%c", str[j]);
        }
        if (i < wlen - 1) {                     // 单词之间用空格分隔
            printf(" ");
        }
    }
    printf("\n");
    return 0;
}