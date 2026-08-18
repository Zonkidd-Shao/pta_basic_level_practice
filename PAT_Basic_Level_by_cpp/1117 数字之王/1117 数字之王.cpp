/*
 * 1117 数字之王
 *
 * 【实现原理】
 * 题目给定 N 个整数，对每个数反复将其各位数字相加直到得到一位数（即求"数根"，
 * 也称为数字根 digital root）。统计每个数根（0~9）出现的频率，出现次数最多的数根
 * 即为"数字之王"。若出现次数并列，取最小的数根。
 *
 * 【算法思路】
 * 1. 实现 digitalRoot() 函数：对整数反复求各位数字之和，直到结果小于 10。
 * 2. 使用 map<int, int> 统计每个数根的出现次数。
 * 3. 遍历 0~9，找到出现次数最多的数根（次数相同时取编号小的）。
 * 4. 输出该数根。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N × log₁₀(maxValue))，每个数需要求数根，每次迭代位数减少。
 * - 空间复杂度：O(N)，存储计数映射。
 */
#include <iostream>
#include <vector>
#include <map>

using namespace std;

/*
 * 计算整数 x 的数根（反复各位相加直到一位数）
 */
int digitalRoot(int x) {
    while (x >= 10) {
        int s = 0;
        while (x) { s += x % 10; x /= 10; }
        x = s;
    }
    return x;
}

int main() {
    int n;
    if (!(cin >> n)) return 0;
    map<int, int> cnt;                           // 数根 -> 出现次数
    for (int i = 0; i < n; ++i) {
        int x; cin >> x;
        ++cnt[digitalRoot(x)];                   // 统计该数根的出现次数
    }
    int king = 0, maxc = 0;
    for (int d = 0; d <= 9; ++d) {               // 遍历所有可能的数根
        if (cnt[d] > maxc) { maxc = cnt[d]; king = d; } // 找出现次数最多的数根
    }
    cout << king << endl;
    return 0;
}