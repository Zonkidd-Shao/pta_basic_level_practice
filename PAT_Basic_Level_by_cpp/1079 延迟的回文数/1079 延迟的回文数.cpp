/*
 * 1079 延迟的回文数
 *
 * 【实现原理】
 * 本题涉及"回文数"和"大整数加法"操作。给定一个正整数（可能很大，超过普通整数范围），
 * 若其本身是回文数则直接输出；否则反复执行 N = N + reverse(N) 操作，
 * 最多迭代 10 次。若某次结果变为回文数则输出过程并结束；否则报告未找到。
 *
 * 【算法思路】
 * 1. 判断输入字符串 n 是否为回文（isPal 函数），若是则直接输出。
 * 2. 否则循环最多 10 次：
 *    a. 将 n 反转得到 r。
 *    b. 调用大整数加法 add(n, r) 计算和。
 *    c. 输出计算过程 "N + reverse(N) = sum"。
 *    d. 判断 sum 是否为回文，若是则输出结果并结束。
 *    e. 否则将 sum 赋给 n，继续下一轮迭代。
 * 3. 若 10 次后仍未找到回文，输出 "Not found in 10 iterations."。
 *
 * add 函数实现大整数加法：
 * - 从末位向首位逐位相加，处理进位。
 * - 最后若仍有进位则在最高位补 1。
 * - 将结果反转后返回（因为是从低位到高位构建的）。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(k·L)，其中 k 为迭代次数（≤10），L 为数字字符串长度。
 * - 空间复杂度：O(L)，用于存储大整数结果。
 */
#include <iostream>
#include <string>
#include <algorithm>

using namespace std;

/*
 * 大整数加法：将两个等长的数字字符串相加（a 和 b 长度相同）
 * 从最低位（末尾）向最高位逐位相加，处理进位
 */
string add(const string& a, const string& b) {
    string res;
    int carry = 0;                             // 进位标志
    for (int i = (int)a.size() - 1; i >= 0; --i) {
        int s = (a[i] - '0') + (b[i] - '0') + carry;
        res += (char)('0' + s % 10);           // 当前位数字
        carry = s / 10;                        // 更新进位
    }
    if (carry) res += (char)('0' + carry);     // 最高位仍有进位则补 1
    reverse(res.begin(), res.end());           // 反转得到正确顺序
    return res;
}

// 判断字符串是否为回文
bool isPal(const string& s) {
    string t = s;
    reverse(t.begin(), t.end());
    return t == s;
}

int main() {
    string n;
    if (!(cin >> n)) return 0;

    // 若初始即为回文数，直接输出
    if (isPal(n)) {
        cout << n << " is a palindromic number." << endl;
        return 0;
    }

    // 最多迭代 10 次
    for (int i = 0; i < 10; ++i) {
        string r = n;
        reverse(r.begin(), r.end());           // 反转得到 reverse(N)
        string sum = add(n, r);                // 大整数加法
        cout << n << " + " << r << " = " << sum << endl;
        if (isPal(sum)) {
            cout << sum << " is a palindromic number." << endl;
            return 0;
        }
        n = sum;                               // 更新 N 为新的和，继续迭代
    }
    cout << "Not found in 10 iterations." << endl;
    return 0;
}
