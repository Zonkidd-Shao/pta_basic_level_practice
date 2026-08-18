/*
 * 1090 危险品装箱
 *
 * 【实现原理】
 * 给定若干互斥物品对（即不能同时装箱的危险品组合），
 * 对每个查询的装箱清单，判断是否含有任何互斥对。
 * 若清单中没有任何互斥对同时出现，则装箱是安全的（Yes），否则危险（No）。
 *
 * 【算法思路】
 * 1. 用 map<int, vector<int>> 存储每个物品的所有互斥物品列表（双向存储）。
 * 2. 对每个查询：
 *    a. 读取 k 个物品编号，存入数组 list 和哈希集合 items（用于快速查找）。
 *    b. 遍历 list 中的每个物品 x：
 *       - 若 x 有互斥物品列表，检查其每个互斥物品 y 是否出现在 items 中。
 *       - 若存在，则标记为不安全（safe = false），跳出循环。
 *    c. 根据安全标记输出 "Yes" 或 "No"。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N + M·K)，N 为互斥对数，M 为查询数，K 为平均装箱物品数。
 * - 空间复杂度：O(N)，用于存储互斥关系。
 */
#include <iostream>
#include <vector>
#include <map>
#include <unordered_set>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;

    map<int, vector<int>> incomp;  // 互斥关系表，键为物品，值为与其互斥的物品列表
    for (int i = 0; i < n; ++i) {
        int a, b;
        cin >> a >> b;
        incomp[a].push_back(b);    // 双向存储互斥关系
        incomp[b].push_back(a);
    }

    int m;
    cin >> m;
    for (int i = 0; i < m; ++i) {
        int k;
        cin >> k;
        unordered_set<int> items;  // 当前装箱清单（哈希集合，用于 O(1) 查找）
        vector<int> list(k);       // 同时保留列表顺序用于遍历
        for (int j = 0; j < k; ++j) { cin >> list[j]; items.insert(list[j]); }

        bool safe = true;
        for (int x : list) {          // 遍历每个物品
            if (incomp.count(x)) {    // 若该物品有互斥物品
                for (int y : incomp[x])        // 检查每个互斥物品
                    if (items.count(y)) { safe = false; break; }  // 互斥物品也在清单中 → 危险
            }
            if (!safe) break;
        }
        cout << (safe ? "Yes" : "No") << endl;
    }
    return 0;
}
