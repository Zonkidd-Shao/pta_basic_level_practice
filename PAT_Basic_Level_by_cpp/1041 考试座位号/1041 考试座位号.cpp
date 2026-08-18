/*
 * 1041 考试座位号
 *
 * 【实现原理】
 * 每个考生有三个信息：准考证号（15位字符串）、试机座位号（1~N）、考试座位号（1~N）。
 * 给定若干试机座位号的查询，输出对应该试机座位号的考生的准考证号和考试座位号。
 *
 * 【算法思路】
 * 1. 使用两个数组 ticket[1001] 和 exam[1001]，以试机座位号作为索引存储信息
 * 2. 读入 N 个考生信息，将准考证号存入 ticket[ts]，考试座位号存入 exam[ts]
 * 3. 对每个查询的试机座位号，直接通过数组索引 O(1) 获取并输出
 *
 * 【关键点】
 * - 试机座位号范围已知（1~N，N <= 1000），可直接用数组索引
 * - 准考证号为 15 位字符串，使用 string 存储
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N + M)，N 为考生数，M 为查询数
 * - 空间复杂度：O(N)，存储考生信息
 */

#include <iostream>
#include <string>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;

    string ticket[1001];  // 试机座位号 -> 准考证号
    int exam[1001];       // 试机座位号 -> 考试座位号

    for (int i = 0; i < n; ++i) {
        string t;
        int ts, es;
        cin >> t >> ts >> es;
        ticket[ts] = t;   // 以试机座位号为索引存储
        exam[ts] = es;
    }

    int m;
    cin >> m;
    for (int i = 0; i < m; ++i) {
        int q;
        cin >> q;
        // 直接通过试机座位号索引查询
        cout << ticket[q] << ' ' << exam[q] << endl;
    }
    return 0;
}