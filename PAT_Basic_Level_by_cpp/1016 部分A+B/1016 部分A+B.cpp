// 1016 部分A+B
// A 的"Da 部分"是由 A 中所有数字 Da 组成的新整数 Pa；同理 Pb。输出 Pa + Pb。
// A、B < 10^9，逐字符构造即可，结果用 long long 存放。
//
// 【实现原理】
// 算法思路：
//   将 A 和 B 以字符串形式读入，分别提取出指定的数字 Da 和 Db。
//   遍历字符串，每当遇到与指定数字相同的字符时，将该数字拼接到结果整数末尾。
//   拼接方式：p = p * 10 + digit，逐步构造出部分数 Pa 和 Pb。
// 关键点：
//   - 使用字符串处理可以方便地提取每位数字。
//   - 结果可能超过 int 范围（如 999999999 中取 9，Pa = 999999999），需用 long long。
// 时间复杂度：O(len(A) + len(B))。
// 空间复杂度：O(1)。
#include <iostream>
#include <string>

using namespace std;

// 计算字符串 a 中字符 da 组成的部分数
long long part(const string& a, char da) {
    long long p = 0;
    for (char c : a) {
        if (c == da) p = p * 10 + (da - '0');
    }
    return p;
}

int main() {
    string a, b;
    char da, db;
    if (!(cin >> a >> da >> b >> db)) return 0;
    cout << part(a, da) + part(b, db) << endl;
    return 0;
}