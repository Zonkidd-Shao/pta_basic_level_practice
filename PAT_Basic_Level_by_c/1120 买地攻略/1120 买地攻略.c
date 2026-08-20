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
    int price[MAXN];
    int left = 0;
    long long window = 0;
    long long ans = 0;
    for (int right = 0; right < n; right++) {
        scanf("%d", &price[right]);
        window += price[right];
        while (left <= right && window > m)
            window -= price[left++];
        ans += right - left + 1;
    }
    printf("%lld\n", ans);
    return 0;
}
