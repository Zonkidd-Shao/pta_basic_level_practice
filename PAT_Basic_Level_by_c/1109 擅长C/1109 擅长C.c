/*
 * 题目：1109 擅长C
 * 实现原理：
 *   使用点阵字符显示输入的英文句子。每个大写字母由7行5列的点阵组成。
 *   算法步骤：
 *   1. 读取26个大写字母的点阵数据，存储在letters[26][7][6]中
 *   2. 读取输入句子，按空格分割单词
 *   3. 对每个单词，按行输出每个字母的点阵，字母之间用空格分隔
 *   4. 单词之间用空行分隔
 */
#include <stdio.h>
#include <string.h>

char letters[26][7][6];     // 26 个大写字母的点阵，每个字母 7 行 5 列

void print_word(char *word) {   // 按行输出一个单词的点阵
    int len = strlen(word);
    for (int i = 0; i < 7; i++) {       // 逐行输出点阵
        for (int j = 0; j < len; j++) { // 每行依次输出单词中各字母的第 i 行
            int idx = word[j] - 'A';
            printf("%s", letters[idx][i]);
            if (j < len - 1) printf(" ");   // 字母间以空格分隔
        }
        printf("\n");
    }
}

int main() {
    for (int i = 0; i < 26; i++) {      // 读入 26 个字母的点阵数据
        for (int j = 0; j < 7; j++) {
            scanf("%s", letters[i][j]);
        }
    }
    getchar();                          // 吃掉点阵后的换行符
    char sentence[1000];
    gets(sentence);                     // 读入待显示的句子
    char word[11];                      // 单词缓冲
    int word_len = 0;                   // 当前单词长度
    int first_word = 1;                 // 是否为第一个单词（决定是否输出空行）
    int len = strlen(sentence);
    for (int i = 0; i <= len; i++) {    // 按非大写字母切分句子中的单词
        if (i == len || !(sentence[i] >= 'A' && sentence[i] <= 'Z')) {  // 遇到分隔符或结尾
            if (word_len > 0) {         // 已收集完一个单词则输出
                word[word_len] = '\0';
                if (!first_word) printf("\n\n");    // 单词之间输出空行
                print_word(word);
                first_word = 0;
                word_len = 0;
            }
        } else {
            word[word_len++] = sentence[i];     // 收集大写字母组成单词
        }
    }
    return 0;
}