// 1072 开学寄语
//
// 实现原理：
// 给定需要被查缴的物品编号清单，以及每位学生的姓名缩写和携带的物品编号，
// 检查每位学生是否携带了需要被查缴的物品。
// 若某学生携带了违禁品，则按格式输出"姓名缩写: 物品编号1 物品编号2 ..."，
// 并统计存在问题的学生总人数和被查缴物品的总数。
//
// 关键步骤：
// 1. 使用 unordered_set 存储违禁品编号，便于 O(1) 查找。
// 2. 对每位学生，遍历其携带的所有物品，收集属于违禁品的编号。
// 3. 若该学生有违禁品，则输出其姓名缩写和所有违禁品编号，并累计人数与件数。
// 4. 最后输出存在问题的学生总人数和被查缴物品的总数。
//
// 复杂度分析：
// 时间复杂度：O(N*K)，N 为学生数，K 为每人携带物品数。
// 空间复杂度：O(M)，M 为违禁品种类数。
#include <iostream>
#include <string>
#include <unordered_set>
#include <vector>

using namespace std;

int main() {
    int n, m;
    if (!(cin >> n >> m)) return 0;

    // 读取需要被查缴的物品编号清单
    unordered_set<string> banned;
    for (int i = 0; i < m; ++i) {
        string s; cin >> s;
        banned.insert(s);
    }

    int stuCnt = 0, itemCnt = 0;  // 存在问题的学生人数、被查缴物品总数
    for (int i = 0; i < n; ++i) {
        string name;
        int k;
        cin >> name >> k;
        vector<string> items;  // 该学生携带的违禁品编号
        for (int j = 0; j < k; ++j) {
            string item;
            cin >> item;
            if (banned.count(item)) { items.push_back(item); ++itemCnt; }
        }
        if (!items.empty()) {
            ++stuCnt;
            cout << name << ":";
            for (size_t j = 0; j < items.size(); ++j) cout << ' ' << items[j];
            cout << endl;
        }
    }
    cout << stuCnt << ' ' << itemCnt << endl;  // 输出总人数和总件数
    return 0;
}
