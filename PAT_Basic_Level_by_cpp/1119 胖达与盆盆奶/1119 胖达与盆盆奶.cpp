/*
 * 1119 胖达与盆盆奶
 *
 * 【实现原理】
 * 题目给定 N 只熊猫各自需要的奶量（毫升），以及总奶量 M 毫升。
 * 判断总奶量是否足够所有熊猫的需求：
 * - 若足够（M ≥ 总需求量），输出 "Yes" 以及剩余奶量（M - 总需求量）。
 * - 若不足，输出 "No" 以及缺少的奶量（总需求量 - M）。
 *
 * 【算法思路】
 * 1. 读入 N 只熊猫的奶量需求，同时累加总需求 sum。
 * 2. 读入总奶量 M。
 * 3. 比较 M 和 sum，输出相应结果和差值。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N)，一次遍历即可。
 * - 空间复杂度：O(N)，存储每只熊猫的需求（也可以边读边算不存储）。
 */
#include <iostream>
#include <vector>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;
    vector<int> need(n);
    long long sum = 0;
    for (int i = 0; i < n; ++i) { cin >> need[i]; sum += need[i]; } // 读入需求并累加
    long long m;
    cin >> m;                                      // 读入总奶量
    if (m >= sum) cout << "Yes " << (m - sum) << endl;  // 足够：输出剩余
    else cout << "No " << (sum - m) << endl;            // 不足：输出缺少量
    return 0;
}