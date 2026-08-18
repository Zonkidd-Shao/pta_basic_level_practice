/*
 * 1108 String复读机
 *
 * 【实现原理】
 * 题目给定 N 个字符串，要求将每个字符串重复输出两次（即"复读"），
 * 每个结果之间用空格分隔，最后输出换行。
 *
 * 【算法思路】
 * 1. 读入 N 及 N 个字符串。
 * 2. 对每个字符串，连续输出两次（s[i] + s[i]）。
 * 3. 除最后一个外，输出后加空格分隔。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N × L)，其中 L 为字符串平均长度。
 * - 空间复杂度：O(N × L)，用于存储所有字符串。
 */
#include <iostream>
#include <string>
#include <vector>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;
    vector<string> s(n);
    for (int i = 0; i < n; ++i) cin >> s[i];     // 读入 N 个字符串
    for (int i = 0; i < n; ++i) {
        cout << s[i] << s[i];                    // 复读：每个字符串输出两遍
        if (i + 1 < n) cout << ' ';              // 除最后一个外，输出空格分隔
    }
    cout << endl;
    return 0;
}