/*
 * 1048 数字加密
 *
 * 【实现原理】
 * 给定两个正整数 A 和 B，按位进行加密。从个位（第1位）开始处理：
 * - 奇数位（1, 3, 5, ...）：(A位 + B位) mod 13，结果 0~9 照常输出，
 *   10 输出 J，11 输出 Q，12 输出 K
 * - 偶数位（2, 4, 6, ...）：(B位 - A位)，若为负数则加 10
 * 若 A 或 B 的位数不足，高位补 0 后再处理。
 *
 * 【算法思路】
 * 1. 反转 A 和 B 的字符串，使个位对齐到索引 0 的位置
 * 2. 取较长字符串的长度作为处理位数
 * 3. 逐位处理：
 *    - 若该位超出字符串长度，视为 0
 *    - 按奇偶位分别应用加密规则
 * 4. 反转结果字符串后输出
 *
 * 【关键点】
 * - 反转字符串使个位对齐：反转后 i=0 对应个位，方便按位序判断奇偶
 * - 位数补 0：当 i 超过字符串长度时，ad 或 bd 取 0
 * - "JQK" 字符串技巧：s - 10 作为偏移量取字符 "JQK"[s-10]
 *
 * 【复杂度分析】
 * - 时间复杂度：O(max(lenA, lenB))，逐位处理
 * - 空间复杂度：O(max(lenA, lenB))，存储结果字符串
 */

#include <iostream>
#include <string>
#include <algorithm>

using namespace std;

int main() {
    string a, b;
    if (!(cin >> a >> b)) return 0;

    // 反转字符串，使个位对齐到索引 0
    reverse(a.begin(), a.end());
    reverse(b.begin(), b.end());

    int len = max(a.size(), b.size());  // 取较长位数
    string res;
    for (int i = 0; i < len; ++i) {
        // 若超出字符串长度，高位补 0
        int ad = (i < (int)a.size()) ? a[i] - '0' : 0;
        int bd = (i < (int)b.size()) ? b[i] - '0' : 0;

        if ((i + 1) % 2 == 1) {  // 奇数位（个位为第1位）
            int s = (ad + bd) % 13;
            if (s < 10) res += (char)('0' + s);       // 0~9 直接输出
            else res += "JQK"[s - 10];                 // 10->J, 11->Q, 12->K
        } else {  // 偶数位
            int d = bd - ad;
            if (d < 0) d += 10;                        // 负数加 10
            res += (char)('0' + d);
        }
    }

    reverse(res.begin(), res.end());  // 反转回正常顺序
    cout << res << endl;
    return 0;
}