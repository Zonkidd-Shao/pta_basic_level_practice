// 1059 C语言竞赛
//
// 实现原理：
// 竞赛按排名颁奖：第 1 名获得"Mystery Award"（神秘大奖），
// 排名为素数的选手获得"Minion"（小黄人），其余选手获得"Chocolate"（巧克力）。
// 支持多次查询，每个 ID 只能领奖一次，重复查询输出"Checked"，
// 不在名单中的 ID 输出"Are you kidding?"。
//
// 关键步骤：
// 1. 使用 unordered_map 建立 ID 到排名的映射（排名从 1 开始）
// 2. 使用 unordered_map 记录每个 ID 是否已领奖
// 3. 对每个查询：
//    a. 若 ID 不在映射中，输出 Are you kidding?
//    b. 若已领奖，输出 Checked
//    c. 否则按排名颁发对应奖品并标记已领
//
// 素性判断函数 isPrime：
//   使用试除法，检查 x 能否被 2 到 sqrt(x) 之间的整数整除。
//   时间复杂度 O(√x)。
//
// 复杂度分析：
// 时间复杂度：O(N + K*√R)，其中 N 为参赛人数，K 为查询次数，R 为查询的排名值。
// 空间复杂度：O(N)，用于存储排名映射和领奖状态。
#include <iostream>
#include <string>
#include <unordered_map>

using namespace std;

// 试除法判断素数
bool isPrime(int x) {
    if (x < 2) return false;
    for (int i = 2; i * i <= x; ++i) if (x % i == 0) return false;
    return true;
}

int main() {
    int n;
    if (!(cin >> n)) return 0;

    unordered_map<string, int> rankOf; // ID -> 排名(从1开始)
    unordered_map<string, bool> got;    // 是否已领奖
    for (int i = 0; i < n; ++i) {
        string id;
        cin >> id;
        rankOf[id] = i + 1;
    }

    int k;
    cin >> k;
    for (int i = 0; i < k; ++i) {
        string id;
        cin >> id;
        auto it = rankOf.find(id);
        if (it == rankOf.end()) {
            cout << id << ": Are you kidding?" << endl;  // 不在名单中
        } else if (got[id]) {
            cout << id << ": Checked" << endl;           // 已领过奖
        } else {
            int r = it->second;
            // 根据排名颁发对应的奖品
            if (r == 1) cout << id << ": Mystery Award" << endl;
            else if (isPrime(r)) cout << id << ": Minion" << endl;
            else cout << id << ": Chocolate" << endl;
            got[id] = true;  // 标记已领奖
        }
    }
    return 0;
}