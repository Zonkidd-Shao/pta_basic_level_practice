/*
 * 1120 买地攻略
 *
 * 【实现原理】
 * 题目给定预算 M 元，以及 N 块土地（每块有价格和面积），要求在预算内选择若干块土地
 * 使得总面积最大。这是一个典型的 0-1 背包问题：
 * - 背包容量：预算 M
 * - 物品重量：土地价格
 * - 物品价值：土地面积
 *
 * 【算法思路】
 * 1. 将价格视为重量，面积视为价值，使用 DP 数组 dp[j] 表示预算为 j 时能获得的最大面积。
 * 2. 使用一维滚动数组优化空间：对每块土地 i，从 M 向下遍历到 price[i]，
 *    状态转移方程：dp[j] = max(dp[j], dp[j - price[i]] + area[i])。
 * 3. dp[M] 即为预算 M 下能获得的最大总面积。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N × M)，其中 N 为土地数量，M 为预算上限。
 * - 空间复杂度：O(M)，一维 DP 数组。
 */
#include <iostream>
#include <vector>

using namespace std;

int main() {
    int n;
    long long m;
    if (!(cin >> n >> m)) return 0;
    vector<int> price(n), area(n);
    for (int i = 0; i < n; ++i) cin >> price[i] >> area[i]; // 读入每块地的价格和面积

    vector<long long> dp(m + 1, 0);              // dp[j] = 预算 j 时的最大总面积
    for (int i = 0; i < n; ++i) {
        // 一维 0-1 背包，逆向遍历避免重复选择
        for (long long j = m; j >= price[i]; --j)
            dp[j] = max(dp[j], dp[j - price[i]] + area[i]);
    }
    cout << dp[m] << endl;                       // 输出最大总面积
    return 0;
}