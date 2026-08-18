/*
 * 1089 狼人杀-简单版
 *
 * 【实现原理】
 * 经典"狼人杀"游戏的简化推理题。N 个玩家中有 2 个狼人，其余为好人。
 * 每个玩家指认另一个玩家是狼人还是好人，已知：
 * - 恰有 1 个狼人说谎，恰有 1 个好人在说谎（即总共 2 人说谎）。
 * 要求找出可能的 2 个狼人编号（升序输出），若有多组解输出最小的一组，
 * 若无解输出 "No Solution"。
 *
 * 【算法思路】
 * 1. 读取 N 和每个玩家的指认信息（被指认者编号及指认是狼还是好人）。
 * 2. 枚举所有可能的狼人组合 (i, j)，其中 i < j。
 * 3. 对每组假设：
 *    a. 标记 i 和 j 为狼人，其余为好人。
 *    b. 遍历每位玩家 p，判断其陈述是否与事实相符：
 *       - 若 p 指认某人为狼，则事实是该人确实是狼则陈述为真。
 *       - 若 p 指认某人为好人，则事实是该人确实是好人则陈述为真。
 *    c. 若陈述为假（说谎）：p 是狼则狼人说谎计数 +1，否则好人说谎计数 +1。
 *    d. 若恰好 1 个狼人说谎且 1 个好人在说谎，则找到解，输出并结束。
 * 4. 遍历完所有组合无解则输出 "No Solution"。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N³)，枚举组合 O(N²)，每次验证 O(N)。
 * - 空间复杂度：O(N)，用于存储指认信息和狼人标记。
 */
#include <iostream>
#include <vector>
#include <string>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;

    vector<int> claimK(n + 1);       // 被指认者的编号
    vector<int> claimWolf(n + 1);    // 1 表示指认其为狼，0 表示指认为好人
    for (int i = 1; i <= n; ++i) {
        int k;
        string w;
        cin >> k >> w;
        claimK[i] = k;
        claimWolf[i] = (w.find('狼') != string::npos) ? 1 : 0;  // 根据字符串判断指认类型
    }

    // 枚举所有可能的狼人组合 (i, j)
    for (int i = 1; i <= n; ++i) {
        for (int j = i + 1; j <= n; ++j) {
            vector<int> isWolf(n + 1, 0);  // 标记每个玩家是否为狼人
            isWolf[i] = isWolf[j] = 1;      // 假设 i 和 j 是狼人

            int wolfLiars = 0, humanLiars = 0;  // 统计狼人说谎和好人说谎的人数
            for (int p = 1; p <= n; ++p) {
                // 判断玩家 p 的陈述是否与事实相符
                bool statementTrue = (claimWolf[p] == 1)
                                      ? (isWolf[claimK[p]] == 1)  // 指认是狼 → 事实该人是狼
                                      : (isWolf[claimK[p]] == 0); // 指认是好人 → 事实该人是好人
                if (!statementTrue) {
                    if (isWolf[p]) ++wolfLiars;   // 狼人说谎
                    else ++humanLiars;             // 好人说谎
                }
            }
            // 满足条件：恰好 1 个狼人说谎，1 个好人在说谎
            if (wolfLiars == 1 && humanLiars == 1) {
                cout << i << " " << j << endl;
                return 0;
            }
        }
    }
    cout << "No Solution" << endl;
    return 0;
}
