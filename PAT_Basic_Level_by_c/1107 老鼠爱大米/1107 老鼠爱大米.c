/*
 * 题目：1107 老鼠爱大米
 * 实现原理：
 *   N只老鼠进行M轮比赛，每轮比赛选出体重最大的老鼠成为本轮冠军。
 *   最终冠军是所有轮次冠军中体重最大的那只。
 *   算法步骤：
 *   1. 读取N和M
 *   2. 对每只老鼠，读取M轮比赛的体重，记录每轮的最大体重
 *   3. 跟踪所有老鼠中的最大体重（最终冠军）
 *   4. 输出每只老鼠的冠军体重，然后输出最终冠军体重
 */
#include <stdio.h>

int main() {
    int N, M;
    scanf("%d %d", &N, &M);     // N 只老鼠，每只进行 M 轮比赛
    int champions[100];         // 每只老鼠的冠军体重
    int max_champion = -1;      // 最终冠军体重（所有冠军中的最大值）
    for (int i = 0; i < N; i++) {
        int max_weight = -1;    // 当前老鼠 M 轮中的最大体重
        for (int j = 0; j < M; j++) {
            int weight;
            scanf("%d", &weight);   // 读入一轮比赛的体重
            if (weight > max_weight) {
                max_weight = weight;    // 更新本轮冠军体重
            }
        }
        champions[i] = max_weight;      // 记录该老鼠的冠军体重
        if (max_weight > max_champion) {
            max_champion = max_weight;  // 更新最终冠军
        }
    }
    for (int i = 0; i < N; i++) {   // 输出每只老鼠的冠军体重
        if (i > 0) printf(" ");
        printf("%d", champions[i]);
    }
    printf("\n%d\n", max_champion); // 最后输出最终冠军体重
    return 0;
}