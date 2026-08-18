/*
 * 1106 2019数列
 *
 * 【实现原理】
 * 题目给定正整数 N，要求将 N 表示为若干个（至少 2 个）连续正整数之和，
 * 输出所有可能的分解方案（每行一个，按加数个数从小到大排列）。
 * 若不存在这样的分解，则输出 "Nai!"。
 *
 * 【算法思路】
 * 利用等差数列求和公式：设起始数为 a，项数为 k（k ≥ 2），则：
 *   N = k×a + k×(k-1)/2  =>  a = (N - k×(k-1)/2) / k
 * 枚举项数 k，依次判断：
 * 1. 确保 k×(k+1)/2 ≤ N（k 项的最小和，即从 1 开始的和）。
 * 2. 计算 numerator = N - k×(k-1)/2，若 numerator 能被 k 整除且 a > 0，则找到有效方案。
 * 3. 输出 a, a+1, ..., a+k-1 这 k 个连续正整数。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(√(2N))，枚举项数 k 到约 √(2N) 次。
 * - 空间复杂度：O(1)，仅使用常数个变量。
 */
#include <iostream>
#include <vector>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;
    bool any = false;
    // 枚举项数 k（k >= 2），k*(k+1)/2 是 k 项的最小和
    for (int k = 2; k * (k + 1LL) / 2 <= n; ++k) {
        int numerator = n - k * (k - 1) / 2;     // 计算 k*a 的值
        if (numerator <= 0) break;
        if (numerator % k == 0) {                // 能被 k 整除说明找到整数起始项 a
            int a = numerator / k;
            if (a > 0) {
                any = true;
                for (int i = 0; i < k; ++i) {    // 输出 a 到 a+k-1 的连续整数
                    if (i) cout << '+';
                    cout << a + i;
                }
                cout << endl;
            }
        }
    }
    if (!any) cout << "Nai!" << endl;            // 不存在任何方案
    return 0;
}