// 1074 宇宙无敌加法器
//
// 实现原理：
// 实现一个自定义进制的大数加法器。给定一个进制字符串 base，从最低位（个位）到最高位
// 分别指定每位使用的进制（2~10）。两个非负整数 a 和 b 按此进制串逐位相加。
// 若进制串长度不够，则超出的高位按十进制处理。
//
// 算法步骤：
// 1. 反转 a 和 b 的字符串，使最低位对齐（便于从个位开始逐位相加）
// 2. 从低位到高位逐位相加：
//    - 取 a 的当前位（若无则 0）和 b 的当前位（若无则 0）
//    - 加上进位 carry
//    - 进制 = base[i] - '0'（若 i 超出 base 长度则按 10 进制）
//    - 当前位结果 = sum % radix，进位 = sum / radix
// 3. 处理完所有位后，若还有进位则追加
// 4. 反转结果，去除前导零后输出
//
// 复杂度分析：
// 时间复杂度：O(max(len(a), len(b)))，遍历两个数的每一位一次。
// 空间复杂度：O(max(len(a), len(b)))，用于存储结果。
#include <iostream>
#include <string>
#include <algorithm>

using namespace std;

int main() {
    string base, a, b;
    if (!(cin >> base >> a >> b)) return 0;
    // 反转，使最低位对齐（个位在索引 0 处）
    reverse(a.begin(), a.end());
    reverse(b.begin(), b.end());

    string res;
    int carry = 0;
    int n = max(a.size(), b.size());
    for (int i = 0; i < n || carry; ++i) {
        int x = (i < (int)a.size()) ? a[i] - '0' : 0;
        int y = (i < (int)b.size()) ? b[i] - '0' : 0;
        int sum = x + y + carry;
        // 当前位的进制，超出 base 长度的高位按 10 进制
        int radix = (i < (int)base.size()) ? base[i] - '0' : 10;
        res += (char)('0' + sum % radix);  // 当前位的结果
        carry = sum / radix;                // 进位
    }
    reverse(res.begin(), res.end());  // 反转回正常顺序

    // 去除前导零
    size_t p = res.find_first_not_of('0');
    if (p == string::npos) cout << 0 << endl;  // 结果全零
    else cout << res.substr(p) << endl;
    return 0;
}