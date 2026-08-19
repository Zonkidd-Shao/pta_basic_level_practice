/*
 * 题目：1053 住房空置率
 * 实现原理：
 *   根据用电量判断住房空置情况，统计空置率和可疑空置率。
 *   判断规则：
 *   - 若用电量低于阈值e的天数超过一半，且观测天数K>D：空置房
 *   - 若用电量低于阈值e的天数超过一半，但K<=D：可疑空置房
 *   算法步骤：
 *   1. 读取N个住户的观测数据
 *   2. 对每个住户，统计用电量低于e的天数lower
 *   3. 根据规则分类统计pempty（可疑空置）和empty（空置）
 *   4. 计算百分比并输出（保留一位小数）
 */
#include <stdio.h>

int main() {
    int N, D, K;      // N: 住户数; D: 空置判定阈值; K: 某住户的观测天数
    double e, E;      // e: 用电量阈值; E: 某天的用电量
    int pempty = 0, empty = 0;  // 可疑空置房与空置房的计数
    scanf("%d %lf %d", &N, &e, &D);
    
    for (int i = 0; i < N; i++) {  // 逐个住户统计
        int lower = 0;  // 用电量低于阈值 e 的天数
        scanf("%d", &K);
        for (int j = 0; j < K; j++) {
            scanf("%lf", &E);
            if (E < e) lower++;
        }
        if (lower > K / 2 && K > D) {  // 超半数天低于 e 且观察期超过 D：空置房
            empty++;
        } else if (lower > K / 2) {    // 超半数但观察期未超过 D：可疑空置房
            pempty++;
        }
    }
    
    printf("%.1f%% %.1f%%\n", pempty * 100.0 / N, empty * 100.0 / N);  // 输出两种比例
    return 0;
}