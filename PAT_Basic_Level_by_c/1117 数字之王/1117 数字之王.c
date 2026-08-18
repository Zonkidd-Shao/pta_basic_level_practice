/*
 * 题目：1117 数字之王
 * 实现原理：
 *   对区间[N1, N2]中的所有数字进行变换，直到所有数字都变成个位数。
 *   变换规则：将数字的每一位立方后相乘，再将结果的各位数字相加。
 *   统计最终各个个位数出现的次数，找出出现次数最多的数字。
 *   算法步骤：
 *   1. 将区间[N1, N2]的数字存入nums数组
 *   2. 循环变换：对每个数字，计算各位立方乘积，再求和各位数字
 *   3. 当所有数字都变成个位数时停止
 *   4. 统计每个数字出现的次数
 *   5. 输出出现次数最多的数字及其次数
 */
#include <stdio.h>
#include <math.h>

int main() {
    int N1, N2;
    scanf("%d %d", &N1, &N2);   // 区间上下界
    int len = N2 - N1 + 1;      // 区间内数字个数
    int nums[1001];             // 存储区间内的每个数字
    for (int i = 0; i < len; i++) {
        nums[i] = N1 + i;
    }
    while (1) {
        int all_single = 1;     // 检查是否所有数字都已变成个位数
        for (int i = 0; i < len; i++) {
            if (nums[i] >= 10) {
                all_single = 0;
                break;
            }
        }
        if (all_single) break;  // 全部变为个位数则停止变换
        for (int i = 0; i < len; i++) {     // 对每个数字执行一轮变换
            if (nums[i] == 0) continue;
            int temp = 1;
            int num = nums[i];
            while (num) {       // 各位数字立方后相乘
                int d = num % 10;
                temp *= d * d * d;
                num /= 10;
            }
            int sum = 0;
            while (temp) {      // 再将乘积的各位数字相加
                sum += temp % 10;
                temp /= 10;
            }
            nums[i] = sum;
        }
    }
    int cnt[10] = {0};          // 统计最终各数字出现的次数
    for (int i = 0; i < len; i++) {
        cnt[nums[i]]++;
    }
    int max_cnt = 0;            // 找出最大出现次数
    for (int i = 0; i < 10; i++) {
        if (cnt[i] > max_cnt) max_cnt = cnt[i];
    }
    printf("%d\n", max_cnt);
    int first = 1;              // 输出所有达到最大次数的数字，以空格分隔
    for (int i = 0; i < 10; i++) {
        if (cnt[i] == max_cnt) {
            if (!first) printf(" ");
            printf("%d", i);
            first = 0;
        }
    }
    printf("\n");
    return 0;
}