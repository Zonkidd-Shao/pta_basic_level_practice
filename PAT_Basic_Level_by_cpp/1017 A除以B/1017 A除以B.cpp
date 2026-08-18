// 1017 A除以B
// A 为不超过 1000 位的正整数，B 为 1 位正整数，输出商 Q 和余数 R（A = B*Q + R）。
// 采用模拟竖式除法，从高位到低位逐位计算。
//
// 【实现原理】
// 算法思路：
//   模拟竖式除法（大数除法）：
//   1. 从被除数 A 的最高位开始，逐位处理。
//   2. 维护当前余数 r，初始为 0。
//   3. 对每一位数字 c，计算 cur = r * 10 + (c - '0')。
//   4. 商的一位为 cur / B，余数更新为 cur % B。
//   5. 将商的一位拼接到结果字符串 q 中。
//   6. 处理完所有位后，去掉商的前导 0（至少保留一位）。
// 关键点：
//   - A 最多 1000 位，远超内置整数类型范围，必须用字符串模拟。
//   - B 是 1 位数，因此竖式除法每次的商也是 1 位数。
// 时间复杂度：O(len(A))，线性扫描所有位。
// 空间复杂度：O(len(A))，存储结果字符串。
#include <iostream>
#include <string>

using namespace std;

int main() {
    string a;
    int b;
    if (!(cin >> a >> b)) return 0;

    string q;
    int r = 0;
    for (char c : a) {
        int cur = r * 10 + (c - '0');
        q += static_cast<char>(cur / b + '0');
        r = cur % b;
    }

    // 去掉商的前导 0（至少保留一位）
    size_t start = q.find_first_not_of('0');
    if (start == string::npos) q = "0";
    else q = q.substr(start);

    cout << q << ' ' << r << endl;
    return 0;
}