// 1024 科学计数法
// 将形如 [+-][1-9].[0-9]+E[+-][0-9]+ 的科学计数法实数转为普通数字表示，保留所有有效位。
//
// 【实现原理】
// 算法思路：
//   1. 解析输入字符串，提取各个部分：
//      - 符号位（正负号，决定输出是否加 '-'）
//      - 有效数字部分（digits，包含整数部分和小数部分的所有数字，去掉小数点）
//      - 指数部分（exp，带符号的整数，表示小数点移动的位数）
//   2. 计算小数点在新数字串中的位置：dot = 1 + exp（因为原整数部分有 1 位）。
//   3. 根据 dot 的位置分情况输出：
//      - 若 dot <= 0：指数为负且绝对值较大，需要在前面补 0，输出形如 "0.000...digits"
//      - 若 dot > 0：在 digits 字符串的第 dot 位插入小数点，若位数不足则在末尾补 0
// 关键点：
//   - 原整数部分固定为 1 位非零数字，因此小数点原始位置在下标 1 处。
//   - 指数为正时，小数点右移；指数为负时，小数点左移。
//   - 不需要考虑浮点数精度问题，因为所有数字都是精确的。
// 时间复杂度：O(|digits| + |exp|)，线性扫描字符串。
// 空间复杂度：O(|digits|)，存储有效数字部分。
#include <iostream>
#include <string>

using namespace std;

int main() {
    string s;
    if (!(cin >> s)) return 0;

    int p = 0;
    bool neg = (s[p] == '-');
    if (s[p] == '+' || s[p] == '-') ++p;

    string digits;
    digits += s[p++];           // 整数部分（1 位）
    if (s[p] == '.') ++p;       // 跳过小数点
    while (p < (int)s.size() && s[p] != 'E') digits += s[p++];
    ++p;                        // 跳过 'E'

    bool expNeg = (s[p] == '-');
    if (s[p] == '+' || s[p] == '-') ++p;
    int exp = 0;
    while (p < (int)s.size()) { exp = exp * 10 + (s[p] - '0'); ++p; }
    if (expNeg) exp = -exp;

    if (neg) cout << '-';

    int L = (int)digits.size();
    int dot = 1 + exp; // 小数点在新数字串中的位置（0 表示在最前面）

    if (dot <= 0) {
        // 指数负且较大：0.00...digits
        cout << "0.";
        for (int i = 0; i < -dot; ++i) cout << '0';
        cout << digits;
    } else {
        for (int i = 0; i < L; ++i) {
            if (i == dot) cout << '.';
            cout << digits[i];
        }
        for (int i = L; i < dot; ++i) cout << '0'; // 末尾补零
    }
    cout << endl;
    return 0;
}