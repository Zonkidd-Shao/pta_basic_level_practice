/*
 * 1111 对称日
 *
 * 【实现原理】
 * 题目给定一个日期字符串（格式如 yyyy/mm/dd），提取其中的所有数字字符组成一个
 * 连续的 8 位数字串，判断该数字串是否为回文串。若是则输出 "YES"，否则输出 "NO"。
 *
 * 【算法思路】
 * 1. 将日期字符串中的所有数字字符提取出来，拼成 digits 字符串。
 * 2. 将 digits 反转得到 rev。
 * 3. 比较 digits 和 rev 是否相等，相等则为回文（对称日）。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(L)，其中 L 为日期字符串长度（固定为 10）。
 * - 空间复杂度：O(L)，存储提取的数字串。
 */
#include <iostream>
#include <string>

using namespace std;

int main() {
    string date;
    if (!(cin >> date)) return 0;
    string digits;
    for (char c : date) if (isdigit((unsigned char)c)) digits += c; // 提取所有数字字符
    string rev = digits;
    reverse(rev.begin(), rev.end());             // 反转字符串
    cout << (digits == rev ? "YES" : "NO") << endl; // 判断是否为回文
    return 0;
}