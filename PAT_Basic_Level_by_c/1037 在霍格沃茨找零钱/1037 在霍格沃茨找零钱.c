/*
 * 题目：1037 在霍格沃茨找零钱
 * 实现原理：
 *   霍格沃茨货币单位：1 Galleon = 17 Sickles，1 Sickle = 29 Knuts
 *   计算应找回的零钱（应付金额 - 实付金额）。
 *   算法步骤：
 *   1. 将两个金额转换为Knuts总数
 *   2. 计算差值diff = total2 - total1
 *   3. 处理负数情况（输出负号）
 *   4. 将diff转换回Galleon.Sickle.Knut格式
 *   使用long long类型避免溢出。
 */
#include <stdio.h>

int main() {
    int g1, s1, k1, g2, s2, k2;  // 实付、应付金额的 Galleon.Sickle.Knut
    scanf("%d.%d.%d %d.%d.%d", &g1, &s1, &k1, &g2, &s2, &k2);
    long long total1 = g1 * 17 * 29 + s1 * 29 + k1;  // 实付金额统一换算为 Knut
    long long total2 = g2 * 17 * 29 + s2 * 29 + k2;  // 应付金额统一换算为 Knut
    long long diff = total2 - total1;  // 应找零（Knut 单位）
    if (diff < 0) {  // 应付大于实付 → 找零为负，先输出负号再取绝对值
        printf("-");
        diff = -diff;
    }
    int g = diff / (17 * 29);  // 换算回 Galleon 数
    diff %= 17 * 29;
    int s = diff / 29;  // 剩余的 Sickle 数
    int k = diff % 29;  // 最后的 Knut 数
    printf("%d.%d.%d\n", g, s, k);
    return 0;
}