/*
 * 题目：1033 旧键盘打字
 * 实现原理：
 *   根据坏掉的键，过滤输入字符串。
 *   特殊规则：
 *   1. 若'+'键坏掉，则所有大写字母无法输入
 *   2. 大小写字母视为同一个键（坏一个则都坏）
 *   算法步骤：
 *   1. 读取坏掉的键，标记到bad数组
 *   2. 对于字母键，同时标记大小写
 *   3. 若'+'坏掉，标记所有大写字母
 *   4. 读取输入字符串，输出未被标记的字符
 */
#include <stdio.h>
#include <string.h>

int main() {
    char bad[128] = {0};  // 按 ASCII 码标记坏掉的键
    char c;
    while ((c = getchar()) != '\n') {  // 逐字符读入坏键（第一行可能为空行）
        bad[(unsigned char)c] = 1;
        if (c >= 'A' && c <= 'Z') {  // 大写键坏掉时，对应小写键同样坏掉
            bad[c + 'a' - 'A'] = 1;
        }
    }
    if (bad['+']) {  // '+' 坏掉 → 所有大写字母都无法输入
        for (int i = 'A'; i <= 'Z'; i++) {
            bad[i] = 1;
        }
    }
    int has_output = 0;  // 是否输出过字符
    while ((c = getchar()) != '\n' && c != EOF) {  // 逐字符读入待输出的文本
        if (!bad[(unsigned char)c]) {  // 该键未坏 → 输出
            printf("%c", c);
            has_output = 1;
        }
    }
    if (!has_output) {  // 全部被过滤时也要输出一个换行
        printf("\n");
    }
    return 0;
}