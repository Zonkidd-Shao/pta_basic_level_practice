/*
 * 题目：1122 找奇葩
 * 实现原理：
 *   在一堆数字中找出出现次数为奇数的那个数字（奇葩）。
 *   规则：所有数字都是奇数，且只有一个数字出现奇数次，其余都出现偶数次。
 *   算法步骤：
 *   1. 使用cnt数组统计每个奇数出现的次数
 *   2. 遍历cnt数组，找到出现次数为奇数的数字
 *   3. 输出该数字
 */
#include <stdio.h>

#define MAX_VAL 100001

int main() {
    int n;
    scanf("%d", &n);        // 数字个数
    int cnt[MAX_VAL] = {0}; // 统计每个奇数出现的次数
    for (int i = 0; i < n; i++) {
        int num;
        scanf("%d", &num);
        if (num % 2 == 1) {     // 只统计奇数
            cnt[num]++;
        }
    }
    for (int i = 1; i < MAX_VAL; i += 2) {  // 遍历所有奇数，找出现次数为奇数的
        if (cnt[i] % 2 == 1) {  // 出现奇数次即为"奇葩"
            printf("%d\n", i);
            break;
        }
    }
    return 0;
}