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
    int n;
    if (!(cin >> n)) return 0;
    for (int i = 0; i < n; ++i) {
        int k;
        cin >> k;
        vector<int> divisors;
        for (int d = 1; d * d <= k; ++d) {
            if (k % d != 0) continue;
            divisors.push_back(d);
            if (d * d != k) divisors.push_back(k / d);
        }
        bool ok = false;
        for (size_t a = 0; a < divisors.size() && !ok; ++a)
            for (size_t b = a + 1; b < divisors.size() && !ok; ++b)
                for (size_t c = b + 1; c < divisors.size() && !ok; ++c)
                    for (size_t d = c + 1; d < divisors.size(); ++d)
                        if ((divisors[a] + divisors[b] + divisors[c] + divisors[d]) % k == 0) {
                            ok = true;
                            break;
                        }
        cout << (ok ? "Yes" : "No") << endl;
    }
    return 0;
}
