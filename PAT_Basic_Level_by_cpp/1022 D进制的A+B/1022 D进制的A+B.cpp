// 1022 D进制的A+B
// 输入非负整数 A、B（<= 2^30-1）与进制 D（1 < D <= 10），输出 (A+B) 的 D 进制表示。
//
// 【实现原理】
// 算法思路：
//   1. 计算 A + B 的和（用 long long 避免溢出）。
//   2. 若和为 0，直接输出 "0"。
//   3. 使用除基取余法（短除法）将和转换为 D 进制：
//      - 反复除以 D，取余数，将余数转换为字符存入结果字符串。
//      - 最后将结果字符串反转，得到正确的 D 进制表示。
// 关键点：
//   - 注意和为 0 的特判，否则短除法循环不会执行，输出为空。
//   - A、B <= 2^30-1，和 <= 2^31-2，在 long long 范围内。
// 时间复杂度：O(log_D(A+B))，即进制转换的位数。
// 空间复杂度：O(log_D(A+B))。
#include <iostream>
#include <algorithm>

using namespace std;

int main() {
    long long a, b;
    int d;
    if (!(cin >> a >> b >> d)) return 0;

    long long sum = a + b;
    if (sum == 0) { // 特判 0
        cout << 0 << endl;
        return 0;
    }

    string res;
    while (sum > 0) {
        res += static_cast<char>(sum % d + '0');
        sum /= d;
    }
    reverse(res.begin(), res.end());
    cout << res << endl;
    return 0;
}