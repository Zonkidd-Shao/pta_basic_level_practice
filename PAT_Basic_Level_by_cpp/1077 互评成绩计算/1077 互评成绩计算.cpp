/*
 * 1077 互评成绩计算
 *
 * 【实现原理】
 * 本题要求计算每位学生的最终成绩。每位学生有一个老师评分和 (N-1) 个同学互评分。
 * 互评分需要去掉一个最高分和一个最低分后取平均（四舍五入），
 * 最终成绩 = 老师评分 × 0.4 + 互评平均分 × 0.6，结果四舍五入取整。
 *
 * 【算法思路】
 * 1. 读取学生数 n 和满分值 m（m 用于约束分数范围，但此实现中未显式使用）。
 * 2. 对每位学生：
 *    a. 读取老师评分 teacher。
 *    b. 读取 (n-1) 个互评分存入 vector。
 *    c. 对互评分排序，去掉首尾（最低和最高分）。
 *    d. 计算剩余互评分的平均值 g1。
 *    e. 按公式计算最终成绩 g = round(teacher × 0.4 + g1 × 0.6)。
 * 3. 输出每位学生的最终成绩。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(n² log n)，每位学生需要对 O(n) 个互评分排序。
 * - 空间复杂度：O(n)，用于存储互评分数组。
 */
#include <iostream>
#include <vector>
#include <algorithm>
#include <cmath>

using namespace std;

int main() {
    int n, m; // n 为学生数，m 为满分值（用于约束分数范围）
    if (!(cin >> n >> m)) return 0;

    for (int i = 0; i < n; ++i) {
        int teacher;
        cin >> teacher;                    // 读取老师评分
        vector<int> peers;                 // 存储互评分
        for (int j = 0; j < n - 1; ++j) {
            int s; cin >> s;
            peers.push_back(s);
        }
        if (!peers.empty()) {
            sort(peers.begin(), peers.end());  // 排序以便去掉最高和最低分
            peers.erase(peers.begin());        // 去掉最低分
            peers.pop_back();                  // 去掉最高分
        }
        double g1 = 0;
        for (int s : peers) g1 += s;           // 求和
        if (!peers.empty()) g1 /= peers.size();// 求平均分

        // 最终成绩 = 老师分×0.4 + 互评平均分×0.6，四舍五入取整
        int g = (int)round(teacher * 0.4 + g1 * 0.6);
        cout << g << endl;
    }
    return 0;
}
