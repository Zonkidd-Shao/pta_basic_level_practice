/*
 * 1081 检查密码
 *
 * 【实现原理】
 * 本题要求检查密码是否符合规则。密码规则：
 * 1. 长度必须 ≥ 6。
 * 2. 只能包含字母和数字（不能有非法字符如小数点、空格等）。
 * 3. 必须同时包含至少一个字母和至少一个数字。
 *
 * 根据检查结果输出对应的提示信息：
 * - 非法字符 → "Invalid"
 * - 长度过短 → "Your password is tai duan le."
 * - 缺少数字 → "Your password needs shu zi."
 * - 缺少字母 → "Your password needs zi mu."
 * - 全部合格 → "Your password is wan mei."
 *
 * 【算法思路】
 * 1. 读取密码条数 n，用 getline 逐行读取密码（密码可能包含空格）。
 * 2. 对每个密码字符串，遍历每个字符：
 *    a. 用 isalnum 判断是否为字母或数字。
 *    b. 如果是字母或数字，进一步判断是数字还是字母。
 *    c. 如果不是字母数字，标记为非法字符。
 * 3. 按优先级输出判断结果：
 *    非法字符优先 > 长度不足 > 缺数字 > 缺字母 > 完美。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(n·L)，n 为密码条数，L 为平均长度。
 * - 空间复杂度：O(1)，仅使用常数额外空间。
 */
#include <iostream>
#include <string>
#include <cctype>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;
    string dummy;
    getline(cin, dummy); // 消耗 n 后的换行符

    for (int i = 0; i < n; ++i) {
        string pwd;
        getline(cin, pwd);             // 读取密码（可能包含空格）
        bool illegal = false, hasDigit = false, hasAlpha = false;
        for (char c : pwd) {
            if (isalnum((unsigned char)c)) {  // 合法字符：字母或数字
                if (isdigit((unsigned char)c)) hasDigit = true; // 包含数字
                else hasAlpha = true;          // 包含字母
            } else {
                illegal = true;                // 非法字符（如小数点、空格等）
            }
        }
        // 按优先级输出判断结果
        if (illegal) cout << "Invalid" << endl;
        else if (pwd.size() < 6) cout << "Your password is tai duan le." << endl;
        else if (!hasDigit) cout << "Your password needs shu zi." << endl;
        else if (!hasAlpha) cout << "Your password needs zi mu." << endl;
        else cout << "Your password is wan mei." << endl;
    }
    return 0;
}
