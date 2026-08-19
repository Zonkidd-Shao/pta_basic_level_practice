/*
 * 题目：1026 程序运行时间
 * 实现原理：
 *   计算程序运行时间，输入为两个CPU时钟周期数（c1和c2）。
 *   算法步骤：
 *   1. 计算时间差：diff = c2 - c1
 *   2. 转换为毫秒：seconds = (diff + 50) / 100（+50实现四舍五入）
 *   3. 将秒数转换为小时、分钟、秒：
 *      - hh = seconds / 3600
 *      - mm = (seconds % 3600) / 60
 *      - ss = seconds % 60
 *   4. 格式化输出为HH:MM:SS（均为两位数）
 */
#include <stdio.h>

int main() {
    int c1, c2;                      // 起始与结束的时钟读数
    scanf("%d %d", &c1, &c2);
    int diff = c2 - c1;              // 两次读数之差，即程序耗用的时钟周期数
    int seconds = (diff + 50) / 100; // 时钟周期换算为秒（+50 实现四舍五入）
    int hh = seconds / 3600;         // 小时数
    int mm = (seconds % 3600) / 60;  // 分钟数
    int ss = seconds % 60;           // 秒数
    printf("%02d:%02d:%02d\n", hh, mm, ss);
    return 0;
}