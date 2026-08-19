/*
 * 题目：1077 互评成绩计算
 * 实现原理：
 *   计算学生的最终成绩。评分规则：
 *   1. 去掉一个最高分和一个最低分
 *   2. 剩余分数取平均分作为g2
 *   3. g1是老师评分，最终成绩 = (g1 + g2) / 2，四舍五入取整
 *   算法步骤：
 *   1. 读取学生人数N和满分M
 *   2. 读取每个学生的g1和其他N-1个学生的评分
 *   3. 过滤无效分数（<0或>M），计算有效分数的总和、最大值和最小值
 *   4. 去掉最高最低分后计算平均分g2
 *   5. 计算最终成绩并输出
 */
#include <stdio.h>

int main() {
    int N, M;
    scanf("%d %d", &N, &M);
    for (int i = 0; i < N; i++) {   // 逐个处理每个学生
        int g1, score, sum = 0, max_score = 0, min_score = 100, cnt = 0;  // sum:有效评分和; max/min:最高/最低分; cnt:有效评分个数
        scanf("%d", &g1);       // 读入老师评分g1
        for (int j = 0; j < N - 1; j++) {
            scanf("%d", &score);
            if (score >= 0 && score <= M) {     // 只统计[0, M]范围内的合法评分
                sum += score;
                cnt++;
                if (score > max_score) max_score = score;   // 记录最高分
                if (score < min_score) min_score = score;   // 记录最低分
            }
        }
        sum -= max_score + min_score;   // 去掉一个最高分和一个最低分
        cnt -= 2;
        double g2 = sum * 1.0 / cnt;    // g2为剩余评分的平均值
        int final_score = (g1 + g2) / 2 + 0.5;  // 最终成绩=(g1+g2)/2，四舍五入取整
        printf("%d\n", final_score);
    }
    return 0;
}