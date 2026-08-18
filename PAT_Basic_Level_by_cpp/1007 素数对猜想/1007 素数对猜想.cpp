// 1007 素数对猜想
// 统计不超过 N 的相邻素数对中差为 2 的个数（N < 10^5）。
//
// 【实现原理】
// 算法思路：
//   1. 从 2 开始遍历到 N，使用试除法判断每个数是否为素数。
//   2. 维护前一个素数的值 prevPrime，当遇到新素数时，检查它与 prevPrime 的差是否为 2。
//   3. 若差为 2，则计数器加 1。
// 关键点：
//   - 试除法判断素数：只需检查到 sqrt(x) 即可，因为若 x 有因子，必有一个 ≤ sqrt(x)。
//   - 素数对 (2, 3) 的差为 1，不符合条件，不会计入。
// 时间复杂度：O(N * sqrt(N))，对于 N < 10^5 足够快。
// 空间复杂度：O(1)。
#include <iostream>

using namespace std;

// 判断素数
bool isPrime(int x) {
    if (x < 2) return false;
    for (int i = 2; i * i <= x; ++i) {
        if (x % i == 0) return false;
    }
    return true;
}

int main() {
    int n;
    if (!(cin >> n)) return 0;

    int cnt = 0;
    int prevPrime = 2; // 第一个素数
    for (int i = 3; i <= n; ++i) {
        if (isPrime(i)) {
            if (i - prevPrime == 2) ++cnt; // 相邻素数差为 2
            prevPrime = i;
        }
    }

    cout << cnt << endl;
    return 0;
}