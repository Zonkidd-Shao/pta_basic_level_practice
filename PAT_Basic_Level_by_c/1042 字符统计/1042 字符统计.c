/*
 * 题目：1042 字符统计
 * 实现原理：
 *   统计输入字符串中每个英文字母出现的次数，输出出现次数最多的字母（小写）及其次数。
 *   算法步骤：
 *   1. 使用count数组（大小26）统计每个字母的出现次数
 *   2. 遍历输入，将大小写字母统一转换为小写后计数
 *   3. 找出出现次数最多的字母（若有多个，输出字典序最小的）
 *   4. 输出小写字母及其次数
 */
#include <stdio.h>

int main() {
    int count[26] = {0};  // 26 个小写字母的出现次数
    char c;
    
    while ((c = getchar()) != '\n') {  // 逐字符读入
        if (c >= 'a' && c <= 'z') {
            count[c - 'a']++;
        } else if (c >= 'A' && c <= 'Z') {  // 大写统一转成小写统计
            count[c - 'A']++;
        }
    }
    
    int max_count = 0, max_index = 0;  // 最大出现次数、对应字母下标
    for (int i = 0; i < 26; i++) {  // 从 a 开始找，遇相同次数不更新 → 保证字典序最小
        if (count[i] > max_count) {
            max_count = count[i];
            max_index = i;
        }
    }
    
    printf("%c %d\n", 'a' + max_index, max_count);
    
    return 0;
}