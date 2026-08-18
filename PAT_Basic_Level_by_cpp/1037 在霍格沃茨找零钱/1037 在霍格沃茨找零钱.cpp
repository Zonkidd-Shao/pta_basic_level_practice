/*
 * 1037 在霍格沃茨找零钱
 *
 * 【实现原理】
 * 哈利波特世界中的货币体系：1 Galleon = 17 Sickle，1 Sickle = 29 Knut。
 * 给定应付价格（P）和实付金额（A），格式均为 G.S.K，
 * 计算找零（A - P），若实付不足则找零为负数。
 *
 * 【算法思路】
 * 1. 将应付金额和实付金额都转换为最小单位 Knut
 * 2. 计算差价 change = paid - price（单位为 Knut）
 * 3. 若 change < 0，先输出负号，再取绝对值
 * 4. 将 change 从 Knut 反向转换为 Galleon.Sickle.Knut 格式
 * 5. 按格式输出
 *
 * 【关键点】
 * - 统一转换为最小单位 Knut 再计算，避免借位问题
 * - 转换公式：totalKnut = (G * 17 + S) * 29 + K
 * - 反向转换：G = change / (17*29)，S = change % (17*29) / 29，K = change % 29
 *
 * 【复杂度分析】
 * - 时间复杂度：O(1)，仅常数次运算
 * - 空间复杂度：O(1)
 */

#include <iostream>
#include <cstdio>

using namespace std;

int main() {
    int pg, ps, pk, ag, as, ak;
    if (scanf("%d.%d.%d %d.%d.%d", &pg, &ps, &pk, &ag, &as, &ak) != 6) return 0;

    // 统一转换为最小单位 Knut
    int price = (pg * 17 + ps) * 29 + pk;  // 应付金额（Knut）
    int paid = (ag * 17 + as) * 29 + ak;   // 实付金额（Knut）
    int change = paid - price;             // 找零（Knut）

    // 若找零为负，先输出负号再取绝对值
    if (change < 0) { cout << '-'; change = -change; }

    // 反向转换为 Galleon.Sickle.Knut 格式
    int g = change / (17 * 29);            // Galleon：1 G = 17*29 Knut
    change %= (17 * 29);                   // 剩余 Knut
    int s = change / 29;                   // Sickle：1 S = 29 Knut
    int k = change % 29;                   // 剩余 Knut

    printf("%d.%d.%d\n", g, s, k);
    return 0;
}