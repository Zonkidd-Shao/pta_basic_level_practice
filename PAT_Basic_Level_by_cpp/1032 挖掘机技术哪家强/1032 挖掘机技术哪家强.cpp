/*
 * 1032 挖掘机技术哪家强
 *
 * 【实现原理】
 * 统计各所学校的总得分，找出总分最高的学校编号及其得分。
 * 题目保证答案唯一。
 *
 * 【算法思路】
 * 1. 使用 vector<int> 作为哈希表，学校编号作为索引，累加得分
 * 2. 在每次累加后，实时更新当前最高分和对应学校编号
 * 3. 遍历结束后输出结果
 *
 * 【关键点】
 * - 学校编号范围隐含在题目中，最大编号不超过 100000
 * - 采用边输入边处理的方式，无需额外遍历
 * - 实时更新最大值，可避免最终的二次扫描
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N)，只需遍历一次所有记录
 * - 空间复杂度：O(M)，M 为学校编号最大值范围（100001）
 */

#include <iostream>
#include <vector>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;

    // 学校编号从 1 开始，最大编号不超过 100000
    vector<int> school(100001, 0);
    int maxId = 1, maxScore = 0;  // 记录最高分的学校编号和分数

    for (int i = 0; i < n; ++i) {
        int id, score;
        cin >> id >> score;
        school[id] += score;  // 累加该学校得分

        // 实时更新最高分学校（利用短路特性，保证答案唯一）
        if (school[id] > maxScore) {
            maxScore = school[id];
            maxId = id;
        }
    }

    cout << maxId << ' ' << maxScore << endl;
    return 0;
}