/*
 * 1042 字符统计
 *
 * 【实现原理】
 * 给定一行英文，统计其中出现次数最多的字母（不区分大小写）。
 * 输出该字母的小写形式及其出现次数。若有并列，输出字母序最小的。
 *
 * 【算法思路】
 * 1. 使用计数数组 cnt[26] 统计每个字母出现的次数
 * 2. 遍历字符串中每个字符，若是字母则统一转为小写后计数
 * 3. 遍历 cnt 数组，找出出现次数最多且字母序最小的字母
 * 4. 输出该字母及其出现次数
 *
 * 【关键点】
 * - 大小写不敏感：使用 tolower() 统一转为小写再统计
 * - 并列处理：由于遍历顺序是从 'a' 到 'z'，用 > 而非 >= 可保证取到字母序最小的
 * - 只统计英文字母，忽略数字、空格、标点等
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N)，N 为字符串长度
 * - 空间复杂度：O(1)，固定 26 大小的计数数组
 */

#include <iostream>
#include <string>
#include <cctype>

using namespace std;

int main() {
    string s;
    if (!getline(cin, s)) return 0;  // 一行文本，可能含空格，用 getline

    int cnt[26] = {0};  // 统计 26 个小写字母的出现次数
    for (char c : s) {
        if (isalpha((unsigned char)c)) {
            // 字母统一转为小写后统计
            ++cnt[tolower((unsigned char)c) - 'a'];
        }
    }

    int maxc = 0;         // 最大出现次数
    char maxch = 'a';     // 对应字母
    for (int i = 0; i < 26; ++i) {
        // 使用 > 而非 >=，保证并列时取字母序最小的（先遍历到的）
        if (cnt[i] > maxc) { maxc = cnt[i]; maxch = (char)('a' + i); }
    }
    cout << maxch << ' ' << maxc << endl;
    return 0;
}