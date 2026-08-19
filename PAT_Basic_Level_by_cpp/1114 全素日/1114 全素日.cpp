// 1114 全素日
//
// 实现原理：
// 给定一个按 yyyymmdd 格式给出的日期，判断它是否为"全素日"。
// 全素日是指：不仅日期本身是素数，而且它的任何以末尾数字结尾的子串都是素数。
// 即从完整 8 位数字串开始，按子串长度递减（8,7,...,1），每个子串都是原串的后缀。
//
// 关键步骤：
// 1. 对每个后缀子串（长度从 8 递减到 1），将其转换为整数。
// 2. 用试除法判断该整数是否为素数。
// 3. 每行输出子串和 Yes/No；若所有子串都是素数，最后输出 "All Prime!"。
//
// 复杂度分析：
// 时间复杂度：O(8 * sqrt(10^8))，子串最多 8 个，每个素数判断到 sqrt。
// 空间复杂度：O(1)，仅使用常数个变量。
#include <iostream>
#include <string>
#include <cmath>

using namespace std;

// 判断整数 x 是否为素数
bool isPrime(int x) {
    if (x < 2) return false;
    for (int i = 2; i * i <= x; ++i)
        if (x % i == 0) return false;
    return true;
}

int main() {
    string s;
    if (!(cin >> s)) return 0;

    bool all = true;
    for (size_t len = s.size(); len >= 1; --len) {
        string sub = s.substr(s.size() - len, len);  // 以末尾数字结尾的后缀子串
        int num = stoi(sub);                          // 转换为整数（忽略前导零）
        bool p = isPrime(num);
        if (!p) all = false;
        cout << sub << ' ' << (p ? "Yes" : "No") << endl;
    }
    if (all) cout << "All Prime!" << endl;
    return 0;
}
