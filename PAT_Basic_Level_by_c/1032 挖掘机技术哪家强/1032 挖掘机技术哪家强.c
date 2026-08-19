/*
 * 题目：1032 挖掘机技术哪家强
 * 实现原理：
 *   统计各学校的总分，找出总分最高的学校。
 *   算法步骤：
 *   1. 使用数组scores存储每个学校的总分（学校编号作为下标）
 *   2. 输入每个学校的编号和分数，累加到对应位置
 *   3. 遍历数组找出最大总分及对应的学校编号
 *   注意：学校编号范围为1-100000，数组大小需足够。
 */
#include <stdio.h>

int main() {
    int n;
    scanf("%d", &n);
    int scores[100010] = {0};  // 以学校编号为下标的分数累计数组
    for (int i = 0; i < n; i++) {
        int id, score;
        scanf("%d %d", &id, &score);
        scores[id] += score;  // 累加到对应学校
    }
    int max_id = 1, max_score = scores[1];  // 先假设 1 号学校总分最高
    for (int i = 2; i <= 100000; i++) {
        if (scores[i] > max_score) {  // 找到更大的总分则更新
            max_score = scores[i];
            max_id = i;
        }
    }
    printf("%d %d\n", max_id, max_score);
    return 0;
}