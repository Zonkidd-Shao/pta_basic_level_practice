/*
 * 1124 最近的斐波那契数
 *
 * 【实现原理】
 * 题目给定多个查询，每个查询给出一个整数 x，要求输出离 x 最近的斐波那契数。
 * 如果存在两个距离相等的斐波那契数，取较小的那个。
 *
 * 【算法思路】
 * 1. 预先生成斐波那契数列到 1e18 以上（足以覆盖题目给定的查询范围）。
 * 2. 对于每个查询 x，遍历所有预生成的斐波那契数，计算绝对差值 |f - x|。
 * 3. 记录差值最小的斐波那契数（差值相同时取较小的 f）。
 * 4. 输出结果。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(Q × K)，其中 Q 为查询次数，K 为预生成的斐波那契数个数（约 90 个）。
 * - 空间复杂度：O(K)，存储预生成的斐波那契数列。
 */
#include <iostream>
#include <vector>
#include <cmath>

using namespace std;

int main() {
    // 预生成斐波那契数列，直到超过 1e18
    vector<long long> fib = {1, 1};
    while (fib.back() < 1e18) fib.push_back(fib[fib.size() - 1] + fib[fib.size() - 2]);

    int n;
    if (!(cin >> n)) return 0;
    while (n--) {
        long long x;
        cin >> x;
        long long best = fib[0], bestDiff = 1LL << 60;
        for (long long f : fib) {
            long long d = llabs(f - x);          // 计算绝对差值
            // 差值更小，或差值相等但斐波那契数更小
            if (d < bestDiff || (d == bestDiff && f < best)) { bestDiff = d; best = f; }
        }
        cout << best << endl;
    }
    return 0;
}