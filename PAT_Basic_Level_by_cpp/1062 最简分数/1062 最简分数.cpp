// 1062 最简分数
//
// 实现原理：
// 给定两个分数 a/b 和 c/d，以及一个分母 K，找出所有分母为 K 且值严格介于这两个分数之间
// 的最简分数（即分子与分母互质），按递增顺序输出。
//
// 算法思路：
// 1. 通过交叉相乘比较确保 a/b < c/d（若不满足则交换）
// 2. 遍历所有可能的分子 i (1 ≤ i < K)，检查两个条件：
//    a. gcd(i, K) == 1：分子分母互质，即最简分数
//    b. a/b < i/K < c/d：用交叉相乘避免浮点数比较
//       - a*K < b*i 等价于 a/b < i/K
//       - i*d < c*K 等价于 i/K < c/d
// 3. 收集所有满足条件的分子，按递增顺序输出
//
// 复杂度分析：
// 时间复杂度：O(K log K)，K 为分母值，每次判断需计算 gcd（O(log K)）。
// 空间复杂度：O(K)，用于存储结果。
#include <iostream>
#include <vector>
#include <algorithm>
#include <cstdlib>

using namespace std;

// 辗转相除法求最大公约数
int gcd(int a, int b) {
    a = abs(a); b = abs(b);
    while (b) { int t = a % b; a = b; b = t; }
    return a;
}

int main() {
    int a, b, c, d, k;
    if (scanf("%d/%d %d/%d %d", &a, &b, &c, &d, &k) != 5) return 0;

    // 保证 a/b < c/d，交叉相乘比较避免浮点数误差
    if ((long long)a * d > (long long)b * c) { swap(a, c); swap(b, d); }

    vector<int> res;
    for (int i = 1; i < k; ++i) {
        if (gcd(i, k) != 1) continue;          // 非最简分数，跳过
        // 交叉相乘判断 i/k 是否在 (a/b, c/d) 区间内
        if ((long long)a * k < (long long)b * i &&
            (long long)i * d < (long long)c * k)
            res.push_back(i);
    }

    // 输出结果，分数形式为 i/k
    for (size_t i = 0; i < res.size(); ++i) {
        if (i) cout << ' ';
        cout << res[i] << '/' << k;
    }
    cout << endl;
    return 0;
}