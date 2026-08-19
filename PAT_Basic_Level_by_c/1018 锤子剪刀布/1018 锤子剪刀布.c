/*
 * 题目：1018 锤子剪刀布
 * 实现原理：
 *   统计甲乙两人玩锤子剪刀布游戏的胜负情况，并找出两人使用次数最多的手势。
 *   胜负规则：
 *   - 锤子(B)胜剪刀(J)
 *   - 剪刀(J)胜布(C)
 *   - 布(C)胜锤子(B)
 *   算法步骤：
 *   1. 统计甲的胜负平次数，以及甲、乙各自使用B/C/J的次数
 *   2. 根据胜负关系判断每次比赛结果
 *   3. 找出甲、乙使用次数最多的手势（按B>C>J的优先级）
 *   4. 输出甲的胜负平次数、乙的胜负平次数、两人最多手势
 */
#include <stdio.h>

int main() {
    int n;
    scanf("%d", &n);
    int jia_win = 0, jia_draw = 0, jia_lose = 0;   // 甲胜、平、负的次数
    int jia_b = 0, jia_c = 0, jia_j = 0;           // 甲获胜时使用的 B/C/J 次数
    int yi_b = 0, yi_c = 0, yi_j = 0;              // 乙获胜时使用的 B/C/J 次数
    for (int i = 0; i < n; i++) {
        char jia, yi;
        scanf(" %c %c", &jia, &yi);
        if (jia == yi) {                           // 手势相同：平局
            jia_draw++;
        } else if ((jia == 'C' && yi == 'J') || (jia == 'J' && yi == 'B') || (jia == 'B' && yi == 'C')) {  // 甲胜（规则：C 胜 J、J 胜 B、B 胜 C）
            jia_win++;
            if (jia == 'B') jia_b++;
            else if (jia == 'C') jia_c++;
            else jia_j++;
        } else {                                   // 甲负，即乙胜
            jia_lose++;
            if (yi == 'B') yi_b++;
            else if (yi == 'C') yi_c++;
            else yi_j++;
        }
    }
    printf("%d %d %d\n", jia_win, jia_draw, jia_lose);   // 甲的胜平负
    printf("%d %d %d\n", jia_lose, jia_draw, jia_win);   // 乙的胜平负（与甲互为镜像）
    char jia_max = jia_b >= jia_c ? (jia_b >= jia_j ? 'B' : 'J') : (jia_c >= jia_j ? 'C' : 'J');   // 甲胜时最多用的手势（次数相同取字母序小者）
    char yi_max = yi_b >= yi_c ? (yi_b >= yi_j ? 'B' : 'J') : (yi_c >= yi_j ? 'C' : 'J');          // 乙胜时最多用的手势
    printf("%c %c\n", jia_max, yi_max);
    return 0;
}