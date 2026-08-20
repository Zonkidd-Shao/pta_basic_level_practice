/*
 * 题目：1082 射击比赛
 * 实现原理：
 *   找出射击比赛中距离靶心最近和最远的选手。
 *   规则：靶心在原点(0,0)，距离 = x^2 + y^2（距离平方，避免浮点运算）
 *   算法步骤：
 *   1. 读取选手数量n
 *   2. 遍历每个选手，计算其射击位置到原点的距离平方
 *   3. 记录距离最小和最大的选手编号
 *   4. 输出最近和最远的选手编号
 */
#include <stdio.h>
#include <limits.h>
#include <string.h>

int main() {
    int n;
    scanf("%d", &n);
    int min_dis = INT_MAX, max_dis = -1;    // 最近、最远距离（初值取极端）
    char min_id[5], max_id[5];              // 存放最近、最远选手编号
    for (int i = 0; i < n; i++) {
        char id[5];
        int x, y;
        scanf("%s %d %d", id, &x, &y);
        int dis = x * x + y * y;            // 用距离平方比较大小，避免浮点运算
        if (dis < min_dis) {                // 找到更近的选手
            min_dis = dis;
            strcpy(min_id, id);
        }
        if (dis > max_dis) {                // 找到更远的选手
            max_dis = dis;
            strcpy(max_id, id);
        }
    }
    printf("%s %s\n", min_id, max_id);
    return 0;
}
