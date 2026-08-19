// 1121 祖传好运
//
// 实现原理：
// 0~9 都是好运数。一个大于 9 的数字 N 具有祖传好运，如果它是由某个好运数添加一个
// 个位数字得到的，并且它能被自己的位数整除。等价地：对 N 的每个前缀（长度 1 到 d），
// 该前缀对应的数值都能被其位数整除。
//
// 关键步骤：
// 1. 对每个待评测数字，从最高位开始逐位构造前缀数值。
// 2. 对每个前缀，检查其数值是否能被当前位数整除。
// 3. 若所有前缀都满足，则输出 "Yes"，否则输出 "No"。
//
// 复杂度分析：
// 时间复杂度：O(K * L)，K 为数字个数，L 为单个数字的位数（最多 10 位）。
// 空间复杂度：O(1)，仅使用常数个变量。
#include <iostream>
#include <string>

using namespace std;

int main() {
    int k;
    if (!(cin >> k)) return 0;

    while (k--) {
        string s;
        cin >> s;
        bool ok = true;
        long long val = 0;
        for (size_t i = 0; i < s.size(); ++i) {
            val = val * 10 + (s[i] - '0');   // 构造前缀数值
            int len = (int)i + 1;            // 当前位数
            if (val % len != 0) { ok = false; break; }  // 前缀必须能被位数整除
        }
        cout << (ok ? "Yes" : "No") << endl;
    }
    return 0;
}
