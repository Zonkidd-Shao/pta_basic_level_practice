/*
 * 1099 性感素数
 *
 * 【实现原理】
 * "性感素数"（Sexy Primes）指相差 6 的一对素数，即 (p, p+6) 均为素数。
 * 给定一个正整数 N，要求找到最小的 p ≥ N，使得 p 和 p+6 均为素数。
 *
 * 【算法思路】
 * 1. 从 p = N 开始向上枚举。
 * 2. 对每个 p，判断 p 和 p+6 是否均为素数。
 * 3. 若是，则输出 p 和 p+6 并结束。
 *
 * isPrime 函数：
 * - 小于 2 不是素数。
 * - 试除法，检查从 2 到 sqrt(x) 是否能整除。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(p_max × √(p_max))，最坏情况需要遍历到找到为止。
 * - 空间复杂度：O(1)。
 */
#include <iostream>

using namespace std;

// 判断一个整数是否为素数
bool isPrime(int x) {
    if (x < 2) return false;
    for (int i = 2; i * i <= x; ++i)  // 试除法到 sqrt(x)
        if (x % i == 0) return false;
    return true;
}

int main() {
    int n;
    if (!(cin >> n)) return 0;
    for (int p = n; ; ++p) {           // 从 N 开始向上枚举
        if (isPrime(p) && isPrime(p + 6)) {  // 检查性感素数对条件
            cout << p << " " << p + 6 << endl;
            break;
        }
    }
    return 0;
}
