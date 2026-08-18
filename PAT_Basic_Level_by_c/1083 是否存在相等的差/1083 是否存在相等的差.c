/*
 * 题目：1083 是否存在相等的差
 * 实现原理：
 *   给定一个排列，计算每个元素与其位置的差的绝对值，统计出现次数大于1的差值。
 *   算法步骤：
 *   1. 使用count数组统计每个差值出现的次数
 *   2. 遍历输入，计算|x - i|（i从1开始）
 *   3. 从大到小输出出现次数大于1的差值及其次数
 */
#include <stdio.h>
#include <stdlib.h>

int main() {
    int n;
    scanf("%d", &n);
    int count[10000] = {0};     // count[i]记录差值为i的出现次数
    for (int i = 1; i <= n; i++) {      // 位置i从1开始编号
        int x;
        scanf("%d", &x);
        int diff = abs(x - i);          // 元素值与位置的差
        count[diff]++;
    }
    for (int i = 9999; i >= 0; i--) {   // 从大到小输出
        if (count[i] > 1) {             // 只输出出现次数大于1的差值
            printf("%d %d\n", i, count[i]);
        }
    }
    return 0;
}