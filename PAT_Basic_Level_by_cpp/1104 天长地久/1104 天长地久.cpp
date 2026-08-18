/*
 * 1104 天长地久
 *
 * 【实现原理】
 * 题目给定正整数 N，要求在所有的 N 位数中，找出第一个（最小的）各位数字之和等于 N 的数。
 * 若不存在这样的数，则输出 -1。
 *
 * 【算法思路】
 * 1. 计算最小的 N 位数 start = 10^(N-1) 和最大的 N 位数 end = 10^N - 1。
 * 2. 从 start 开始递增枚举每个数，调用 digitSum() 计算各位数字之和。
 * 3. 第一个满足各位数字之和等于 N 的数即为答案，直接输出并返回。
 * 4. 若遍历完所有 N 位数仍未找到，则输出 -1。
 *
 * 【复杂度分析】
 * - 时间复杂度：最坏情况下需要遍历 9×10^(N-1) 个数，但实际找到答案后即返回。
 * - 空间复杂度：O(1)，仅使用常数个变量。
 */
#include <iostream>

using namespace std;

/*
 * 计算整数 x 的各位数字之和
 */
int digitSum(long long x) {
    int s = 0;
    while (x) { s += x % 10; x /= 10; }
    return s;
}

int main() {
    int n;
    if (!(cin >> n)) return 0;

    long long start = 1;
    for (int i = 1; i < n; ++i) start *= 10;    // 最小的 N 位数：10^(N-1)
    long long end = start * 10 - 1;              // 最大的 N 位数

    for (long long x = start; x <= end; ++x) {
        if (digitSum(x) == n) {                  // 找到第一个满足条件的数
            cout << x << endl;
            return 0;
        }
    }
    cout << -1 << endl;                          // 不存在则输出 -1
    return 0;
}