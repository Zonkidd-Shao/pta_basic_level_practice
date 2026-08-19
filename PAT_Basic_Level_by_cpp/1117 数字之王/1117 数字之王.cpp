// 1117 数字之王
//
// 实现原理：
// 给定 N1 < N2，把从 N1 到 N2 的每个数的各位数的立方相乘，再将结果的各位数求和，
// 得到一批新的数字，再对这批新的数字重复上述操作，直到所有数字都是 1 位数为止。
// 此时出现次数最多的 1 位数即为"数字之王"；若有并列，按递增序输出。
//
// 关键步骤：
// 1. 定义变换 f(x)：对 x 的每一位求立方并相乘，再对乘积的各位数字求和。
// 2. 对区间 [N1, N2] 的每个数反复应用 f，直到所有数都变为 1 位数。
// 3. 统计每个 1 位数（0~9）的出现次数，找出最大次数。
// 4. 输出最大次数，以及所有达到该次数的数字（递增序）。
//
// 复杂度分析：
// 时间复杂度：O((N2-N1+1) * 迭代次数)，迭代次数很小。
// 空间复杂度：O(N2-N1+1)，存储当前数字序列。
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

// 变换：各位数的立方相乘，再对乘积的各位数求和
int f(int x) {
    if (x == 0) return 0;                     // 0^3 = 0
    long long prod = 1;
    while (x) {
        int d = x % 10;
        prod *= (long long)d * d * d;         // 各位数立方相乘
        x /= 10;
    }
    int sum = 0;
    while (prod) { sum += prod % 10; prod /= 10; }  // 乘积的各位数求和
    return sum;
}

int main() {
    int n1, n2;
    if (!(cin >> n1 >> n2)) return 0;

    vector<int> a;
    for (int i = n1; i <= n2; ++i) a.push_back(i);

    // 反复变换直到所有数字都是 1 位数
    bool allOne = false;
    while (!allOne) {
        allOne = true;
        for (size_t i = 0; i < a.size(); ++i) {
            a[i] = f(a[i]);
            if (a[i] >= 10) allOne = false;
        }
    }

    int cnt[10] = {0};
    for (int v : a) cnt[v]++;                 // 统计每个 1 位数出现次数

    int maxc = 0;
    for (int i = 0; i < 10; ++i) maxc = max(maxc, cnt[i]);

    cout << maxc << endl;
    bool first = true;
    for (int i = 0; i < 10; ++i) {            // 递增序输出并列的数字之王
        if (cnt[i] == maxc) {
            if (!first) cout << ' ';
            cout << i;
            first = false;
        }
    }
    cout << endl;
    return 0;
}
