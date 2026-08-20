// 1065 单身狗
//
// 实现原理：
// 给定若干对情侣和参加派对的客人名单，定义"单身"为：没有伴侣，或伴侣未到场。
// 需要按 ID 升序输出所有单身客人。
//
// 算法思路：
// 1. 使用大小为 100000 的数组 couple 记录每人的伴侣（-1 表示无伴侣）
// 2. 使用布尔数组 present 标记到场客人
// 3. 遍历到场客人，若其伴侣不存在（couple[g] == -1）或伴侣未到场
//    （!present[couple[g]]），则将其加入单身列表
// 4. 排序后输出
//
// 注意：ID 为 5 位数字，输出时需用 %05d 补零。
//
// 复杂度分析：
// 时间复杂度：O(N + M logM)，N 为情侣对数，M 为客人数量。
// 空间复杂度：O(MAX_ID)，约 100000 的数组空间。
#include <iostream>
#include <vector>
#include <set>
#include <algorithm>
#include <cstdio>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;

    // couple[i] 表示 ID 为 i 的人的伴侣，-1 表示无伴侣
    vector<int> couple(100000, -1);
    for (int i = 0; i < n; ++i) {
        int a, b;
        cin >> a >> b;
        couple[a] = b;
        couple[b] = a;
    }

    int m;
    cin >> m;
    vector<int> guest(m);
    vector<bool> present(100000, false);
    for (int i = 0; i < m; ++i) {
        cin >> guest[i];
        present[guest[i]] = true;  // 标记该客人到场
    }

    // 筛选单身客人：无伴侣 或 伴侣未到场
    vector<int> single;
    for (int i = 0; i < m; ++i) {
        int g = guest[i];
        if (couple[g] == -1 || !present[couple[g]]) single.push_back(g);
    }
    sort(single.begin(), single.end());  // 按 ID 升序

    cout << single.size() << endl;
    for (size_t i = 0; i < single.size(); ++i) {
        if (i) cout << ' ';
        printf("%05d", single[i]);  // ID 为 5 位数字，补零输出
    }
    cout << endl;
    return 0;
}
