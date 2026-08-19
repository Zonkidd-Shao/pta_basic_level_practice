/*
 * 1083 是否存在相等的差
 *
 * 【实现原理】
 * 给定一个 1~N 的排列（即包含 1 到 N 各恰好一次），
 * 对每个位置 i（从 1 开始），计算差 d = |i - a[i]|，
 * 统计每个差值出现的次数，输出出现次数 ≥ 2 的差值及其次数，
 * 按差值从大到小输出。
 *
 * 【算法思路】
 * 1. 读取 N。
 * 2. 用 map 统计每个差值出现的次数，键为差值，值为次数。
 * 3. 使用 map 的反向迭代器（从大到小）遍历：
 *    - 若某差值的出现次数 ≥ 2，输出差值及次数。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N log N)，map 的插入和遍历均为 O(log N)。
 * - 空间复杂度：O(N)，最坏情况下每个差值都不同。
 */
#include <iostream>
#include <vector>
#include <map>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;
    map<int, int> cnt;       // 键：差值，值：出现次数
    for (int i = 1; i <= n; ++i) {
        int a;
        cin >> a;
        ++cnt[abs(i - a)];   // 计算 |位置 - 数值| 并计数
    }
    // 反向遍历 map（按差值从大到小输出）
    for (auto it = cnt.rbegin(); it != cnt.rend(); ++it) {
        if (it->second >= 2) cout << it->first << " " << it->second << endl;
    }
    return 0;
}
