/*
 * 1076 Wifi密码
 *
 * 【实现原理】
 * 本题要求根据每道选择题的选项，找出正确选项（带 '*' 的选项），
 * 将正确选项的字母映射为数字（a→1, b→2, c→3, d→4），
 * 拼接成 Wi-Fi 密码输出。
 *
 * 【算法思路】
 * 1. 读取题目数量 n。
 * 2. 对每道题，读取 4 个选项字符串（格式如 "a-*" 或 "b-*" 等）。
 * 3. 在字符串中查找 '*' 字符，若存在则说明该选项为正确选项，
 *    取选项首字母 letter，通过 letter - 'a' + 1 得到对应数字字符。
 * 4. 将所有数字字符拼接成密码字符串，最后输出。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(n)，每个选项只需常数时间处理。
 * - 空间复杂度：O(n)，用于存储密码字符串。
 */
#include <iostream>
#include <string>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;          // 读取题目数量
    string pwd;                          // 存储最终密码
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < 4; ++j) {   // 每题固定 4 个选项
            string opt;
            cin >> opt;
            if (opt.find('*') != string::npos) {     // 找到正确选项（含 '*'）
                char letter = opt[0];                 // 选项首字母 a/b/c/d
                pwd += (char)('1' + (letter - 'a')); // 字母映射为数字：a→1, b→2, c→3, d→4
            }
        }
    }
    cout << pwd << endl;
    return 0;
}
