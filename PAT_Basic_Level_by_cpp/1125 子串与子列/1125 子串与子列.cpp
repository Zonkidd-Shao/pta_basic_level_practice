/*
 * 1125 子串与子列
 *
 * 【实现原理】
 * 题目给定两个字符串 S 和 T，判断 T 与 S 的关系：
 * - 若 T 是 S 的连续子串（substring），输出 "Substring"。
 * - 否则若 T 是 S 的子序列（subsequence，即不要求连续但保持相对顺序），输出 "Subsequence"。
 * - 否则输出 "None"。
 *
 * 【算法思路】
 * 1. 使用 string::find() 检查 T 是否为 S 的子串（连续匹配）。
 * 2. 若不是子串，使用双指针法检查 T 是否为 S 的子序列：
 *    - 遍历 S，若当前字符与 T 的当前指针 j 指向的字符匹配，则 j 前进。
 *    - 若最终 j 走完 T 的所有字符，说明 T 是 S 的子序列。
 * 3. 根据判断结果输出对应的字符串。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(|S| + |T|)，find 和子序列检查均为线性时间。
 * - 空间复杂度：O(1)，仅使用常数个变量。
 */
#include <iostream>
#include <string>

using namespace std;

/*
 * 判断字符串 t 是否为字符串 s 的子序列
 * 遍历 s，按顺序匹配 t 中的字符
 */
bool isSubsequence(const string& s, const string& t) {
    size_t j = 0;
    for (size_t i = 0; i < s.size() && j < t.size(); ++i)
        if (s[i] == t[j]) ++j;                  // 匹配到 t 中的当前字符
    return j == t.size();                        // t 中所有字符都匹配到了
}

int main() {
    string s, t;
    if (!(cin >> s >> t)) return 0;
    if (s.find(t) != string::npos) cout << "Substring" << endl;      // T 是 S 的子串
    else if (isSubsequence(s, t)) cout << "Subsequence" << endl;     // T 是 S 的子序列
    else cout << "None" << endl;                                      // 两者都不是
    return 0;
}