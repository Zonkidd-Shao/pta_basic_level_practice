// 1011 A+B 和 C
// 给定 T 组 A、B、C（范围 [-2^31, 2^31]），判断 A+B 是否大于 C。
// 注意 A+B 可能溢出 int，使用 long long 避免溢出。
//
// 【实现原理】
// 算法思路：
//   对于每组数据，直接使用 long long 类型计算 A + B 并与 C 比较。
//   由于 A、B、C 的范围均在 int 范围内，但 A+B 可能超过 int 范围（如 2^31-1 + 2^31-1 = 2^32-2），
//   因此使用 64 位 long long 避免溢出。
// 关键点：
//   - long long 是 64 位有符号整数，范围为 [-2^63, 2^63-1]，足以容纳 A+B 的最大值。
// 时间复杂度：O(T)，每组数据常数时间。
// 空间复杂度：O(1)。
#include <iostream>

using namespace std;

int main() {
    int t;
    if (!(cin >> t)) return 0;

    for (int i = 1; i <= t; ++i) {
        long long a, b, c;
        cin >> a >> b >> c;
        cout << "Case #" << i << ": "
             << ((a + b > c) ? "true" : "false") << endl;
    }
    return 0;
}