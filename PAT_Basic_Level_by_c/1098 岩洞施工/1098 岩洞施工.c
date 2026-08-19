/*
 * 题目：1098 岩洞施工
 * 实现原理：
 *   判断岩洞是否可以施工。已知n个柱子的顶部和底部高度，要在柱子之间搭建木板。
 *   木板必须水平放置，且不能高于任何柱子的顶部，也不能低于任何柱子的底部。
 *   如果可以施工，输出"Yes"和最大空隙；否则输出"No"和最小需要的高度。
 *   算法步骤：
 *   1. 找到所有柱子顶部高度的最小值min_top
 *   2. 找到所有柱子底部高度的最大值max_bottom
 *   3. 如果min_top >= max_bottom + 1，说明可以施工，空隙为min_top - max_bottom
 *   4. 否则，无法施工，需要的高度为1 - (min_top - max_bottom)
 */
#include <stdio.h>

int main() {
    int n;
    scanf("%d", &n);
    int top[100], bottom[100];      // top:各柱顶部高度; bottom:各柱底部高度
    for (int i = 0; i < n; i++) scanf("%d", &top[i]);
    for (int i = 0; i < n; i++) scanf("%d", &bottom[i]);
    int min_top = top[0], max_bottom = bottom[0];
    for (int i = 1; i < n; i++) {   // 找最低的顶部和最高的底部
        if (top[i] < min_top) min_top = top[i];
        if (bottom[i] > max_bottom) max_bottom = bottom[i];
    }
    int diff = min_top - max_bottom;    // 木板可放置的高度间隙
    if (diff >= 1) printf("Yes %d\n", diff);    // 间隙>=1才可施工，输出最大空隙
    else printf("No %d\n", 1 - diff);           // 否则输出还需挖去的最小高度
    return 0;
}