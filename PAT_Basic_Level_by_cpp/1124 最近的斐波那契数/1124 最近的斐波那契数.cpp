// 1124 最近的斐波那契数
//
// 实现原理：
// 斐波那契数列 F0=0, F1=1, Fn+2 = Fn+1 + Fn。给定正整数 N（<=10^8），
// 找出与 N 差之绝对值最小的斐波那契数；若解不唯一，输出较小的那个。
//
// 关键步骤：
// 1. 预生成斐波那契数列，直到超过 10^8。
// 2. 遍历所有斐波那契数，计算与 N 的绝对差值。
// 3. 记录差值最小的斐波那契数；差值相同时取较小的那个。
//
// 复杂度分析：
// 时间复杂度：O(K)，K 为预生成的斐波那契数个数（约 40 个）。
// 空间复杂度：O(K)，存储斐波那契数列。
#include <iostream>
#include <vector>
#include <cmath>

using namespace std;

int main() {
    long long n;
    if (!(cin >> n)) return 0;

    // 预生成斐波那契数列，直到超过 10^8
    vector<long long> fib = {0, 1};
    while (fib.back() < 100000000)
        fib.push_back(fib[fib.size() - 1] + fib[fib.size() - 2]);

    long long best = fib[0], bestDiff = 1LL << 60;
    for (long long f : fib) {
        long long d = llabs(f - n);
        // 差值更小，或差值相等但取较小的斐波那契数
        if (d < bestDiff || (d == bestDiff && f < best)) { bestDiff = d; best = f; }
    }
    cout << best << endl;
    return 0;
}
