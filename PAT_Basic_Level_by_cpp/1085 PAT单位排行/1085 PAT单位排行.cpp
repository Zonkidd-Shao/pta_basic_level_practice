/*
 * 1085 PAT单位排行
 *
 * 【实现原理】
 * 本题要求统计各学校的 PAT 考生成绩并排序。每个考生有准考证号、分数和所属学校。
 * 学校名称不区分大小写，统一转为小写处理。
 * 学校总分 = 该校所有考生总分 / 该校考生人数（向下取整）。
 * 排名规则：
 * 1. 按校总分降序排列。
 * 2. 总分相同，按考生人数升序排列。
 * 3. 仍相同，按校名字母升序排列。
 *
 * 【算法思路】
 * 1. 用两个 map 分别存储各校总分（sum）和考生人数（cnt），键为小写校名。
 * 2. 遍历所有考生记录：
 *    a. 读取准考证号、分数、学校名。
 *    b. 将学校名转为小写，累加总分，增加人数。
 * 3. 将 map 数据转入 vector 并排序。
 * 4. 按排名规则输出：同分时排名相同，不同分时排名为实际序号 + 1。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N + K log K)，N 为考生总数，K 为学校总数。
 * - 空间复杂度：O(K)，用于存储各校统计数据。
 */
#include <iostream>
#include <string>
#include <map>
#include <vector>
#include <algorithm>
#include <cctype>

using namespace std;

// 学校信息结构体
struct Sch {
    string name;   // 校名（小写）
    int score;     // 总分（向下取整）
    int count;     // 考生人数
};

int main() {
    int n;
    if (!(cin >> n)) return 0;

    map<string, long long> sum;  // 各校总分（用 long long 避免溢出）
    map<string, int> cnt;        // 各校考生人数
    for (int i = 0; i < n; ++i) {
        string id, sch;
        int score;
        cin >> id >> score >> sch;
        for (char& c : sch) c = (char)tolower((unsigned char)c); // 校名统一转小写
        sum[sch] += score;  // 累加该校总分
        cnt[sch]++;         // 增加该校人数
    }

    vector<Sch> v;
    for (auto& kv : sum)
        v.push_back({kv.first, (int)(kv.second / cnt[kv.first]), cnt[kv.first]});
        // 总分 = 总成绩 / 人数（自动向下取整）

    // 排序：总分降序 → 人数升序 → 校名升序
    sort(v.begin(), v.end(), [](const Sch& a, const Sch& b) {
        if (a.score != b.score) return a.score > b.score;
        if (a.count != b.count) return a.count < b.count;
        return a.name < b.name;
    });

    cout << v.size() << endl;  // 输出学校总数
    int rank = 1;
    for (size_t i = 0; i < v.size(); ++i) {
        // 若与前一名分数不同，更新排名为实际序号 + 1
        if (i > 0 && v[i].score != v[i - 1].score) rank = (int)i + 1;
        cout << rank << " " << v[i].name << " " << v[i].score << " " << v[i].count << endl;
    }
    return 0;
}
