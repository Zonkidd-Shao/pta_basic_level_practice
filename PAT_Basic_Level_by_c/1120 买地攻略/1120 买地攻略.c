/*
 * 题目：1120 买地攻略
 * 实现原理：
 *   统计有多少块连续土地的价格总和不超过预算m。
 *   算法步骤：
 *   1. 读取土地数量n和预算m
 *   2. 使用前缀和数组price，price[i]表示前i块土地的总价格
 *   3. 枚举所有可能的连续土地区间[i, j]
 *   4. 计算区间价格总和price[j] - price[i-1]，如果<=m则计数加1
 *   5. 输出总计数
 */
#include <stdio.h>

#define MAXN 10005

int main() {
    int n, m;
    scanf("%d %d", &n, &m);     // 土地数量 n，预算 m
    int price[MAXN] = {0};      // price[i] 为前 i 块土地价格总和（前缀和）
    for (int i = 1; i <= n; i++) {
        scanf("%d", &price[i]);
        price[i] += price[i-1];     // 累加为前缀和
    }
    int ans = 0;
    for (int i = 1; i <= n; i++) {          // 枚举连续区间起点
        for (int j = i; j <= n; j++) {      // 枚举区间终点
            if (price[j] - price[i-1] <= m) {   // 区间总价不超过预算则计数
                ans++;
            }
        }
    }
    printf("%d\n", ans);
    return 0;
}