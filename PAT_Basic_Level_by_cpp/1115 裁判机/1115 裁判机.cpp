// 1115 裁判机
//
// 实现原理：
// 数字游戏规则：裁判先给定两个不同的正整数，然后参加游戏的 N 个人轮流给出正整数。
// 要求给出的数字必须是前面已经出现的某两个正整数之差，且不能等于之前的任何一个数。
// 给出非法数字的人出局，出局后其后续数字不再考虑。
//
// 关键步骤：
// 1. 用布尔数组 vis 记录某个数字是否已经出现过，用集合 appeared 保存已出现的数字。
// 2. 对每个玩家给出的数字 x：若 x 已出现过则非法；否则检查是否存在两个已出现的
//    数字 a、b 使 |a - b| == x（即检查 a+x 或 a-x 是否已出现）。
// 3. 合法则加入已出现集合；非法则标记出局并输出 "Round #k: i is out."。
// 4. 全部轮次结束后输出赢家列表或 "No winner."。
//
// 复杂度分析：
// 时间复杂度：O(T^2)，T 为所有玩家给出的数字总数（N*M）。
// 空间复杂度：O(V)，V 为数字取值范围（10^5）。
#include <iostream>
#include <vector>
#include <set>

using namespace std;

int main() {
    int a, b;
    if (!(cin >> a >> b)) return 0;
    int n, m;
    cin >> n >> m;

    vector<vector<int>> g(n, vector<int>(m));
    for (int i = 0; i < n; ++i)
        for (int j = 0; j < m; ++j) cin >> g[i][j];

    const int MAXV = 100000;
    vector<bool> vis(MAXV + 1, false);
    set<int> appeared;
    vis[a] = vis[b] = true;
    appeared.insert(a);
    appeared.insert(b);

    vector<bool> out(n, false);
    int outCnt = 0;
    for (int round = 0; round < m; ++round) {
        for (int i = 0; i < n; ++i) {
            if (out[i]) continue;
            int x = g[i][round];
            bool valid = false;
            if (!vis[x]) {  // 不能等于之前出现过的数
                for (int p : appeared) {
                    if (p + x <= MAXV && vis[p + x]) { valid = true; break; }
                    if (p - x >= 0 && vis[p - x]) { valid = true; break; }
                }
            }
            if (valid) {
                vis[x] = true;
                appeared.insert(x);
            } else {
                out[i] = true;
                ++outCnt;
                cout << "Round #" << (round + 1) << ": " << (i + 1) << " is out." << endl;
            }
        }
    }

    if (outCnt == n) {
        cout << "No winner." << endl;
    } else {
        cout << "Winner(s):";
        for (int i = 0; i < n; ++i) if (!out[i]) cout << ' ' << (i + 1);
        cout << endl;
    }
    return 0;
}
