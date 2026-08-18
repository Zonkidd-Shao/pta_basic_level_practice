/*
 * 1103 缘分数
 *
 * 【实现原理】
 * 题目给定两个整数 A 和 B，设 target = A² + B²。统计满足以下条件的整数对 (x, y) 的个数：
 * - 1 ≤ x < y
 * - x² + y² = target
 *
 * 【算法思路】
 * 1. 计算 target = a² + b²。
 * 2. 枚举 x 从 1 开始，满足 x² < target/2（因为 x < y 且 x² + y² = target，则 x² < target/2）。
 * 3. 对于每个 x，计算 rem = target - x²，判断 rem 是否为完全平方数：
 *    - 使用二分查找在 [1, rem] 范围内寻找整数 y 使得 y² = rem。
 * 4. 若找到 y 且 y > x，则计数器加 1。
 * 5. 输出计数结果。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(√target × log(target))，枚举 x 约 √(target/2) 次，每次二分查找 O(log(target))。
 * - 空间复杂度：O(1)，仅使用常数个变量。
 */
#include <iostream>

using namespace std;

int main() {
    long long a, b;
    if (!(cin >> a >> b)) return 0;
    long long target = a * a + b * b;            // 计算目标值 target = A² + B²

    int cnt = 0;
    // 枚举 x，条件 x < y 且 x² < target/2
    for (long long x = 1; x * x < target / 2; ++x) {
        long long rem = target - x * x;           // 剩余部分 y²
        long long y = 0;
        // 二分查找判断 rem 是否为完全平方数
        long long lo = 1, hi = rem;
        while (lo <= hi) {
            long long mid = (lo + hi) / 2;
            if (mid * mid == rem) { y = mid; break; }
            else if (mid * mid < rem) lo = mid + 1;
            else hi = mid - 1;
        }
        if (y > x) ++cnt;                         // 保证 x < y 才计数
    }
    cout << cnt << endl;
    return 0;
}