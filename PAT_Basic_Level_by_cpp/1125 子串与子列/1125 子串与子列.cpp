// 1125 子串与子列
//
// 实现原理：
// 子串是字符串中连续的一部分，子列是保持字符顺序的子集（可连续可不连续）。
// 给定字符串 S 和子列 P，找到 S 中包含 P 的最短子串；若解不唯一，输出起点最靠左的解。
//
// 关键步骤：
// 1. 枚举每个可能的起点 i（要求 S[i] == P[0]）。
// 2. 从 i 开始贪心匹配 P：按顺序在 S 中寻找 P 的每个字符，得到最早结束位置 j。
// 3. 窗口 [i, j-1] 即为以 i 为起点包含 P 的最短子串。
// 4. 记录长度最短的窗口；长度相同时保留起点最靠左的（严格小于才更新）。
//
// 复杂度分析：
// 时间复杂度：O(|S| * |P|)，最坏情况。
// 空间复杂度：O(1)，仅使用常数个变量。
#include <iostream>
#include <string>

using namespace std;

int main() {
    string s, p;
    if (!(cin >> s >> p)) return 0;

    int n = (int)s.size(), m = (int)p.size();
    int bestLen = n + 1, bestStart = 0;
    for (int i = 0; i < n; ++i) {
        if (s[i] != p[0]) continue;   // 起点必须匹配 P 的第一个字符
        int j = i, k = 0;
        while (j < n && k < m) {      // 贪心匹配 P
            if (s[j] == p[k]) ++k;
            ++j;
        }
        if (k == m) {                 // 匹配成功，窗口为 [i, j-1]
            int len = j - i;
            if (len < bestLen) { bestLen = len; bestStart = i; }  // 严格小于，保留最左解
        }
    }
    cout << s.substr(bestStart, bestLen) << endl;
    return 0;
}
