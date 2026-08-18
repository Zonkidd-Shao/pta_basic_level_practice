/*
 * 1113 钱串子的加法
 *
 * 【实现原理】
 * 题目以字符串形式读入两个可能非常大的非负整数（超出普通整数类型范围），
 * 实现高精度加法计算它们的和并输出结果。
 *
 * 【算法思路】
 * 1. 实现高精度加法函数 add(a, b)：
 *    a. 从两个字符串的最低位（末尾）开始逐位相加。
 *    b. 维护进位 carry，每位计算 x + y + carry。
 *    c. 将当前位的结果（s % 10）加入结果字符串，进位更新为 s / 10。
 *    d. 处理完所有位后，若仍有进位则补 1。
 *    e. 最后将结果字符串反转得到正确顺序。
 * 2. 主函数读入两个字符串，调用 add 并输出。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(max(L1, L2))，其中 L1、L2 分别为两个数字字符串的长度。
 * - 空间复杂度：O(max(L1, L2))，存储结果字符串。
 */
#include <iostream>
#include <string>
#include <algorithm>

using namespace std;

/*
 * 高精度加法：计算两个非负整数字符串的和
 */
string add(const string& a, const string& b) {
    string res;
    int carry = 0;                               // 进位
    int i = (int)a.size() - 1, j = (int)b.size() - 1;
    while (i >= 0 || j >= 0 || carry) {
        int x = (i >= 0) ? a[i--] - '0' : 0;    // 从最低位取 a 的当前位
        int y = (j >= 0) ? b[j--] - '0' : 0;    // 从最低位取 b 的当前位
        int s = x + y + carry;
        res += (char)('0' + s % 10);             // 当前位结果存入字符串
        carry = s / 10;                          // 更新进位
    }
    reverse(res.begin(), res.end());             // 反转得到正确顺序
    return res;
}

int main() {
    string a, b;
    if (!(cin >> a >> b)) return 0;
    cout << add(a, b) << endl;                   // 输出高精度加法结果
    return 0;
}