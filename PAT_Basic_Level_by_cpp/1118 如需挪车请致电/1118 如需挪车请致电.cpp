/*
 * 1118 如需挪车请致电
 *
 * 【实现原理】
 * 题目给定 N 条停车记录，每条记录包含车牌号、进入时间、离开时间（格式 hh:mm）。
 * 需要累计每辆车的总停车分钟数，然后输出停车时间最长的车牌号及其总停车分钟数。
 * 若存在并列，输出最先出现的那辆车。
 *
 * 【算法思路】
 * 1. 实现 toMin() 函数将 "hh:mm" 格式的时间转换为从 00:00 开始的分钟数。
 * 2. 使用 map<string, int> 累计每辆车的总停车分钟数。
 * 3. 每次更新某辆车的累计时间后，检查是否更新最长停车记录（严格大于才更新，保证最先出现）。
 * 4. 输出车牌号和总分钟数。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N × log(N))，map 操作 O(log N)。
 * - 空间复杂度：O(N)，存储车辆信息。
 */
#include <iostream>
#include <string>
#include <map>

using namespace std;

/*
 * 将 "hh:mm" 格式的时间转换为从午夜开始的分钟数
 */
int toMin(const string& t) {
    int h = stoi(t.substr(0, 2));                // 提取小时
    int m = stoi(t.substr(3, 2));                // 提取分钟
    return h * 60 + m;                           // 转换为总分钟数
}

int main() {
    int n;
    if (!(cin >> n)) return 0;
    map<string, int> total;                      // 车牌号 -> 累计停车分钟数
    string best = "";
    int bestMin = -1;
    for (int i = 0; i < n; ++i) {
        string plate, tin, tout;
        cin >> plate >> tin >> tout;
        int dur = toMin(tout) - toMin(tin);      // 计算本次停车时长（分钟）
        total[plate] += dur;                     // 累加总时长
        if (total[plate] > bestMin) { bestMin = total[plate]; best = plate; } // 更新最长记录
    }
    cout << best << " " << bestMin << endl;       // 输出车牌号和总分钟数
    return 0;
}