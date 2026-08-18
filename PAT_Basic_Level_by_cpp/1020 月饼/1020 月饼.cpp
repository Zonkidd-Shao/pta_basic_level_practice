// 1020 月饼
// 给定多种月饼的库存量与总售价，以及市场最大需求量，求最大收益（可拆卖部分库存）。
// 贪心策略：按单价（总售价/库存）从高到低优先售出。
//
// 【实现原理】
// 算法思路：
//   这是一个典型的分数背包问题（Fractional Knapsack Problem）。
//   1. 计算每种月饼的单价（总售价 / 库存量）。
//   2. 按单价从高到低对所有月饼排序。
//   3. 从单价最高的月饼开始遍历：
//      - 若当前月饼的库存量 <= 剩余需求量，则全部售出，收益增加该月饼的总售价。
//      - 否则，售出部分库存（按单价计算），收益增加单价 * 剩余需求量，需求量清零。
//   4. 当需求量耗尽或遍历完所有月饼时停止。
// 关键点：
//   - 使用 double 处理可能产生小数的情况。
//   - 浮点数比较时使用 1e-9 作为精度阈值。
//   - 库存量和需求量单位一致（万吨），总售价单位（亿元），收益单位为亿元。
// 时间复杂度：O(N log N)，排序为主要开销。
// 空间复杂度：O(N)。
#include <iostream>
#include <vector>
#include <algorithm>
#include <iomanip>

using namespace std;

struct Mooncake {
    double stock;  // 库存量（万吨）
    double price;  // 总售价（亿元）
    double unit;   // 单价 = price / stock
};

int main() {
    int n;
    double d; // 最大需求量（万吨）
    if (!(cin >> n >> d)) return 0;

    vector<Mooncake> m(n);
    for (int i = 0; i < n; ++i) cin >> m[i].stock;
    for (int i = 0; i < n; ++i) cin >> m[i].price;
    for (int i = 0; i < n; ++i) m[i].unit = m[i].price / m[i].stock;

    // 按单价降序
    sort(m.begin(), m.end(), [](const Mooncake& a, const Mooncake& b) {
        return a.unit > b.unit;
    });

    double profit = 0.0;
    for (int i = 0; i < n && d > 1e-9; ++i) {
        if (m[i].stock <= d) {
            profit += m[i].price;
            d -= m[i].stock;
        } else {
            profit += m[i].unit * d;
            d = 0;
        }
    }

    cout << fixed << setprecision(2) << profit << endl;
    return 0;
}