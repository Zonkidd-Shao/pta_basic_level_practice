/*
 * 1096 大美数
 *
 * 【实现原理】
 * "大美数"定义为可以表示为至少两个不同斐波那契数之和的正整数。
 * 对每个查询的整数 k，判断是否能由至少两个不同的斐波那契数相加得到。
 * 本题使用动态规划中的"最少硬币凑数"思想，计算凑出 k 需要的最少不同
 * 斐波那契数的个数，若最少个数 ≥ 2 则输出 "Yes"，否则输出 "No"。
 *
 * 【算法思路】
 * 1. 预先生成不超过 10^5 的斐波那契数列（从 1, 2 开始）。
 * 2. 对每个查询 k：
 *    a. 初始化数组 minT[0..k] 为极大值，minT[0] = 0。
 *    b. 对每个斐波那契数 f（≤ k），采用 0-1 背包（逆序）更新：
 *       minT[s] = min(minT[s], minT[s - f] + 1)。
 *    c. 若 minT[k] ≥ 2（即至少需要 2 个不同的斐波那契数），输出 "Yes"。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(Q·K·F)，Q 为查询数，K 为查询值，F 为不超过 K 的斐波那契数个数。
 * - 空间复杂度：O(K)，用于 DP 数组。
 */
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main() {
    // 生成不重复的斐波那契数（1,2,3,5,8,...）至 1e5 以上
    vector<int> fib = {1, 2};
    while (fib.back() < 100000) {
        fib.push_back(fib[fib.size() - 1] + fib[fib.size() - 2]);
    }

    int n;
    if (!(cin >> n)) return 0;
    for (int i = 0; i < n; ++i) {
        int k;
        cin >> k;
        // minT[s] = 凑出 s 所用的最少不同斐波那契数个数
        vector<int> minT(k + 1, 1e9);
        minT[0] = 0;
        // 0-1 背包（逆序遍历），每个斐波那契数最多选一次
        for (int f : fib) {
            if (f > k) break;
            for (int s = k; s >= f; --s)
                if (minT[s - f] != 1e9) minT[s] = min(minT[s], minT[s - f] + 1);
        }
        // 至少需要 2 个不同的斐波那契数才算是"大美数"
        cout << (minT[k] >= 2 ? "Yes" : "No") << endl;
    }
    return 0;
}
