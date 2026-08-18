/*
 * 1047 编程团体赛
 *
 * 【实现原理】
 * 每条记录格式为"队伍ID-队员ID 得分"，统计每个队伍的总分，
 * 输出总分最高的队伍编号及其总分。题目保证答案唯一。
 *
 * 【算法思路】
 * 1. 使用 team[1001] 数组，以队伍 ID 为索引累加得分
 * 2. 边输入边更新最高分队伍
 * 3. 输出最高分队伍的编号和总分
 *
 * 【关键点】
 * - 输入格式特殊：队伍ID-队员ID，使用 scanf 格式 "%d-%d %d" 解析
 * - 队伍编号范围隐含在题目中，最大不超过 1000
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N)，一次遍历即可
 * - 空间复杂度：O(M)，M 为队伍编号最大值范围（1001）
 */

#include <iostream>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;

    int team[1001] = {0};  // 队伍 ID 从 1 开始，最大不超过 1000
    int maxId = 1, maxScore = 0;

    for (int i = 0; i < n; ++i) {
        int tid, mid, score;  // tid=队伍ID, mid=队员ID, score=得分
        scanf("%d-%d %d", &tid, &mid, &score);  // 解析 "队伍ID-队员ID 得分" 格式
        team[tid] += score;   // 累加该队伍总分
        if (team[tid] > maxScore) {  // 实时更新最高分
            maxScore = team[tid];
            maxId = tid;
        }
    }

    cout << maxId << ' ' << maxScore << endl;
    return 0;
}