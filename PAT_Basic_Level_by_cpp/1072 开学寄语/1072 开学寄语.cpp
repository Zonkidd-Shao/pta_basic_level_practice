// 1072 开学寄语
//
// 实现原理：
// 给定违禁品清单和每位学生携带的物品列表，检查哪些学生携带了违禁品。
// 若某学生携带违禁品，则输出"Student X is a joker!"，并统计被没收的违禁品总件数。
// 注意：一个学生可能携带多个违禁品，每件都被没收计数。
//
// 关键步骤：
// 1. 使用 unordered_set 存储违禁品清单，便于 O(1) 查找
// 2. 对每位学生，遍历其携带的所有物品
// 3. 若物品在违禁品集合中，则标记该学生为违规，并累计违禁品总数
// 4. 输出违规学生信息和总没收数
//
// 复杂度分析：
// 时间复杂度：O(N*K)，N 为学生数，K 为每人携带物品数。
// 空间复杂度：O(M)，M 为违禁品种类数。
#include <iostream>
#include <string>
#include <unordered_set>

using namespace std;

int main() {
    int n, m;
    if (!(cin >> n >> m)) return 0;

    // 读取违禁品清单
    unordered_set<string> banned;
    for (int i = 0; i < m; ++i) {
        string s; cin >> s;
        banned.insert(s);
    }

    int total = 0;
    for (int i = 1; i <= n; ++i) {
        int k;
        cin >> k;
        bool joke = false;
        for (int j = 0; j < k; ++j) {
            string item;
            cin >> item;
            if (banned.count(item)) { joke = true; ++total; }  // 查获违禁品
        }
        if (joke) cout << "Student " << i << " is a joker!" << endl;  // 该学生违规
    }
    cout << total << endl;  // 总没收件数
    return 0;
}