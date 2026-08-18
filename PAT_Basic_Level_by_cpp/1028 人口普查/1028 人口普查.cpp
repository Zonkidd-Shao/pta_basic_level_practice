/*
 * 1028 人口普查
 *
 * 【实现原理】
 * 给定若干人的姓名和生日信息，统计在合法年龄范围 [1814/09/06, 2014/09/06] 内的人数，
 * 并找出其中最年长（生日最早）和最年轻（生日最晚）的人名。
 * 若有效人数为 0，则仅输出 0。
 *
 * 【算法思路】
 * 1. 将日期字符串 "yyyy/mm/dd" 转换为整数 yyyymmdd 形式，便于比较
 * 2. 遍历每个人，判断生日是否在合法范围内（18140906 <= cur <= 20140906）
 * 3. 维护最年长（日期值最小）和最年轻（日期值最大）的姓名
 * 4. 最后按要求输出
 *
 * 【关键点】
 * - 日期比较技巧：将 yyyy/mm/dd 转换为整数 yyyymmdd，可直接用数值比较大小
 * - 日期值越小表示出生越早（越年长），日期值越大表示出生越晚（越年轻）
 * - 初始值设置：oldDate 初始化为最大可能值，youngDate 初始化为最小可能值
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N)，只需遍历一次所有记录
 * - 空间复杂度：O(1)，仅使用常数个变量
 */

#include <iostream>
#include <string>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;

    int cnt = 0;                    // 有效生日人数计数器
    string oldName, youngName;      // 最年长和最年轻者的姓名
    int oldDate = 99999999;         // 当前最年长者的生日（数值越小越年长），初始化为极大值
    int youngDate = 0;              // 当前最年轻者的生日（数值越大越年轻），初始化为极小值

    for (int i = 0; i < n; ++i) {
        string name, date;
        cin >> name >> date;
        // 将日期字符串解析为整数 yyyymmdd 形式，便于比较
        int y = stoi(date.substr(0, 4));   // 年份
        int m = stoi(date.substr(5, 2));   // 月份
        int d = stoi(date.substr(8, 2));   // 日期
        int cur = y * 10000 + m * 100 + d; // 转换为整数，如 20140906

        // 检查生日是否在合法范围内
        if (cur >= 18140906 && cur <= 20140906) {
            ++cnt;
            // 日期值越小表示出生越早，即越年长
            if (cur < oldDate) { oldDate = cur; oldName = name; }
            // 日期值越大表示出生越晚，即越年轻
            if (cur > youngDate) { youngDate = cur; youngName = name; }
        }
    }

    if (cnt == 0) {
        cout << 0 << endl;  // 无有效生日，仅输出 0
    } else {
        cout << cnt << ' ' << oldName << ' ' << youngName << endl;
    }
    return 0;
}