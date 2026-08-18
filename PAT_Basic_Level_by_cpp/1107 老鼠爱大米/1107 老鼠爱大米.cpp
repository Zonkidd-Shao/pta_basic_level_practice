/*
 * 1107 老鼠爱大米
 *
 * 【实现原理】
 * 模拟老鼠吃米的过程。有 M 个碗，每个碗中有一定量的米。N 只老鼠按顺序依次行动，
 * 每只老鼠选择当前米量最多的碗（若有并列，取编号最小的碗），吃掉其中一半（向下取整），
 * 输出每只老鼠吃到的米量。
 *
 * 【算法思路】
 * 1. 使用数组 bowl[1..M] 存储每个碗的当前米量。
 * 2. 对每只老鼠：
 *    a. 遍历所有碗，找出当前米量最多的碗（米量相等时取编号最小的）。
 *    b. 计算该碗当前米量的一半（向下取整），记录为该老鼠吃到的米量。
 *    c. 从该碗中扣除这部分米量。
 * 3. 输出所有老鼠吃到的米量序列。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N × M)，每只老鼠需要遍历所有碗选择最优。
 * - 空间复杂度：O(M + N)，存储碗的米量和老鼠的进食记录。
 */
#include <iostream>
#include <vector>

using namespace std;

int main() {
    int m;
    if (!(cin >> m)) return 0;
    vector<long long> bowl(m + 1);               // 碗编号 1..M
    for (int i = 1; i <= m; ++i) cin >> bowl[i]; // 读入每个碗的初始米量

    int n;
    cin >> n;                                     // 老鼠数量
    vector<long long> eaten(n);
    for (int r = 0; r < n; ++r) {
        int best = 1;
        // 遍历所有碗，找出当前米量最多的碗（编号最小优先）
        for (int i = 2; i <= m; ++i)
            if (bowl[i] > bowl[best]) best = i;
        long long e = bowl[best] / 2;            // 吃掉一半（向下取整）
        eaten[r] = e;
        bowl[best] -= e;                         // 从碗中扣减
    }
    for (int r = 0; r < n; ++r) {
        if (r) cout << ' ';
        cout << eaten[r];                        // 输出每只老鼠吃到的米量
    }
    cout << endl;
    return 0;
}