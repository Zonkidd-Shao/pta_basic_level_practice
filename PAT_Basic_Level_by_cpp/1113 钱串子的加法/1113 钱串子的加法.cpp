// 1113 钱串子的加法
//
// 实现原理：
// 钱串子世界使用 30 进制数字：数字 0~9 与人类一致，数字 10~29 用小写字母 a~t 表示。
// 给定两个不超过 10^5 位的 30 进制非负整数，求它们的和并输出（结果不得有前导零）。
//
// 关键步骤：
// 1. 实现字符与数值的互转：'0'~'9' 对应 0~9，'a'~'t' 对应 10~29。
// 2. 从低位到高位逐位相加，处理进位（逢 30 进 1）。
// 3. 将结果反转得到正确顺序，并去掉前导零。
//
// 复杂度分析：
// 时间复杂度：O(L)，L 为两个数字中较长的位数。
// 空间复杂度：O(L)，存储结果。
#include <iostream>
#include <string>
#include <algorithm>

using namespace std;

// 字符转数值：'0'~'9' -> 0~9，'a'~'t' -> 10~29
int val(char c) {
    if (c >= '0' && c <= '9') return c - '0';
    return c - 'a' + 10;
}

// 数值转字符：0~9 -> '0'~'9'，10~29 -> 'a'~'t'
char chr(int v) {
    if (v < 10) return '0' + v;
    return 'a' + v - 10;
}

int main() {
    string a, b;
    if (!(cin >> a >> b)) return 0;

    string res;
    int i = (int)a.size() - 1, j = (int)b.size() - 1, carry = 0;
    while (i >= 0 || j >= 0 || carry) {
        int s = carry;
        if (i >= 0) s += val(a[i--]);
        if (j >= 0) s += val(b[j--]);
        res += chr(s % 30);   // 当前位
        carry = s / 30;       // 进位
    }
    reverse(res.begin(), res.end());  // 反转得到正确顺序

    // 去掉前导零
    size_t pos = res.find_first_not_of('0');
    if (pos == string::npos) cout << "0" << endl;
    else cout << res.substr(pos) << endl;
    return 0;
}
