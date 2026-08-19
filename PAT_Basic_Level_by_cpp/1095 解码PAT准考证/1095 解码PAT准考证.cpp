/*
 * 1095 解码PAT准考证
 *
 * 【实现原理】
 * PAT 准考证号为 13 位字符串，格式为：级别(1位) + 考场(3位) + 日期(6位) + 流水号(3位)。
 * 支持三种查询类型：
 * 类型 1：按给定级别（B/A/T）输出该级别所有考生，按分数降序、准考证号升序排列。
 * 类型 2：按给定考场号输出该考场的人数和总分。
 * 类型 3：按给定日期输出该日期下各考场的人数，按人数降序、考场号升序排列。
 * 若查询结果为空，输出 "NA"。
 *
 * 【算法思路】
 * 1. 读取所有考生信息（准考证号、姓名、分数）。
 * 2. 对每个查询：
 *    - 类型 1：遍历筛选出符合级别的考生，按规则排序后输出。
 *    - 类型 2：遍历统计符合考场号的考生人数和总分，输出。
 *    - 类型 3：遍历筛选出符合日期的考生，用 map 统计各考场人数，
 *      转入 vector 排序后输出。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N·M) 最坏情况，其中 N 为考生数，M 为查询数。
 *   每次查询都要遍历所有考生。
 * - 空间复杂度：O(N)，用于存储考生信息。
 */
#include <iostream>
#include <string>
#include <vector>
#include <map>
#include <algorithm>

using namespace std;

// 考生信息结构体
struct Stu {
    string ticket;   // 准考证号
    string name;     // 姓名
    int score;       // 分数
};

int main() {
    int n, m;  // n 为考生数，m 为查询数
    if (!(cin >> n >> m)) return 0;
    vector<Stu> s(n);
    for (int i = 0; i < n; ++i) cin >> s[i].ticket >> s[i].name >> s[i].score;

    for (int q = 1; q <= m; ++q) {
        int type;
        cin >> type;
        if (type == 1) {                  // 按级别查询
            char level;
            cin >> level;
            vector<Stu> res;
            for (auto& st : s) if (st.ticket[0] == level) res.push_back(st);  // 筛选符合级别
            if (res.empty()) { cout << "NA" << endl; continue; }
            // 排序：分数降序，同分则准考证号升序
            sort(res.begin(), res.end(), [](const Stu& a, const Stu& b) {
                if (a.score != b.score) return a.score > b.score;
                return a.ticket < b.ticket;
            });
            for (auto& st : res) cout << st.ticket << " " << st.name << " " << st.score << endl;
        } else if (type == 2) {           // 按考场查询
            string room;
            cin >> room;
            int cnt = 0, sum = 0;
            for (auto& st : s) if (st.ticket.substr(1, 3) == room) { ++cnt; sum += st.score; }
            if (cnt == 0) cout << "NA" << endl;
            else cout << cnt << " " << sum << endl;
        } else {                          // 类型 3：按日期查询
            string date;
            cin >> date;
            map<string, int> roomCnt;     // 统计各考场人数
            for (auto& st : s) if (st.ticket.substr(4, 6) == date) roomCnt[st.ticket.substr(1, 3)]++;
            if (roomCnt.empty()) { cout << "NA" << endl; continue; }
            // 转入 vector 排序：人数降序，考场号升序
            vector<pair<string, int>> v(roomCnt.begin(), roomCnt.end());
            sort(v.begin(), v.end(), [](const pair<string, int>& a, const pair<string, int>& b) {
                if (a.second != b.second) return a.second > b.second;
                return a.first < b.first;
            });
            for (auto& p : v) cout << p.first << " " << p.second << endl;
        }
    }
    return 0;
}
