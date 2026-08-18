/*
 * 题目：1125 子串与子列
 * 实现原理：
 *   在字符串S中找到包含字符串P作为子序列的最短连续子串。
 *   子序列：字符顺序相同但不一定连续；子串：字符必须连续。
 *   算法步骤：
 *   1. 遍历S，找到所有与P[0]匹配的起始位置
 *   2. 对于每个起始位置，向后查找P的剩余字符（作为子序列）
 *   3. 记录最短的匹配子串长度和起始位置
 *   4. 输出最短子串
 */
#include <stdio.h>
#include <string.h>

#define MAXN 10005

int main() {
    char S[MAXN], P[MAXN];
    scanf("%s %s", S, P);   // S 为原字符串，P 为要找的子序列
    int ls = strlen(S);
    int lp = strlen(P);
    int min_len = ls;       // 最短匹配子串长度
    int min_start = 0;      // 最短匹配子串的起始位置
    for (int start = 0; start < ls; start++) {
        if (S[start] != P[0]) continue;     // 起点必须等于 P 的首字符
        if (start > ls - lp) break;         // 剩余长度不足则无需继续
        int end = start;
        int cnt = 1;                        // 已匹配的 P 的字符数
        for (int j = 1; j < lp; j++) {      // 从起点向后匹配 P 的其余字符
            end++;
            while (end < ls && S[end] != P[j]) {    // 向后找到下一个匹配字符
                end++;
            }
            if (end >= ls) break;           // 越界则匹配失败
            cnt++;
            if (end - start + 1 >= min_len) break;  // 已不可能更短，提前退出
        }
        if (cnt == lp && end - start + 1 < min_len) {   // 完全匹配且更短则更新答案
            min_len = end - start + 1;
            min_start = start;
            if (min_len == lp) break;       // 达到理论最短长度，无需再找
        }
    }
    for (int i = min_start; i < min_start + min_len; i++) {  // 输出最短子串
        printf("%c", S[i]);
    }
    printf("\n");
    return 0;
}