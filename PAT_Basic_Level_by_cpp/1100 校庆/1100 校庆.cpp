/*
 * 1100 校庆
 *
 * 【实现原理】
 * 给定校友名单（每个校友有 ID 和出生日期）和到场嘉宾名单（每个嘉宾有 ID 和到达时间）。
 * 需要统计到场校友人数，并找出最早到达的校友（若到达时间相同，取出生日期更早者）。
 * 若没有校友到场，则输出 0 并找出所有嘉宾中最早到达的人。
 *
 * 【算法思路】
 * 1. 用 map<string, string> 存储校友信息，键为 ID，值为出生日期。
 * 2. 遍历到场嘉宾名单：
 *    a. 记录所有嘉宾中的最早到达者（guestId, guestTime）。
 *    b. 若该嘉宾在校友名单中（alumni.count(id) > 0）：
 *       - 到场校友计数 +1。
 *       - 更新最早的到场校友信息，比较规则：先比到达时间（早者优先），
 *         时间相同则比出生日期（更早者优先）。
 * 3. 输出结果：
 *    - 若有校友到场：输出校友人数和最早到达校友的 ID 与到达时间。
 *    - 若无校友到场：输出 0 和所有嘉宾中最早到达者的 ID 与到达时间。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N + M)，N 为校友数，M 为嘉宾数。
 * - 空间复杂度：O(N)，用于存储校友信息。
 */
#include <iostream>
#include <string>
#include <unordered_set>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;
    unordered_set<string> alumni;
    for (int i = 0; i < n; ++i) {
        string id;
        cin >> id;
        alumni.insert(id);
    }

    int m;
    cin >> m;
    int alumCount = 0;                     // 到场校友人数
    string oldestAlum, oldestGuest;
    bool hasAlum = false, hasGuest = false;

    for (int i = 0; i < m; ++i) {
        string id;
        cin >> id;
        if (!hasGuest || id.substr(6, 8) < oldestGuest.substr(6, 8)) {
            oldestGuest = id;
            hasGuest = true;
        }

        if (alumni.count(id)) {
            ++alumCount;
            if (!hasAlum || id.substr(6, 8) < oldestAlum.substr(6, 8)) {
                hasAlum = true;
                oldestAlum = id;
            }
        }
    }

    if (hasAlum) {
        cout << alumCount << endl << oldestAlum << endl;
    } else {
        cout << 0 << endl << oldestGuest << endl;
    }
    return 0;
}
