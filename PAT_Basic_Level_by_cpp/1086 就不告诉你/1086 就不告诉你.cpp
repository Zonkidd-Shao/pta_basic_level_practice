/*
 * 1086 就不告诉你
 *
 * 【实现原理】
 * 本题要求计算 A × B 的乘积，然后将乘积的数字按从个位到高位的顺序（即逆序）输出。
 * 题目名称"就不告诉你"暗示了结果需要"反过来"告诉别人。
 *
 * 【算法思路】
 * 1. 读取两个整数 A 和 B。
 * 2. 计算乘积 A * B。
 * 3. 将乘积转为字符串，反转字符串后输出。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(log(A*B))，主要开销在数字转字符串和反转操作。
 * - 空间复杂度：O(log(A*B))，用于存储乘积的字符串表示。
 */
#include <iostream>
#include <string>
#include <algorithm>

using namespace std;

int main() {
    int a, b;
    if (!(cin >> a >> b)) return 0;
    string s = to_string(a * b);  // 计算乘积并转为字符串
    reverse(s.begin(), s.end());  // 反转字符串（逆序输出）
    cout << s << endl;
    return 0;
}
