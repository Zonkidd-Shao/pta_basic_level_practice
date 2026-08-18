/*
 * 题目：1040 有几个PAT
 * 实现原理：
 *   统计字符串中PAT的个数。一个PAT满足：P在A前面，T在A后面。
 *   算法步骤：
 *   1. 先统计字符串中T的总个数
 *   2. 遍历字符串：
 *      - 遇到P，增加p_count
 *      - 遇到T，减少t_count（因为后面的A无法与这个T组成PAT）
 *      - 遇到A，累加答案：ans += p_count * t_count（当前位置前的P数 * 当前位置后的T数）
 *   3. 答案对1000000007取模
 *   时间复杂度：O(n)，空间复杂度：O(1)
 */
#include <stdio.h>
#include <string.h>

int main() {
    char s[100001];
    scanf("%s", s);
    int len = strlen(s);
    int t_count = 0;  // 字符串中 T 的总个数（随遍历逐步减少）
    for (int i = 0; i < len; i++) {
        if (s[i] == 'T') t_count++;
    }
    int p_count = 0;  // 已扫描过的 P 的个数
    long long ans = 0;  // 满足条件的 PAT 总数
    const int mod = 1000000007;
    for (int i = 0; i < len; i++) {
        if (s[i] == 'P') {
            p_count++;
        } else if (s[i] == 'T') {
            t_count--;  // 此 T 已被扫描过，之后的 A 无法再与它组成 PAT
        } else if (s[i] == 'A') {
            // 以当前 A 为中点：左侧 P 数 × 右侧 T 数 = 可组成的 PAT 数
            ans = (ans + (long long)p_count * t_count) % mod;
        }
    }
    printf("%lld\n", ans);
    return 0;
}