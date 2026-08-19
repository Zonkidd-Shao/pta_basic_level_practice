// 1118 如需挪车请致电
//
// 实现原理：
// 给定 11 行计算式，每行至多含 1 个运算符，运算结果都是 1 位整数。
// 支持的运算：加（+）、减（-）、乘（*）、除（/）、取余（%）、开平方根（sqrt）、
// 指数（^）以及文字（0~9 的全小写汉语拼音，如 ling 表示 0）。
// 将 11 个结果依次拼接成电话号码输出。
//
// 关键步骤：
// 1. 建立汉语拼音（ling~jiu）到数字（0~9）的映射。
// 2. 对每行：若是拼音则直接取对应数字；若以 "sqrt" 开头则开平方；
//    否则定位运算符，解析左右操作数并计算。
// 3. 将每个结果转为一位数字字符，拼接成电话号码。
//
// 复杂度分析：
// 时间复杂度：O(11 * L)，L 为单行计算式长度。
// 空间复杂度：O(1)，仅使用常数个变量。
#include <iostream>
#include <string>
#include <map>
#include <cmath>

using namespace std;

int main() {
    map<string, int> py = {
        {"ling", 0}, {"yi", 1}, {"er", 2}, {"san", 3}, {"si", 4},
        {"wu", 5}, {"liu", 6}, {"qi", 7}, {"ba", 8}, {"jiu", 9}
    };

    string phone;
    for (int i = 0; i < 11; ++i) {
        string s;
        cin >> s;
        int res;
        if (py.count(s)) {                    // 文字（汉语拼音）
            res = py[s];
        } else if (s.substr(0, 4) == "sqrt") {  // 开平方根
            int v = stoi(s.substr(4));
            res = (int)sqrt(v);
        } else {                              // 二元运算
            size_t pos = string::npos;
            char op;
            for (char c : {'+', '-', '*', '/', '%', '^'}) {
                size_t p = s.find(c);
                if (p != string::npos) { pos = p; op = c; break; }
            }
            int a = stoi(s.substr(0, pos));
            int b = stoi(s.substr(pos + 1));
            switch (op) {
                case '+': res = a + b; break;
                case '-': res = a - b; break;
                case '*': res = a * b; break;
                case '/': res = a / b; break;
                case '%': res = a % b; break;
                case '^': res = (int)pow(a, b); break;
            }
        }
        phone += char('0' + res);             // 拼接一位数字
    }
    cout << phone << endl;
    return 0;
}
