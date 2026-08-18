/*
 * 1082 射击比赛
 *
 * 【实现原理】
 * 本题要求从一组射击选手中，找出距离靶心（原点 (0,0)）最近和最远的选手，
 * 输出他们的编号。距离使用平方和衡量（避免开平方带来的浮点数误差）。
 *
 * 【算法思路】
 * 1. 读取选手人数 n。
 * 2. 对每位选手，读取编号和坐标 (x, y)。
 * 3. 计算距离平方 d = x² + y²（使用 long long 避免整数溢出）。
 * 4. 维护最小距离 minD 及其对应的选手编号 minId。
 * 5. 维护最大距离 maxD 及其对应的选手编号 maxId。
 * 6. 输出最近和最远选手的编号。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(n)，只需一次遍历。
 * - 空间复杂度：O(1)，只使用常数额外空间。
 */
#include <iostream>
#include <string>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;
    string minId, maxId;      // 最近和最远选手的编号
    long long minD = 1LL << 60, maxD = -1;  // 初始化最小距离为极大值，最大距离为 -1
    for (int i = 0; i < n; ++i) {
        string id;
        int x, y;
        cin >> id >> x >> y;
        long long d = (long long)x * x + (long long)y * y;  // 计算距离平方，避免 sqrt
        if (d < minD) { minD = d; minId = id; }  // 更新最近选手
        if (d > maxD) { maxD = d; maxId = id; }  // 更新最远选手
    }
    cout << minId << " " << maxId << endl;
    return 0;
}
