/*
 * 题目：1003 我要通过！
 * 实现原理：
 *   判断字符串是否满足"PAT"认证条件。有效字符串需满足以下规则：
 *   1. 只能包含P、A、T三种字符
 *   2. 恰好包含一个P和一个T，且P在T之前
 *   3. P和T之间至少有一个A
 *   4. 设P前有a个A，P和T之间有b个A，T后有c个A，则必须满足 a * b == c
 *   算法采用逐字符扫描，记录P和T的位置及各部分A的数量，最后验证条件。
 */
#include <stdio.h>
#include <string.h>

int main() {
    int n;
    scanf("%d", &n);
    while (n--) {                                       // 依次判定 n 个字符串
        char s[101];
        scanf("%s", s);
        int len = strlen(s);
        int p = -1, t = -1;                             // 记录 P、T 的下标（-1 表示未出现）
        int cnt_p = 0, cnt_t = 0, cnt_a = 0;            // P、T、A 的出现次数
        int flag = 1;                                   // 是否符合规则
        for (int i = 0; i < len; i++) {
            if (s[i] == 'P') {
                p = i;
                cnt_p++;
            } else if (s[i] == 'T') {
                t = i;
                cnt_t++;
            } else if (s[i] != 'A') {                   // 出现 P/A/T 以外的字符则非法
                flag = 0;
            }
        }
        if (cnt_p != 1 || cnt_t != 1 || p >= t || t - p == 1) {  // P、T 各恰一个且 P 在 T 前、中间至少一个 A
            flag = 0;
        }
        if (flag) {
            int a = p;              // P 前面的 A 数量
            int b = t - p - 1;      // P 与 T 之间的 A 数量
            int c = len - t - 1;    // T 后面的 A 数量
            if (a * b != c) {       // 核心条件：a * b 必须等于 c
                flag = 0;
            }
        }
        printf("%s\n", flag ? "YES" : "NO");
    }
    return 0;
}