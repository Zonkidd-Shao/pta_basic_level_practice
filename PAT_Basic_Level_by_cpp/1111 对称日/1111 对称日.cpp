// 1111 对称日
//
// 实现原理：
// 给定 N 个按英文习惯格式（Month Day, Year）给出的日期，判断每个日期是否为"对称日"。
// 对称日是指按"年年年年月月日日"格式组成的 8 位数字串是完全对称（回文）的日期。
//
// 关键步骤：
// 1. 建立月份缩写（Jan~Dec）到月份数字（1~12）的映射。
// 2. 对每个日期，解析出月份缩写、日、年。
// 3. 将年、月、日格式化为 8 位数字串（年 4 位、月 2 位、日 2 位）。
// 4. 判断该数字串是否为回文：是则输出 "Y"，否则输出 "N"，随后输出该数字串。
//
// 复杂度分析：
// 时间复杂度：O(N)，每个日期只需常数次操作。
// 空间复杂度：O(1)，仅使用常数个变量。
#include <iostream>
#include <string>
#include <map>
#include <cstdio>

using namespace std;

int main() {
    map<string, int> mon = {
        {"Jan", 1}, {"Feb", 2}, {"Mar", 3}, {"Apr", 4}, {"May", 5}, {"Jun", 6},
        {"Jul", 7}, {"Aug", 8}, {"Sep", 9}, {"Oct", 10}, {"Nov", 11}, {"Dec", 12}
    };

    int n;
    if (!(cin >> n)) return 0;

    for (int i = 0; i < n; ++i) {
        string mstr;
        int day, year;
        char comma;
        cin >> mstr >> day >> comma >> year;   // 格式：Month Day, Year
        int month = mon[mstr];

        char buf[16];
        sprintf(buf, "%04d%02d%02d", year, month, day);  // 格式化为 8 位数字串
        string s = buf;
        string rev(s.rbegin(), s.rend());      // 反转判断回文
        cout << (s == rev ? "Y " : "N ") << s << endl;
    }
    return 0;
}
