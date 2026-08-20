/*
 * 题目：1112 超标区间
 * 实现原理：
 *   找出所有连续超标区间（数值大于T），并输出区间范围。如果所有数值都不超标，则输出最大值。
 *   算法步骤：
 *   1. 读取N和T
 *   2. 遍历数组，跟踪当前是否在超标区间内
 *   3. 遇到大于T且不在区间内时，记录区间开始位置并输出"[i, "
 *   4. 遇到小于等于T且在区间内时，记录区间结束位置并输出"i-1]"
 *   5. 处理最后一个区间（如果数组末尾仍在超标区间内）
 *   6. 如果没有超标区间，输出最大值
 */
#include <stdio.h>

int main() {
    int N, T;
    scanf("%d %d", &N, &T);     // 数据个数 N 和超标阈值 T
    int max_val = -1;           // 所有数中的最大值
    int in_interval = 0;        // 当前是否处于超标区间中
    for (int i = 0; i < N; i++) {
        int a;
        scanf("%d", &a);        // 依次读入每个数值
        if (a > max_val) max_val = a;
        if (a > T && !in_interval) {    // 新超标区间开始
            in_interval = 1;
            printf("[%d, ", i);
        }
        if (a <= T && in_interval) {    // 超标区间结束
            in_interval = 0;
            printf("%d]\n", i - 1);
        }
    }
    if (!in_interval && max_val <= T) { // 无任何超标区间时输出最大值
        printf("%d\n", max_val);
    } else if (in_interval) {           // 区间延伸到末尾，闭合最后一个区间
        printf("%d]\n", N - 1);
    }
    return 0;
}
