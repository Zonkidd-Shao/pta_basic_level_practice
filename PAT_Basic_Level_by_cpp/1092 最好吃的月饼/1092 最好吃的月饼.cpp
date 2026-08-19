/*
 * 1092 最好吃的月饼
 *
 * 【实现原理】
 * 有 N 种月饼（编号 1~N），M 张投票，每张票投给一种月饼。
 * 统计得票数最高的月饼的票数，并输出所有获得该最高票数的月饼编号（升序）。
 *
 * 【算法思路】
 * 1. 读取 N 和 M。
 * 2. 用数组 cnt 统计每种月饼的得票数，下标从 1 到 N。
 * 3. 遍历 cnt 找出最高票数 maxv。
 * 4. 再次遍历，输出所有得票数等于 maxv 的月饼编号（空格分隔，行末无多余空格）。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N + M)，M 为投票数，N 为月饼种类数。
 * - 空间复杂度：O(N)，用于存储得票数。
 */
#include <iostream>
#include <vector>

using namespace std;

int main() {
    int n, m;
    if (!(cin >> n >> m)) return 0;
    vector<int> cnt(n + 1, 0);   // 得票统计，下标 1~N
    for (int i = 0; i < m; ++i) {
        int x;
        cin >> x;
        ++cnt[x];                // 给第 x 种月饼投票
    }
    int maxv = 0;
    for (int i = 1; i <= n; ++i) maxv = max(maxv, cnt[i]);  // 找出最高票数

    cout << maxv << endl;
    bool first = true;
    for (int i = 1; i <= n; ++i) {
        if (cnt[i] == maxv) {          // 输出所有得票最高的月饼编号
            if (!first) cout << ' ';
            cout << i;
            first = false;
        }
    }
    cout << endl;
    return 0;
}
