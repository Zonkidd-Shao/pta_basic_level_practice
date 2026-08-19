// 1120 买地攻略
//
// 实现原理：
// 给定 N 块连续土地的价格和客户手中的现金量 M，客户只能购买连续相邻的土地。
// 求有多少种不同的购买方案，使得所选连续土地的总价不超过 M。
//
// 关键步骤：
// 1. 使用滑动窗口（双指针）：维护窗口 [left, right] 的和 sum。
// 2. 右指针 right 逐步右移，累加价格；当 sum > M 时，左指针 left 右移并减去价格。
// 3. 对每个 right，以 right 结尾且和不超过 M 的连续子数组个数为 (right - left + 1)，
//    累加到答案。
//
// 复杂度分析：
// 时间复杂度：O(N)，每个元素最多进出窗口一次。
// 空间复杂度：O(N)，存储价格数组。
#include <iostream>
#include <vector>

using namespace std;

int main() {
    int n;
    long long m;
    if (!(cin >> n >> m)) return 0;
    vector<long long> a(n);
    for (int i = 0; i < n; ++i) cin >> a[i];

    long long cnt = 0, sum = 0;
    int left = 0;
    for (int right = 0; right < n; ++right) {
        sum += a[right];
        while (sum > m) { sum -= a[left]; ++left; }  // 收缩窗口使和不超过 M
        cnt += (right - left + 1);                   // 以 right 结尾的合法方案数
    }
    cout << cnt << endl;
    return 0;
}
