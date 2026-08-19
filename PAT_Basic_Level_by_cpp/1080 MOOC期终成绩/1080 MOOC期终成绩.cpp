/*
 * 1080 MOOC期终成绩
 *
 * 【实现原理】
 * 本题要求统计 MOOC 课程学生的最终成绩并排名。学生有在线编程成绩 Gp、期中考试成绩 Gmid、
 * 和期末考试成绩 Gfinal。最终成绩 G 的计算规则：
 * - 仅当 Gp ≥ 200 时才有资格计算最终成绩。
 * - 必须参加期末考试（即 Gfinal 存在），否则不计入。
 * - 若 Gmid > Gfinal，则 G = round(Gmid × 0.4 + Gfinal × 0.6)；
 *   否则 G = Gfinal。
 * - 仅 G ≥ 60 的学生合格，按 G 降序、姓名升序输出。
 *
 * 【算法思路】
 * 1. 分别用三个 map（gp, gmid, gfinal）存储各阶段成绩，键为姓名。
 * 2. 遍历 gp 中所有学生（即有编程成绩的学生）：
 *    a. 若编程成绩 < 200，跳过。
 *    b. 查询期中成绩（不存在则为 -1），期末成绩（不存在则为 -1）。
 *    c. 若期末成绩不存在（未参加考试），跳过。
 *    d. 按规则计算最终成绩 g。
 *    e. 若 g ≥ 60，加入结果列表。
 * 3. 对结果列表按 g 降序、姓名升序排序。
 * 4. 输出所有合格学生的完整信息。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(P + M + F + K log K)，其中 P、M、F 分别为三阶段人数，K 为合格人数。
 * - 空间复杂度：O(P + M + F)，用于存储各阶段成绩。
 */
#include <iostream>
#include <string>
#include <map>
#include <vector>
#include <algorithm>
#include <cmath>

using namespace std;

// 学生信息结构体
struct Stu {
    string name;    // 姓名
    int gp;         // 编程成绩
    int gmid;       // 期中成绩
    int gfinal;     // 期末成绩
    int g;          // 最终成绩
};

int main() {
    int np, nm, nf;  // 编程、期中、期末三个阶段的人数
    if (!(cin >> np >> nm >> nf)) return 0;

    // 分别用三个 map 存储各阶段成绩，以姓名为键
    map<string, int> gp, gmid, gfinal;
    for (int i = 0; i < np; ++i) { string n; int v; cin >> n >> v; gp[n] = v; }
    for (int i = 0; i < nm; ++i) { string n; int v; cin >> n >> v; gmid[n] = v; }
    for (int i = 0; i < nf; ++i) { string n; int v; cin >> n >> v; gfinal[n] = v; }

    vector<Stu> res;  // 存储合格学生的信息
    for (auto& kv : gp) {
        string name = kv.first;
        int p = kv.second;          // 编程成绩
        if (p < 200) continue;      // 编程成绩须 ≥ 200 才有资格

        int m = gmid.count(name) ? gmid[name] : -1;    // 期中成绩，缺考为 -1
        int f = gfinal.count(name) ? gfinal[name] : -1; // 期末成绩，缺考为 -1
        if (f == -1) continue;      // 必须参加期末考试

        // 计算最终成绩：期中 > 期末时加权计算，否则取期末成绩
        int g = (m > f) ? (int)round(m * 0.4 + f * 0.6) : f;
        if (g >= 60) res.push_back({name, p, m, f, g});  // 仅保留合格学生
    }

    // 排序：按最终成绩降序，成绩相同按姓名升序
    sort(res.begin(), res.end(), [](const Stu& a, const Stu& b) {
        if (a.g != b.g) return a.g > b.g;
        return a.name < b.name;
    });

    // 输出所有合格学生信息
    for (auto& s : res)
        cout << s.name << " " << s.gp << " " << s.gmid << " " << s.gfinal << " " << s.g << endl;
    return 0;
}
