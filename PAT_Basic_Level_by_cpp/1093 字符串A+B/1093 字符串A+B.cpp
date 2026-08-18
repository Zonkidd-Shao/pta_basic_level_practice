/*
 * 1093 字符串A+B
 *
 * 【实现原理】
 * 给定两个字符串 A 和 B，要求将 A 和 B 拼接后，去除重复字符，
 * 每个字符只保留首次出现的位置（按出现顺序），输出结果。
 * 注意：字符串可能包含空格，需要使用 getline 读取。
 *
 * 【算法思路】
 * 1. 用 getline 分别读取 A 和 B（可能包含空格）。
 * 2. 拼接 A + B 得到 res。
 * 3. 用布尔数组 seen[256] 标记字符是否已出现过（ASCII 码范围）。
 * 4. 遍历 res 中的每个字符，若未出现过则输出并标记为已出现。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(|A| + |B|)，只需一次遍历。
 * - 空间复杂度：O(1)，seen 数组为固定大小 256。
 */
#include <iostream>
#include <string>

using namespace std;

int main() {
    string a, b;
    if (!getline(cin, a)) return 0;  // 读取第一行字符串 A（可能含空格）
    getline(cin, b);                 // 读取第二行字符串 B

    string res = a + b;              // 拼接 A 和 B
    bool seen[256] = {false};        // 标记字符是否已出现，ASCII 共 256 个
    for (char c : res) {
        if (!seen[(unsigned char)c]) {  // 若该字符未出现过
            cout << c;                  // 输出字符
            seen[(unsigned char)c] = true;  // 标记为已出现
        }
    }
    cout << endl;
    return 0;
}
