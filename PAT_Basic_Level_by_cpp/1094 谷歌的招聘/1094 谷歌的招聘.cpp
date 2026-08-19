/*
 * 1094 谷歌的招聘
 *
 * 【实现原理】
 * 本题是 Google 招聘的趣味题。给定一个数字串 N（可能很长，需要用字符串存储），
 * 要求从前往后找出第一个长度为 L 的连续子串，使其对应的整数为素数。
 * 如果找到则输出该子串，否则输出 "404"。
 *
 * 【算法思路】
 * 1. 读取长度 L 和数字串 N。
 * 2. 暴力枚举所有长度为 L 的连续子串：
 *    a. 用 substr 截取子串，用 stoll 转为整数。
 *    b. 调用 isPrime 判断是否为素数。
 *    c. 若是素数，输出该子串并结束。
 * 3. 若所有子串都不是素数，输出 "404"。
 *
 * isPrime 函数：
 * - 小于 2 的数不是素数。
 * - 试除法，从 2 到 sqrt(x) 检查是否能整除。
 *
 * 【复杂度分析】
 * - 时间复杂度：O((N-L+1) × √(10^L))，N 为数字串长度，L 为子串长度。
 * - 空间复杂度：O(L)，用于存储子串。
 */
#include <iostream>
#include <string>

using namespace std;

// 判断一个数是否为素数
bool isPrime(long long x) {
    if (x < 2) return false;
    for (long long i = 2; i * i <= x; ++i)  // 试除法到 sqrt(x)
        if (x % i == 0) return false;
    return true;
}

int main() {
    int l;
    string n;
    if (!(cin >> l >> n)) return 0;  // 读取长度 L 和数字串 N

    // 枚举所有长度为 L 的连续子串
    for (int i = 0; i + l <= (int)n.size(); ++i) {
        string sub = n.substr(i, l);     // 截取长度为 L 的子串
        if (isPrime(stoll(sub))) {       // 若为素数则输出并结束
            cout << sub << endl;
            return 0;
        }
    }
    cout << "404" << endl;               // 未找到素数
    return 0;
}
