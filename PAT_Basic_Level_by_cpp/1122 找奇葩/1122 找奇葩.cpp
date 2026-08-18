/*
 * 1122 找奇葩
 *
 * 【实现原理】
 * 题目给定 N 个数，其中绝大多数数字都是相同的，只有一个"奇葩"与众不同。
 * 找出这个唯一的、出现次数为 1 的数字。如果不存在出现次数恰好为 1 的数字，
 * 则输出出现次数最少（但仍然可能出现多次）的数字，若次数并列则取最先出现的。
 *
 * 【算法思路】
 * 1. 使用 map<int, int> 统计每个数字的出现次数。
 * 2. 遍历数组，寻找出现次数为 1 的数字，找到则立即输出并返回。
 * 3. 若没有出现次数为 1 的数字，则遍历数组找出出现次数最少的数字（并列取最先）。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N × log(N))，map 操作 O(log N)。
 * - 空间复杂度：O(N)，存储计数映射。
 */
#include <iostream>
#include <vector>
#include <map>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;
    vector<int> a(n);
    map<int, int> cnt;                           // 数字 -> 出现次数
    for (int i = 0; i < n; ++i) { cin >> a[i]; ++cnt[a[i]]; } // 读入并统计

    // 优先寻找出现次数为 1 的"奇葩"
    for (int v : a) if (cnt[v] == 1) { cout << v << endl; return 0; }

    // 若不存在唯一值，则找出出现次数最少的（并列取最先出现）
    int minc = 1 << 30, ans = a[0];
    for (int v : a) if (cnt[v] < minc) { minc = cnt[v]; ans = v; }
    cout << ans << endl;
    return 0;
}