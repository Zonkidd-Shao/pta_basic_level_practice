// 1069 微博转发抽奖
//
// 实现原理：
// 从第 S 位用户开始，每隔 M-1 位抽取一位中奖者（即步长为 M）。
// 若某位用户已中奖，则顺延至下一位用户（即步长变为 1，直到找到未中奖用户）。
// 若 S > N（总人数），则输出"Keep going..."。
//
// 关键步骤：
// 1. 读取总人数 N、步长 M、起始位置 S
// 2. 读取所有用户名（从 1 开始编号）
// 3. 若 S > N，直接输出 Keep going... 并结束
// 4. 使用 set 记录已中奖用户
// 5. 从 i = S 开始遍历：
//    - 若 users[i] 未中奖，输出并标记，i += M
//    - 若已中奖，i += 1（顺延）
//
// 复杂度分析：
// 时间复杂度：O(N)，最多遍历所有用户一次。
// 空间复杂度：O(N)，用于存储用户名和已中奖集合。
#include <iostream>
#include <vector>
#include <string>
#include <set>

using namespace std;

int main() {
    int n, m, s;
    if (!(cin >> n >> m >> s)) return 0;

    // 用户编号从 1 开始
    vector<string> users(n + 1);
    for (int i = 1; i <= n; ++i) cin >> users[i];

    // 起始位置超过总人数，无人中奖
    if (s > n) {
        cout << "Keep going..." << endl;
        return 0;
    }

    set<string> won;  // 已中奖用户集合
    int i = s;
    while (i <= n) {
        if (won.find(users[i]) == won.end()) {
            cout << users[i] << endl;
            won.insert(users[i]);  // 标记已中奖
            i += m;                // 步进 M
        } else {
            ++i; // 已中奖，顺延至下一位
        }
    }
    return 0;
}