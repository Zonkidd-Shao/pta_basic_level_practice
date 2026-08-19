/*
 * 题目：1038 统计同成绩学生
 * 实现原理：
 *   统计各分数的人数，查询指定分数的人数。
 *   算法步骤：
 *   1. 使用counts数组记录每个分数（0-100）的人数
 *   2. 输入n个分数，累加到对应位置
 *   3. 输入k个查询分数，输出对应人数
 *   注意：分数范围为0-100，数组大小设为101即可。
 */
#include <stdio.h>

int main() {
    int n;
    scanf("%d", &n);
    int counts[101] = {0};  // 以分数（0~100）为下标的计数数组
    for (int i = 0; i < n; i++) {
        int score;
        scanf("%d", &score);
        counts[score]++;  // 该分数人数 +1
    }
    int k;
    scanf("%d", &k);
    for (int i = 0; i < k; i++) {
        int score;
        scanf("%d", &score);
        printf("%d", counts[score]);
        if (i < k - 1) {  // 查询结果间用空格分隔，末尾无空格
            printf(" ");
        }
    }
    printf("\n");
    return 0;
}