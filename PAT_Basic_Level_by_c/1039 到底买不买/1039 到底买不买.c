/*
 * 题目：1039 到底买不买
 * 实现原理：
 *   判断珠子是否足够买，统计多余或缺少的珠子数量。
 *   算法步骤：
 *   1. 使用cnt数组统计店家拥有的每种珠子数量
 *   2. 遍历想买的珠子，对应数量减1
 *   3. 统计多余珠子（cnt[i] > 0）和缺少珠子（cnt[i] < 0）的数量
 *   4. 根据缺少数量判断能否购买
 */
#include <stdio.h>
#include <string.h>

int main() {
    char shop[1001], want[1001];  // 店家的珠串、想买的珠串
    scanf("%s %s", shop, want);
    int cnt[128] = {0};  // 按 ASCII 码统计珠子数量的差值（店家有 - 想要）
    for (int i = 0; shop[i]; i++) {  // 店家拥有的珠子每种 +1
        cnt[(unsigned char)shop[i]]++;
    }
    for (int i = 0; want[i]; i++) {  // 想买的珠子每种 -1
        cnt[(unsigned char)want[i]]--;
    }
    int extra = 0, missing = 0;  // 多余的珠子数、缺少的珠子数
    for (int i = 0; i < 128; i++) {
        if (cnt[i] > 0) extra += cnt[i];        // 店家有多余
        else if (cnt[i] < 0) missing -= cnt[i]; // 店家不够（差多少）
    }
    if (missing == 0) {  // 缺少为 0 → 能买，输出多余数量
        printf("Yes %d\n", extra);
    } else {
        printf("No %d\n", missing);
    }
    return 0;
}