// 1019 数字黑洞
// 对任意 4 位正整数，将各位数字按非递增与非递减排序后相减，重复直到得到 6174（Kaprekar 常数）。
// 若 4 位数字全相等，输出 N - N = 0000。
//
// 【实现原理】
// 算法思路：
//   1. 将输入数字格式化为 4 位字符串（不足补前导 0）。
//   2. 对该字符串分别按非递增（降序）和非递减（升序）排序，得到两个 4 位数。
//   3. 大数减小数，输出减法算式。
//   4. 若结果为 6174，则终止；否则用结果重复上述过程。
// 特殊处理：
//   - 若 4 位数字全相等（如 1111），则 n % 1111 == 0，直接输出 N - N = 0000。
// 关键点：
//   - 注意补前导 0：如 1000 排序后降序为 1000，升序为 0001 = 1，相减得 999。
//     stoi("0001") = 1，但输出时需按 4 位格式。因此每次使用 %04d 格式化。
// 时间复杂度：O(1)，最多迭代有限次（Kaprekar 常数的收敛速度很快，最多 7 步）。
// 空间复杂度：O(1)。
#include <iostream>
#include <algorithm>
#include <string>
#include <cstdio>

using namespace std;

// 将整数格式化为 4 位（前补 0）
string to4(int x) {
    char buf[8];
    sprintf(buf, "%04d", x);
    return buf;
}

int main() {
    int n;
    if (!(cin >> n)) return 0;

    // 四位数字全相等
    if (n % 1111 == 0) {
        printf("%04d - %04d = 0000\n", n, n);
        return 0;
    }

    while (true) {
        string s = to4(n);
        string inc = s, dec = s;
        sort(inc.begin(), inc.end());                 // 非递减
        sort(dec.begin(), dec.end(), greater<char>()); // 非递增
        int big = stoi(dec), small = stoi(inc);
        int diff = big - small;
        printf("%04d - %04d = %04d\n", big, small, diff);
        if (diff == 6174) break;
        n = diff;
    }
    return 0;
}