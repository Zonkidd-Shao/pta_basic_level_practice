/*
 * 1109 擅长C
 *
 * 【实现原理】
 * 题目给定 N 个字符串，要求统计每个字符串出现的次数，输出出现次数最多的字符串。
 * 若出现次数并列，则取字典序最小的字符串。
 *
 * 【算法思路】
 * 1. 使用 map<string, int> 统计每个字符串的出现次数。
 * 2. 每次读入字符串时，更新其计数。
 * 3. 记录当前出现次数最多的字符串（次数相同则取字典序较小的）。
 * 4. 输出最终结果。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N × L × log(N))，其中 L 为字符串平均长度，map 操作 O(log N)。
 * - 空间复杂度：O(N × L)，存储所有不同字符串及其计数。
 */
#include <iostream>
#include <string>
#include <map>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;
    map<string, int> cnt;                        // 哈希表，统计每个字符串出现次数
    string best = "";
    int maxc = 0;
    for (int i = 0; i < n; ++i) {
        string s;
        cin >> s;
        int c = ++cnt[s];                        // 更新计数
        // 比较：次数更多，或次数相同但字典序更小
        if (c > maxc || (c == maxc && s < best)) { maxc = c; best = s; }
    }
    cout << best << endl;
    return 0;
}