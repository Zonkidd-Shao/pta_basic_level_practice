/*
 * 1121 祖传好运
 *
 * 【实现原理】
 * 题目给定 N 个幸运数字，每个数字的"运气"定义为它的各位数字之和。
 * 找出运气最大的数字并输出。若存在多个数字拥有相同的最大运气值，
 * 则输出最先出现的那一个。
 *
 * 【算法思路】
 * 1. 实现 digitSum() 函数计算整数的各位数字之和。
 * 2. 顺序读入每个数字，计算其各位和（运气），
 *    若当前运气大于已记录的最大运气，则更新最佳数字和最大运气。
 * 3. 使用严格大于（>）比较，保证运气相同时保留最先出现的。
 * 4. 输出最佳数字。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N × log₁₀(maxValue))，每个数需计算各位数字之和。
 * - 空间复杂度：O(1)，仅使用常数个变量。
 */
#include <iostream>
#include <vector>

using namespace std;

/*
 * 计算整数 x 的各位数字之和
 */
int digitSum(int x) {
    int s = 0;
    while (x) { s += x % 10; x /= 10; }
    return s;
}

int main() {
    int n;
    if (!(cin >> n)) return 0;
    int best = 0, bestLuck = -1;
    for (int i = 0; i < n; ++i) {
        int x; cin >> x;
        int luck = digitSum(x);                  // 计算各位数字之和（运气）
        if (luck > bestLuck) { bestLuck = luck; best = x; } // 更新最大运气和对应数字
    }
    cout << best << endl;
    return 0;
}