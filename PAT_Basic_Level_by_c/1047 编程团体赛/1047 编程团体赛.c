/*
 * 题目：1047 编程团体赛
 * 实现原理：
 *   统计各团队的总分，找出总分最高的团队。
 *   输入格式：团队编号-队员编号 分数
 *   算法步骤：
 *   1. 使用score数组存储每个团队的总分（团队编号作为下标）
 *   2. 解析输入，提取团队编号和分数，累加到对应位置
 *   3. 遍历数组找出最大总分及对应的团队编号
 *   注意：团队编号范围为1-1000，数组大小设为1001即可。
 */
#include <stdio.h>

int main() {
    int N;
    int score[1001] = {0};  // 以团队编号为下标的团队总分数组
    
    scanf("%d", &N);
    for (int i = 0; i < N; i++) {
        int team, member, s;
        scanf("%d-%d %d", &team, &member, &s);  // 输入格式：团队编号-队员编号 分数
        score[team] += s;  // 累加到对应团队
    }
    
    int max_score = 0, max_team = 0;  // 最高总分、对应团队编号
    for (int i = 1; i <= 1000; i++) {
        if (score[i] > max_score) {  // 找到更大总分则更新
            max_score = score[i];
            max_team = i;
        }
    }
    
    printf("%d %d\n", max_team, max_score);
    
    return 0;
}