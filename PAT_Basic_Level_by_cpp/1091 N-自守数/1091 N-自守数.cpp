/*
 * 1091 N-自守数
 *
 * 【实现原理】
 * 自守数（Automorphic number）是指一个数的平方的末尾几位等于该数本身。
 * 本题扩展为 N-自守数：给定 K（d 位），若存在一位数 b（0~9）使得
 * K × b 的末 d 位等于 K² 的末 d 位，则称 K 是 b-自守数，输出 "Yes b"；
 * 否则输出 "No"。
 *
 * 【算法思路】
 * 1. 读取 K，计算其位数 d。
 * 2. 计算模数 mod = 10^d，用于取末 d 位。
 * 3. 计算 K² mod mod（即 K² 的末 d 位）。
 * 4. 枚举 b = 0 到 9，检查 (K × b) mod mod 是否等于 K² mod mod。
 * 5. 若找到则输出 "Yes b"，否则输出 "No"。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(log K) 计算位数，O(10) 枚举 b，总体 O(log K)。
 * - 空间复杂度：O(1)。
 */
#include <iostream>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;

    while (n--) {
        long long k;
        cin >> k;
        int d = 0;               // 计算 K 的位数
        long long t = k;
        while (t) { ++d; t /= 10; }
        long long mod = 1;
        for (int i = 0; i < d; ++i) mod *= 10;  // mod = 10^d

        // 计算 K² 的末 d 位，使用 __int128 避免乘法溢出
        long long k2mod = (long long)((__int128)k * k % mod);
        bool found = false;
        for (int b = 0; b <= 9; ++b) {          // 枚举 b
            if (k2mod == (k * b) % mod) {       // 比较末 d 位
                cout << "Yes " << b << endl;
                found = true;
                break;
            }
        }
        if (!found) cout << "No" << endl;
    }
    return 0;
}
